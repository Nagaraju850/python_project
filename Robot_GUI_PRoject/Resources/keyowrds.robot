*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${AMAZON_URL}    https://www.amazon.com

*** Keywords ***
Open Amazon Home Page
    Open Browser    ${AMAZON_URL}    Chrome
    Maximize Browser Window
    Wait Until Page Contains Element    id=twotabsearchtextbox    20 seconds

Search Amazon For Product
    [Arguments]    ${search_term}
    Input Text    id=twotabsearchtextbox    ${search_term}
    Press Keys    id=twotabsearchtextbox    ENTER