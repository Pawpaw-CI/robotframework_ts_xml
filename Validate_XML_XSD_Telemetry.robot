*** Settings ***
Documentation    Validate the subsystem XML definition files.
Test Setup    Run Keyword If    "${ContInt}"=="true"    Set Suite Variable    ${xml}    xmlstarlet
Library    OperatingSystem
Resource    Global_Vars.robot

*** Variables ***
${xml}    xml

*** Test Cases ***
Validate Camera Telemetry
    [Documentation]    Validate the Camera Telemetry XML file.
    [Tags]    smoke
    ${output}=    Run    ${xml} val -e --xsd ${folder}/schema/SALTelemetrySet.xsd ${folder}/sal_interfaces/camera/camera_Telemetry.xml
    Log    ${output}
    Should Contain    ${output}    camera_Telemetry.xml - valid

Validate DM Telemetry
    [Documentation]    Validate the DM Telemetry XML file.
    [Tags]    smoke    skipped    # DM currently has no commands
    ${output}=    Run    ${xml} val -e --xsd ${folder}/schema/SALTelemetrySet.xsd ${folder}/sal_interfaces/dm/dm_Telemetry.xml
    Log    ${output}
    Should Contain    ${output}    dm_Telemetry.xml - valid

Validate Dome Telemetry
    [Documentation]    Validate the Dome Telemetry XML file.
    [Tags]    smoke
    ${output}=    Run    ${xml} val -e --xsd ${folder}/schema/SALTelemetrySet.xsd ${folder}/sal_interfaces/dome/dome_Telemetry.xml
    Log    ${output}
    Should Contain    ${output}    dome_Telemetry.xml - valid

Validate DomeADB Telemetry
    [Documentation]    Validate the DomeADB Telemetry XML file.
    [Tags]    smoke
    ${output}=    Run    ${xml} val -e --xsd ${folder}/schema/SALTelemetrySet.xsd ${folder}/sal_interfaces/domeADB/domeADB_Telemetry.xml
    Log    ${output}
    Should Contain    ${output}    domeADB_Telemetry.xml - valid

Validate DomeAPS Telemetry
    [Documentation]    Validate the DomeAPS Telemetry XML file.
    [Tags]    smoke
    ${output}=    Run    ${xml} val -e --xsd ${folder}/schema/SALTelemetrySet.xsd ${folder}/sal_interfaces/domeAPS/domeAPS_Telemetry.xml
    Log    ${output}
    Should Contain    ${output}    domeAPS_Telemetry.xml - valid

Validate DomeLWS Telemetry
    [Documentation]    Validate the DomeLWS Telemetry XML file.
    [Tags]    smoke
    ${output}=    Run    ${xml} val -e --xsd ${folder}/schema/SALTelemetrySet.xsd ${folder}/sal_interfaces/domeLWS/domeLWS_Telemetry.xml
    Log    ${output}
    Should Contain    ${output}    domeLWS_Telemetry.xml - valid

Validate DomeLouvers Telemetry
    [Documentation]    Validate the DomeLouvers Telemetry XML file.
    [Tags]    smoke
    ${output}=    Run    ${xml} val -e --xsd ${folder}/schema/SALTelemetrySet.xsd ${folder}/sal_interfaces/domeLouvers/domeLouvers_Telemetry.xml
    Log    ${output}
    Should Contain    ${output}    domeLouvers_Telemetry.xml - valid

Validate DomeMONCS Telemetry
    [Documentation]    Validate the DomeMONCS Telemetry XML file.
    [Tags]    smoke
    ${output}=    Run    ${xml} val -e --xsd ${folder}/schema/SALTelemetrySet.xsd ${folder}/sal_interfaces/domeMONCS/domeMONCS_Telemetry.xml
    Log    ${output}
    Should Contain    ${output}    domeMONCS_Telemetry.xml - valid

Validate DomeTHCS Telemetry
    [Documentation]    Validate the DomeTHCS Telemetry XML file.
    [Tags]    smoke
    ${output}=    Run    ${xml} val -e --xsd ${folder}/schema/SALTelemetrySet.xsd ${folder}/sal_interfaces/domeTHCS/domeTHCS_Telemetry.xml
    Log    ${output}
    Should Contain    ${output}    domeTHCS_Telemetry.xml - valid

Validate Hexapod Telemetry
    [Documentation]    Validate the Hexapod Telemetry XML file.
    [Tags]    smoke
    ${output}=    Run    ${xml} val -e --xsd ${folder}/schema/SALTelemetrySet.xsd ${folder}/sal_interfaces/hexapod/hexapod_Telemetry.xml
    Log    ${output}
    Should Contain    ${output}    hexapod_Telemetry.xml - valid

Validate M1M3 Telemetry
    [Documentation]    Validate the M1M3 Telemetry XML file.
    [Tags]    smoke
    ${output}=    Run    ${xml} val -e --xsd ${folder}/schema/SALTelemetrySet.xsd ${folder}/sal_interfaces/m1m3/m1m3_Telemetry.xml
    Log    ${output}
    Should Contain    ${output}    m1m3_Telemetry.xml - valid

Validate M2MS Telemetry
    [Documentation]    Validate the M2MS Telemetry XML file.
    [Tags]    smoke
    ${output}=    Run    ${xml} val -e --xsd ${folder}/schema/SALTelemetrySet.xsd ${folder}/sal_interfaces/m2ms/m2ms_Telemetry.xml
    Log    ${output}
    Should Contain    ${output}    m2ms_Telemetry.xml - valid

Validate MTMount Telemetry
    [Documentation]    Validate the MTMount Telemetry XML file.
    [Tags]    smoke
    ${output}=    Run    ${xml} val -e --xsd ${folder}/schema/SALTelemetrySet.xsd ${folder}/sal_interfaces/MTMount/MTMount_Telemetry.xml
    Log    ${output}
    Should Contain    ${output}    MTMount_Telemetry.xml - valid

Validate OCS Telemetry
    [Documentation]    Validate the OCS Telemetry XML file.
    [Tags]    smoke
    ${output}=    Run    ${xml} val -e --xsd ${folder}/schema/SALTelemetrySet.xsd ${folder}/sal_interfaces/ocs/ocs_Telemetry.xml
    Log    ${output}
    Should Contain    ${output}    ocs_Telemetry.xml - valid

Validate Rotator Telemetry
    [Documentation]    Validate the Rotator Telemetry XML file.
    [Tags]    smoke
    ${output}=    Run    ${xml} val -e --xsd ${folder}/schema/SALTelemetrySet.xsd ${folder}/sal_interfaces/rotator/rotator_Telemetry.xml
    Log    ${output}
    Should Contain    ${output}    rotator_Telemetry.xml - valid

Validate Scheduler Telemetry
    [Documentation]    Validate the Scheduler Telemetry XML file.
    [Tags]    smoke
    ${output}=    Run    ${xml} val -e --xsd ${folder}/schema/SALTelemetrySet.xsd ${folder}/sal_interfaces/scheduler/scheduler_Telemetry.xml
    Log    ${output}
    Should Contain    ${output}    scheduler_Telemetry.xml - valid

Validate TCS Telemetry
    [Documentation]    Validate the TCS Telemetry XML file.
    [Tags]    smoke
    ${output}=    Run    ${xml} val -e --xsd ${folder}/schema/SALTelemetrySet.xsd ${folder}/sal_interfaces/tcs/tcs_Telemetry.xml
    Log    ${output}
    Should Contain    ${output}    tcs_Telemetry.xml - valid
