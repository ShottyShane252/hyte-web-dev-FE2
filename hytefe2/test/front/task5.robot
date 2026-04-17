*** Settings ***
Library    Browser    auto_closing_level=KEEP
Variables    ../../resources/load_env.py

*** Test Cases ***
Tehtävä -Login w/.env

    New Browser    chromium    headless=No
    New Page       http://localhost:5173/login.html
    Get Title      ==    Dear Diary - Login

    Type Text      id=login-username    ${Username}    delay=0.1s
    Type Secret    id=login-password     $Password    delay=0.1s
    Click          css=input[value="Login"]
