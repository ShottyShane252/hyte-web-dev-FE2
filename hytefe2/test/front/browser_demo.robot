*** Settings ***
Library     Browser    auto_closing_level=KEEP
Resource    Keywords.robot

*** Test Cases ***
Test Web Form
    New Browser    chromium    headless=No
    New Page       http://localhost:5173/login.html
    Get Title      ==    Dear Diary - Login
    Type Text      id=login-username        ${Username}    delay=0.1 s
    Type Secret    id=login-password   $Password      delay=0.1 s
    Click    css=input[value="Login"]
    
