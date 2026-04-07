*** Settings ***
Library     Browser    auto_closing_level=KEEP
Variables    ../../load_env.py


*** Test Cases ***
Login with env
    New Browser    chromium    headless=No
    New Page       http://localhost:5173/login.html
    Get Title      ==    Dear Diary - Login

    Type Text      id=login-username        ${Username}    delay=0.1 s
    Type Secret    id=login-password   $Password      delay=0.1 s
    Click    css=input[value="Login"]

    Sleep    1s

    Go To    http://localhost:5173/diary.html

# Command
# robot -d outputs test/front/task5.robot
