*** Settings ***
Library     Browser    auto_closing_level=KEEP
Resource    Keywords.robot
Variables    ../../load_env.py
Library    CryptoLibrary    variable_decryption=True

*** Test Cases ***
Login and Create Diary Entry
    New Browser    chromium    headless=No
    New Page       http://localhost:5173/login.html
    Get Title      ==    Dear Diary - Login
    Type Text      id=login-username        ${Username}    delay=0.1 s
    Type Secret    id=login-password   $Password      delay=0.1 s
    Click    css=input[value="Login"]

    Sleep    1s

    Go To    http://localhost:5173/diary.html
    Get Title      ==    Dear Diary - My Diary
    Fill Text      id=entryDate    2026-03-31
    # Mood
    Select Options By    id=mood    value    great
    #Sleep
    Fill Text    id=sleep    txt=8
    #How was your day?
    Fill Text        id=notes       txt=This entry was made by robot!!
    # Save entry <button type="submit" class="btn">Save Entry</button>
    Click    css=button[type="submit"]

# Command
# robot -d outputs test/front/browser_demo.robot
