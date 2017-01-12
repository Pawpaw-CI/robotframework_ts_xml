*** Settings ***
Documentation    Validate the subsystem XML definition files.
Test Setup    Run Keyword If    "${ContInt}"=="true"    Set Suite Variable    ${xml}    xmlstarlet
Library    OperatingSystem
Resource    Global_Vars.robot

*** Variables ***
${xml}    xml

*** Test Cases ***
Validate Camera Events
    [Documentation]    Validate the Camera Events XML file.
    [Tags]    smoke
    ${output}=    Run    ${xml} val -e --xsd ${folder}/schema/SALEventSet.xsd ${folder}/sal_interfaces/camera/camera_Events.xml
    Log    ${output}
    Should Contain    ${output}    camera_Events.xml - valid

Validate DM Events
    [Documentation]    Validate the DM Events XML file.
    [Tags]    smoke    skipped    # DM currently has no commands
    ${output}=    Run    ${xml} val -e --xsd ${folder}/schema/SALEventSet.xsd ${folder}/sal_interfaces/dm/dm_Events.xml
    Log    ${output}
    Should Contain    ${output}    dm_Events.xml - valid

Validate Dome Events
    [Documentation]    Validate the Dome Events XML file.
    [Tags]    smoke
    ${output}=    Run    ${xml} val -e --xsd ${folder}/schema/SALEventSet.xsd ${folder}/sal_interfaces/dome/dome_Events.xml
    Log    ${output}
    Should Contain    ${output}    dome_Events.xml - valid

Validate Hexapod Events
    [Documentation]    Validate the Hexapod Events XML file.
    [Tags]    smoke
    ${output}=    Run    ${xml} val -e --xsd ${folder}/schema/SALEventSet.xsd ${folder}/sal_interfaces/hexapod/hexapod_Events.xml
    Log    ${output}
    Should Contain    ${output}    hexapod_Events.xml - valid

Validate M1M3 Events
    [Documentation]    Validate the M1M3 Events XML file.
    [Tags]    smoke
    ${output}=    Run    ${xml} val -e --xsd ${folder}/schema/SALEventSet.xsd ${folder}/sal_interfaces/m1m3/m1m3_Events.xml
    Log    ${output}
    Should Contain    ${output}    m1m3_Events.xml - valid

Validate M2MS Events
    [Documentation]    Validate the M2MS Events XML file.
    [Tags]    smoke
    ${output}=    Run    ${xml} val -e --xsd ${folder}/schema/SALEventSet.xsd ${folder}/sal_interfaces/m2ms/m2ms_Events.xml
    Log    ${output}
    Should Contain    ${output}    m2ms_Events.xml - valid

Validate MTMount Events
    [Documentation]    Validate the MTMount Events XML file.
    [Tags]    smoke
    ${output}=    Run    ${xml} val -e --xsd ${folder}/schema/SALEventSet.xsd ${folder}/sal_interfaces/MTMount/MTMount_Events.xml
    Log    ${output}
    Should Contain    ${output}    MTMount_Events.xml - valid

Validate Rotator Events
    [Documentation]    Validate the Rotator Events XML file.
    [Tags]    smoke
    ${output}=    Run    ${xml} val -e --xsd ${folder}/schema/SALEventSet.xsd ${folder}/sal_interfaces/rotator/rotator_Events.xml
    Log    ${output}
    Should Contain    ${output}    rotator_Events.xml - valid

Validate TCS Events
    [Documentation]    Validate the TCS Events XML file.
    [Tags]    smoke
    ${output}=    Run    ${xml} val -e --xsd ${folder}/schema/SALEventSet.xsd ${folder}/sal_interfaces/tcs/tcs_Events.xml
    Log    ${output}
    Should Contain    ${output}    tcs_Events.xml - valid
