*** Settings ***
Resource    ../resources/equipment_keywords.resource

*** Test Cases ***
Get Equipments
    [Tags]    TC-001
    Create Equipment API Session
    ${response}=    Get Equipment Collection
    Should Be Equal As Integers    ${response.status_code}    200
    ${equipment}=    Set Variable    ${response.json()}
    ${equipment_count}=    Get Length    ${equipment}
    Should Be True    ${equipment_count} >= 20
    Should Be Equal As Integers    ${equipment}[0][id]    101
    Log To Console    ${equipment}

Get Equipment By ID
    [Tags]    TC-002
    Create Equipment API Session
    ${response}=    Request Equipment By ID    101
    Should Be Equal As Integers    ${response.status_code}    200
    ${equipment}=    Set Variable    ${response.json()}
    Should Be Equal As Integers    ${equipment}[id]    101
    Should Be Equal    ${equipment}[name]    Flight Control Unit

Get Equipment By Missing ID
    [Tags]    TC-003
    Create Equipment API Session
    ${response}=    Request Equipment By ID    999999    404
    Should Be Equal    ${response.json()}[error]    Item not found

Create Equipment
    [Tags]    TC-004
    Create Equipment API Session
    ${equipment_id}=    Convert To Integer    121
    ${new_equipment}=    Create Dictionary
    ...    id    ${equipment_id}
    ...    name    Robot Test Equipment
    ...    type    TEST
    ...    status    Operational
    ${response}=    Post Equipment    ${new_equipment}
    Should Be Equal As Integers    ${response.status_code}    201
    ${created_equipment}=    Set Variable    ${response.json()}
    Should Be Equal As Integers    ${created_equipment}[id]    121
    Should Be Equal    ${created_equipment}[name]    Robot Test Equipment
