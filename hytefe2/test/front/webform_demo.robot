*** Settings ***
Library     Browser    auto_closing_level=KEEP
Resource    Keywords.robot
Variables    ../../load_env.py
Library    Browser    auto_closing_level=KEEP
Library    CryptoLibrary    variable_decryption=True

*** Test Cases ***
Test Web Form
    New Browser    chromium    headless=No
    New Page       https://www.selenium.dev/selenium/web/web-form.html
    Get Title      ==    Web form
    Type Text      [name="my-text"]        ${Username}    delay=0.1 s
    Type Secret    [name="my-password"]    $Password      delay=0.1 s
    Type Text      [name="my-textarea"]    ${Message}
    Select Options By    [name="my-select"]    value    2
    Check Checkbox    selector=[id="my-check-2"]
    Click With Options    button    delay=2 s
    Get Text       id=message    ==    Received!

Testin API with Environment Variables
    Log         ${API_KEY}
    Log         ${BASE_URL}

