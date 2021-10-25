*** Settings ***
Documentation    Suite description
Resource  ../resources/kariyerNetIlanFilterApp.robot
Resource  ../resources/utilsApp.robot

Test Setup  utilsApp.create session
Test Teardown  utilsApp.close session

*** Test Cases ***
success login
    kariyerNetIlanFilterApp.go to kariyernet
    kariyerNetIlanFilterApp.click find job page
    kariyerNetIlanFilterApp.click filter button
    kariyerNetIlanFilterApp.check apply filters
    kariyerNetIlanFilterApp.check remove filter
    kariyerNetIlanFilterApp.check clear filter