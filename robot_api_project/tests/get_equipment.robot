*** Settings ***
Library         RequestsLibrary

*** Variables ***
${BASE_URL}     http://127.0.0.1:5000

*** Test Cases ***
Get Equipments
    Create Session    Equipment_API    ${BASE_URL}
    ${response}=    GET On Session    Equipment_API    /api/equipments
    Should Be Equal As Integers    ${response.status_code}    200
    ${equipment}=    Set Variable    ${response.json()}
    Length Should Be    ${equipment}    20
    Log To Console    ${equipment}