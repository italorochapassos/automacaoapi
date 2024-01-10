*** Settings ***
Library           RequestsLibrary

*** Variables ***
${BASE_URL}       https://reqres.in/api
${ENDPOINT}       /users
${DATA}        {"name": "Italo Rocha", "job": "leader"} 

*** Test Cases ***
Criar um novo usuario
    Set Log Level  TRACE
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    # ${DATA}=       Create Dictionary    name=Italo Rocha    job=leader
    # ${DATA}=       Convert To String    ${DATA}
    Create Session    reqres    ${BASE_URL}
    ${response}=      Post On Session    reqres    ${ENDPOINT}    data=${DATA}    headers=${HEADERS}
    Log              Response Status Code: ${response.status_code}
    Log              Response Body: ${response.text}