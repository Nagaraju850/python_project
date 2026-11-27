*** Settings ***
Resource    ../Resources/keyowrds.robot
Test Teardown    Close All Browsers

*** Test Cases ***
Amazon Search Returns Results
    [Tags]    GUI-TC-001
    Open Amazon Home Page
    Search Amazon For Product    wireless mouse
    Wait Until Page Contains Element    css:div[data-component-type="s-search-result"]    20 seconds
