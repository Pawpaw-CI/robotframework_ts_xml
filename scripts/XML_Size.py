#!/usr/bin/env python
# -*- coding: utf-8 -*-
import glob
import re
import subprocess
import os

# =========
# Functions
# =========
#def GenerateTestCases(  str  ):
#print "Hello"
#return 

def CapitalizeSubsystem( subsystem ):
	if re.match("^dome\S+", subsystem):
		return subsystem[0].upper() + subsystem[1:]
	elif subsystem == "dm":
		return "DM"
	elif subsystem == "m1m3":
		return "M1M3"
	elif subsystem == "m2ms":
		return "M2MS"
	elif subsystem == "MTMount":
		return subsystem
	elif subsystem == "tcs":
		return "TCS"
	elif subsystem == "ocs":
		return "OCS"
	else:
		return subsystem.capitalize()

def GetSubsystemVersion( string ):
    # Right now, the topic version is controlled manually, which requries a 
    # manual configuration file.  If/when this is formallized, switch to
    # that source.
    version = ""
    with open("/Users/rbovill/bin/XML_Versions.txt") as versionfile:
        for line in versionfile:
            if string in line:
                line = versionfile.next()
                while line != "\n":
                    version+=line.split(" ")[1].rstrip() + "\\n"
                    line = versionfile.next()   #.split(" ")[1].rstrip()
    return version[:-2]


# =========
# Variables
# =========
subsystems = ['archiver', 'camera', 'catchuparchiver', 'dome', 'domeADB', 'domeAPS', 'domeLouvers', 'domeLWS', 'domeMONCS', 'domeTHCS', 'hexapod', 'm1m3', 'm2ms', 'MTMount', 'ocs', 'processingcluster', 'rotator', 'scheduler', 'sequencer', 'tcs']

# Create/Open test suite file.
file = open("../Validate_XML_Topic_Size.robot","w")

# Create Settings header.
file.write("*** Settings ***\n")
file.write("Documentation    Validate the subsystem XML definition files do not contain a Topic greater than 65536 bytes in total size.\n")
file.write("Suite Setup    Run Keywords    Create the DataType:Size Dictionary    AND    Run Keyword If    \"${ContInt}\"==\"true\"    Set Suite Variable    ${xml}    xmlstarlet\n")
file.write("Library    OperatingSystem\n")
file.write("Library    String\n")
file.write("Resource    Global_Vars.robot\n")
file.write("\n")

# Create Variables table.
file.write("*** Variables ***\n")
file.write("${xml}    xml\n")
file.write("\n")

# Create Test Case table.
file.write("*** Test Cases ***\n")

for subsystem in subsystems:
	# Get the list of XMLs for each CSC, to include Telemetry, Events and Commands.
	xmls = glob.glob("/Users/rbovill/trunk/ts_xml/sal_interfaces/" + subsystem + "/" + subsystem + "*")
	for xml in xmls:
		# Get the message type, i.e. Telemetry, Events, Commands.
		messageType = xml.split('/')[7].split('_')[1].split('.')[0]
		# Get the Topics for each message type.
		home = os.environ['HOME']
		salxmlpath = '/SAL' + messageType.rstrip("s") + 'Set/SAL' + messageType.rstrip("s")
		xmlfile = 'sal_interfaces/' + subsystem + '/' + subsystem + '_' + messageType + '.xml'
		topics = subprocess.check_output('xml sel -t -m "/' + salxmlpath + '/EFDB_Topic" -v . -n ' + home + '/trunk/ts_xml/' + xmlfile, shell=True).split()
		for index, topic in enumerate(topics):
			index += 1
			# Create the Test Cases.
			file.write("Validate " + CapitalizeSubsystem(subsystem) + " " + messageType.rstrip("s") + " " + topic + " Topic Size\n")
			file.write("\t[Documentation]    Validate the " + topic + " topic is less than 65536 bytes in total.\n")
			file.write("\t[Tags]    smoke\n")
			file.write("\t[Setup]    Set Test Variable    ${result}    ${0}\n")
			file.write("\tComment    Get the Count of each argument for the topic.\n")
			file.write("\t${itemCount}=    Run    ${xml} sel -t -v \"count(" + salxmlpath + "[" + str(index) + "]/item)\" -n ${folder}/" + xmlfile + "\n")
			file.write("\t${output}=    Run    ${xml} sel -t -m \"/" + salxmlpath + "[" + str(index) + "]/item/Count\" -v . -n ${folder}/" + xmlfile + "\n")
			file.write("\t@{CountArray}=    Split to Lines    ${output}\n")
			file.write("\tComment    Get the Type of each argument for the topic.\n")
			file.write("\t${output}=    Run    ${xml} sel -t -m \"/" + salxmlpath + "[" + str(index) + "]/item/IDL_Type\" -v . -n ${folder}/" + xmlfile + "\n")
			file.write("\t@{TypeArray}=    Split to Lines    ${output}\n")
			file.write("\t:FOR    ${index}    IN RANGE    ${itemCount}\n")
			file.write("\t\    ${key}=    Set Variable    @{TypeArray}[${index}]\n")
			file.write("\t\    Run Keyword If    '${key}'=='unsigned short'    Set Test Variable    ${key}    ushort\n")
			file.write("\t\    Run Keyword If    '${key}'=='unsigned long'    Set Test Variable    ${key}    ulong\n")
			file.write("\t\    Log Many    ${dict.${key}}    @{CountArray}[${index}]\n")
			file.write("\t\    ${output}=    Evaluate    ${dict.${key}}*@{CountArray}[${index}]\n")
			file.write("\t\    ${size}=    Convert to Number    ${output}\n")
			file.write("\t\    ${result}=    Evaluate    ${result}+${size}\n")
			file.write("\tLog    ${result}\n")
			file.write("\tShould Be True    ${result} < 65536\n")
			file.write("\n")

# Create Datatype:Size Dictionary
file.write("*** Keywords ***\n")
file.write("Create the DataType:Size Dictionary\n")
file.write("\t[Tags]    smoke\n")
file.write("\t&{dict}=    Create Dictionary    boolean=2    char=1    double=8    float=4    int=4    long=4    short=2    string=1    ushort=2    ulong=4\n")
file.write("\tLog Many    &{dict}\n")
file.write("\tSet Suite Variable    &{dict}\n")
file.write("\n")
