*** Settings ***
Library    Browser    auto_closing_level=KEEP

*** Test Cases ***
Tehtävä 3 - Web Form testaus
    New Browser    chromium    headless=No
    New Context
    New Page       https://www.selenium.dev/selenium/web/web-form.html

    Get Title      ==    Web form

    # Dropdown 
    Select Options By    [name="my-select"]    value    2

    # Checkbox
    Check Checkbox    selector=[id="my-check-2"]

    Sleep    2s

    Close Browser
