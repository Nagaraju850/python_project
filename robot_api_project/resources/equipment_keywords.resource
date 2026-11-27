*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    http://127.0.0.1:5000

*** Keywords ***
Create Equipment API Session
    Create Session    Equipment_API    ${BASE_URL}

Get Equipment Collection
    ${response}=    GET On Session    Equipment_API    /api/equipments
    RETURN    ${response}

Request Equipment By ID
    [Arguments]    ${equipment_id}    ${expected_status}=200
    ${response}=    GET On Session    Equipment_API    /api/equipment/${equipment_id}    expected_status=${expected_status}
    RETURN    ${response}

Post Equipment
    [Arguments]    ${equipment}
    ${response}=    POST On Session    Equipment_API    /api/equipment    json=${equipment}
    RETURN    ${response}
