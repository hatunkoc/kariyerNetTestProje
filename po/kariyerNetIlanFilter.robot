*** Settings ***
Library  SeleniumLibrary
Library  DebugLibrary
Library  FakerLibrary
Library    String

Resource  ./utils.robot

*** Variables ***

*** Keywords ***
go to kariyerNet page
  go to  ${HOMEPAGE}

check kariyerNet page
  wait until element is visible  id=btnFindWork
  wait until page contains  ÖNE ÇIKAN İŞ İLANLARI

click job button
  utils.click  css=button[role='button']
  utils.click  css=.is-ara

check job postings page
  wait until element is visible  css=[data-test='apply-button']

save the number of job postings no filter
  ${INNERTEXT1}=    Get Text    css=.mb-3.search-result-section.t-6.text-secondary
  ${ADVERT_TEXT1}=  Split String  ${INNERTEXT1}  \
  ${ADVERT_NUMBER4}=    Convert To Number  ${ADVERT_TEXT1}[0]
  set global variable  ${ADVERT_NUMBER4}


click city region filter
  utils.click  css=[data-test='city-arrow-icon']
  utils.click  css=[data-test='checkbox-item-value']
  utils.click  css=[data-test='close-icon']

click time filter
  utils.javascript click  css=div:nth-of-type(7) > .custom-control-label
  utils.javascript click  css=label[for='__BVID__240'] div[data-test='checkbox-item-value']

click apply button
  utils.javascript click  css=[data-test='apply-button']

save the number of job postings city time filter
  ${INNERTEXT2}=    Get Text    css=.mb-3.search-result-section.t-6.text-secondary
  ${ADVERT_TEXT2}=  Split String  ${INNERTEXT2}  \
  ${ADVERT_NUMBER5}=    Convert To Number  ${ADVERT_TEXT2}[0]
  set global variable  ${ADVERT_NUMBER5}

check city time filter control
  wait until element is visible  css=.chips-wrapper > div:nth-of-type(1) > span
  wait until element is visible  css=div:nth-of-type(2) > span
  wait until element is visible  css=div:nth-of-type(3) > span
  wait until element is visible  css=div:nth-of-type(4) > span
  wait until element is visible  css=div:nth-of-type(5) > span
  location should contain  istanbul
  location should contain  date=15
  location should contain  opj=1
  Should Be True    ${ADVERT_NUMBER5} < ${ADVERT_NUMBER4}

click remove filter button
  utils.click  css=div:nth-of-type(5) > .material-icons
  utils.click  css=div:nth-of-type(4) > .material-icons

check remove filter
  wait until element is not visible  css=div:nth-of-type(5) > span
  wait until element is not visible  css=div:nth-of-type(4) > span
  ${INNERTEXT3}=    Get Text    css=.mb-3.search-result-section.t-6.text-secondary
  ${ADVERT_TEXT3}=  Split String  ${INNERTEXT3}  \
  ${ADVERT_NUMBER7}=    Convert To Number  ${ADVERT_TEXT3}[0]
  set global variable  ${ADVERT_NUMBER7}
  Should Be True    ${ADVERT_NUMBER5} < ${ADVERT_NUMBER7}

click clear filters button
  utils.click  css=.clear-filter

save the number of job postings clear filter
  ${INNERTEXT3}=    Get Text    css=.mb-3.search-result-section.t-6.text-secondary
  ${ADVERT_TEXT3}=  Split String  ${INNERTEXT3}  \
  ${ADVERT_NUMBER6}=    Convert To Number  ${ADVERT_TEXT3}[0]
  set global variable  ${ADVERT_NUMBER6}

check clear filters
  wait until element is not visible  css=.chips-wrapper > div:nth-of-type(1) > span
  wait until element is not visible  css=.chips-wrapper > div:nth-of-type(2) > span
  wait until element is not visible  css=.chips-wrapper > div:nth-of-type(3) > span
  Should Be True    ${ADVERT_NUMBER7} < ${ADVERT_NUMBER6}



