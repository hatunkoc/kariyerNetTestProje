*** Settings ***
Resource  ../po/kariyerNetIlanFilter.robot

*** Keywords ***
go to kariyernet
    kariyerNetIlanFilter.go to kariyerNet page
    kariyerNetIlanFilter.check kariyerNet page

click find job page
    kariyerNetIlanFilter.click job button
    kariyerNetIlanFilter.check job postings page
    kariyerNetIlanFilter.save the number of job postings no filter

click filter button
    kariyerNetIlanFilter.click city region filter
    kariyerNetIlanFilter.click time filter

check apply filters
    kariyerNetIlanFilter.click apply button
    kariyerNetIlanFilter.save the number of job postings city time filter
    kariyerNetIlanFilter.check city time filter control

check remove filter
    kariyerNetIlanFilter.click remove filter button
    kariyerNetIlanFilter.check remove filter

check clear filter
    kariyerNetIlanFilter.click clear filters button
    kariyerNetIlanFilter.save the number of job postings clear filter
    kariyerNetIlanFilter.check clear filters
