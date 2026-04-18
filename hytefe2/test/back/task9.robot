*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}      http://127.0.0.1:3000
${USERNAME}      hanadm
${PASSWORD}      hanad123

*** Test Cases ***
Tehtävä 9 - Login test route works
    Create Session    backend    ${BASE_URL}
    ${response}=    GET On Session    backend    /api/users/login-test
    Status Should Be    200    ${response}
    Should Be Equal As Strings    ${response.json()}[message]    userRouter login route exists

Tehtävä 9 - Login returns token
    Create Session    backend    ${BASE_URL}
    ${body}=    Create Dictionary    username=${USERNAME}    password=${PASSWORD}
    ${response}=    POST On Session    backend    /api/users/login    json=${body}
    Status Should Be    200    ${response}

    ${response_json}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${response_json}    token

Tehtävä 9 - Get my user info with token
    Create Session    backend    ${BASE_URL}
    ${body}=    Create Dictionary    username=${USERNAME}    password=${PASSWORD}
    ${login_response}=    POST On Session    backend    /api/users/login    json=${body}
    Status Should Be    200    ${login_response}

    ${token}=    Set Variable    ${login_response.json()}[token]
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}

    ${me_response}=    GET On Session    backend    /api/users/me    headers=${headers}
    Status Should Be    200    ${me_response}

Tehtävä 9 - Get entries with token
    Create Session    backend    ${BASE_URL}
    ${body}=    Create Dictionary    username=${USERNAME}    password=${PASSWORD}
    ${login_response}=    POST On Session    backend    /api/users/login    json=${body}
    Status Should Be    200    ${login_response}

    ${token}=    Set Variable    ${login_response.json()}[token]
    ${headers}=    Create Dictionary    Authorization=Bearer ${token}

    ${entries_response}=    GET On Session    backend    /api/entries    headers=${headers}
    Status Should Be    200    ${entries_response}
