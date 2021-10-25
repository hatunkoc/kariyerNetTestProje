*** Settings ***
Library  SeleniumLibrary
Library  DebugLibrary
Library  FakerLibrary

*** Variables ***
${TIMEOUT}  10

*** Keywords ***
create session
  set selenium speed  0.5 seconds
  open browser  about:blank  ${BROWSER}
  maximize browser window

close session
  close browser