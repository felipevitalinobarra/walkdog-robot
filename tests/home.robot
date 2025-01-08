*** Settings ***
Documentation        Suite de testes da home page

Resource    ../resources/base.resource

Test Setup       Start Session
Test Teardown    Finish Session

*** Test Cases ***
Home page deve estar online   
    Get Text    h1    equal    Cuidado e diversão em cada passo

    Take Screenshot