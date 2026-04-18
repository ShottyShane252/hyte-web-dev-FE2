*** Settings ***
Library     Browser    auto_closing_level=KEEP
Library     CryptoLibrary    variable_decryption=True
Resource    Keywords.robot

*** Test Cases ***
Tehtävä 6 - Kirjautuminen salatuilla tunnuksilla
    New Browser    chromium    headless=No
    New Page    http://localhost:5173/login.html

    Get Title      ==    Dear Diary - Login

    Type Text    id=login-username     ${Username}    delay=0.1s
    Type Secret    id=login-password    $Password    delay=0.1s

    Click    css=input[value="Login"]
