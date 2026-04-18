*** Settings ***
Library    Browser    auto_closing_level=KEEP

*** Variables ***
${PASSWORD}    hanad123

*** Test Cases ***
Tehtävä 4 - Päiväkirja merkintä

    New Browser    chromium    headless=No
    New Page    http://localhost:5173/login.html

    Get Title    ==    Dear Diary - Login

    #Täytä käyttäjätiedot

    Type Text    id=login-username    hanadm    delay=0.1s
    Type Secret    id=login-password    $PASSWORD    delay=0.1s

    Click    css=input[value="Login"]
    Sleep    2s

    #Päiväkirja sivu

    Go To    http://localhost:5173/diary.html
    Get Title      ==    Dear Diary - My Diary
    #Täytä päiväkirja kentät
    Fill Text      id=entryDate    2026-03-31
    Select Options By    id=mood    value    great
    Fill Text      id=sleep    8
    Fill Text      id=notes    Task 4 robot entry second attempt

    Click    css=button[type="submit"]

    Sleep    10s
    Close Browser
