*** Settings ***
Library    Browser    auto_closing_level=KEEP

*** Variables ***
${PASSWORD}    hanad123

*** Test Cases ***
Tehtävä 2 - Kirjautumistesti
    New Browser        chromium    headless=No
    New Page       http://localhost:5173/login.html
    Get Title      ==    Dear Diary - Login

    #Täyttää käyttäjätiedot
    Type Text        id=login-username    hanadm    delay=0.1s
    Type Secret      id=login-password    $PASSWORD    delay=0.1s

    Click    selector=css=input[value="Login"]

    Close Browser
