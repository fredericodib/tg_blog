Feature: bdd_generator

	Scenario: authentication login
		Given There is an instance of User with id 1 and params: {"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"}
		Given There is an instance of User with id 2 and params: {"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"}
		Given There is an instance of User with id 3 and params: {"id":3,"name":"caderno","email":"30caderno@edd.cccesd","password_digest":"$2a$12$/I.pnmdSrOlFczYeUdOpbuWXqeP5pOGqnp/5SZaw.m9KUDKeXyWo.","created_at":"2021-03-25T17:14:53.195Z","updated_at":"2021-03-25T17:14:53.195Z","token":"KKTAe9iYvZJgPpjQdFpDxYy6"}
		When the client requests with POST /auth/login?email=30caderno@edd.cccesd&password=aaa123, body: {"email":"30caderno@edd.cccesd","password":"aaa123","controller":"authentication","action":"login"}, headers: {}
		Then the response status should be 200
		And The JSON response should be {"token":"KKTAe9iYvZJgPpjQdFpDxYy6","email":"30caderno@edd.cccesd"}

	Scenario: users index
		Given There is an instance of User with id 1 and params: {"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"}
		Given There is an instance of User with id 2 and params: {"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"}
		Given There is an instance of User with id 3 and params: {"id":3,"name":"caderno","email":"30caderno@edd.cccesd","password_digest":"$2a$12$/I.pnmdSrOlFczYeUdOpbuWXqeP5pOGqnp/5SZaw.m9KUDKeXyWo.","created_at":"2021-03-25T17:14:53.195Z","updated_at":"2021-03-25T17:14:53.195Z","token":"KKTAe9iYvZJgPpjQdFpDxYy6"}
		When the client requests with GET /users, body: {"controller":"users","action":"index"}, headers: {"Authorization":"KKTAe9iYvZJgPpjQdFpDxYy6"}
		Then the response status should be 200
		And The JSON response should be [{"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"},{"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"},{"id":3,"name":"caderno","email":"30caderno@edd.cccesd","password_digest":"$2a$12$/I.pnmdSrOlFczYeUdOpbuWXqeP5pOGqnp/5SZaw.m9KUDKeXyWo.","created_at":"2021-03-25T17:14:53.195Z","updated_at":"2021-03-25T17:14:53.195Z","token":"KKTAe9iYvZJgPpjQdFpDxYy6"}]

	Scenario: users index
		Given There is an instance of User with id 1 and params: {"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"}
		Given There is an instance of User with id 2 and params: {"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"}
		Given There is an instance of User with id 3 and params: {"id":3,"name":"caderno","email":"30caderno@edd.cccesd","password_digest":"$2a$12$/I.pnmdSrOlFczYeUdOpbuWXqeP5pOGqnp/5SZaw.m9KUDKeXyWo.","created_at":"2021-03-25T17:14:53.195Z","updated_at":"2021-03-25T17:14:53.195Z","token":"KKTAe9iYvZJgPpjQdFpDxYy6"}
		When the client requests with GET /users, body: {"controller":"users","action":"index"}, headers: {"Authorization":"KKTAe9iYvZJgPpjQdFpDxYy6"}
		Then the response status should be 200
		And The JSON response should be [{"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"},{"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"},{"id":3,"name":"caderno","email":"30caderno@edd.cccesd","password_digest":"$2a$12$/I.pnmdSrOlFczYeUdOpbuWXqeP5pOGqnp/5SZaw.m9KUDKeXyWo.","created_at":"2021-03-25T17:14:53.195Z","updated_at":"2021-03-25T17:14:53.195Z","token":"KKTAe9iYvZJgPpjQdFpDxYy6"}]

	Scenario: users index
		Given There is an instance of User with id 1 and params: {"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"}
		Given There is an instance of User with id 2 and params: {"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"}
		Given There is an instance of User with id 3 and params: {"id":3,"name":"caderno","email":"30caderno@edd.cccesd","password_digest":"$2a$12$/I.pnmdSrOlFczYeUdOpbuWXqeP5pOGqnp/5SZaw.m9KUDKeXyWo.","created_at":"2021-03-25T17:14:53.195Z","updated_at":"2021-03-25T17:14:53.195Z","token":"KKTAe9iYvZJgPpjQdFpDxYy6"}
		When the client requests with GET /users, body: {"controller":"users","action":"index"}, headers: {"Authorization":"KKTAe9iYvZJgPpjQdFpDxYy6"}
		Then the response status should be 200
		And The JSON response should be [{"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"},{"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"},{"id":3,"name":"caderno","email":"30caderno@edd.cccesd","password_digest":"$2a$12$/I.pnmdSrOlFczYeUdOpbuWXqeP5pOGqnp/5SZaw.m9KUDKeXyWo.","created_at":"2021-03-25T17:14:53.195Z","updated_at":"2021-03-25T17:14:53.195Z","token":"KKTAe9iYvZJgPpjQdFpDxYy6"}]

	Scenario: users index
		Given There is an instance of User with id 1 and params: {"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"}
		Given There is an instance of User with id 2 and params: {"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"}
		Given There is an instance of User with id 3 and params: {"id":3,"name":"caderno","email":"30caderno@edd.cccesd","password_digest":"$2a$12$/I.pnmdSrOlFczYeUdOpbuWXqeP5pOGqnp/5SZaw.m9KUDKeXyWo.","created_at":"2021-03-25T17:14:53.195Z","updated_at":"2021-03-25T17:14:53.195Z","token":"KKTAe9iYvZJgPpjQdFpDxYy6"}
		When the client requests with GET /users, body: {"controller":"users","action":"index"}, headers: {"Authorization":"KKTAe9iYvZJgPpjQdFpDxYy6"}
		Then the response status should be 200
		And The JSON response should be [{"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"},{"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"},{"id":3,"name":"caderno","email":"30caderno@edd.cccesd","password_digest":"$2a$12$/I.pnmdSrOlFczYeUdOpbuWXqeP5pOGqnp/5SZaw.m9KUDKeXyWo.","created_at":"2021-03-25T17:14:53.195Z","updated_at":"2021-03-25T17:14:53.195Z","token":"KKTAe9iYvZJgPpjQdFpDxYy6"}]

	Scenario: users update
		Given There is an instance of User with id 1 and params: {"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"}
		Given There is an instance of User with id 2 and params: {"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"}
		Given There is an instance of User with id 3 and params: {"id":3,"name":"caderno","email":"30caderno@edd.cccesd","password_digest":"$2a$12$/I.pnmdSrOlFczYeUdOpbuWXqeP5pOGqnp/5SZaw.m9KUDKeXyWo.","created_at":"2021-03-25T17:14:53.195Z","updated_at":"2021-03-25T17:14:53.195Z","token":"KKTAe9iYvZJgPpjQdFpDxYy6"}
		When the client requests with PATCH /user, body: {"user":{"name":"clarita caneca"},"controller":"users","action":"update"}, headers: {}
		Then the response status should be 401
		And The JSON response should be {"errors":"Not Authenticated"}

	Scenario: users index
		Given There is an instance of User with id 1 and params: {"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"}
		Given There is an instance of User with id 2 and params: {"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"}
		Given There is an instance of User with id 3 and params: {"id":3,"name":"caderno","email":"30caderno@edd.cccesd","password_digest":"$2a$12$/I.pnmdSrOlFczYeUdOpbuWXqeP5pOGqnp/5SZaw.m9KUDKeXyWo.","created_at":"2021-03-25T17:14:53.195Z","updated_at":"2021-03-25T17:14:53.195Z","token":"KKTAe9iYvZJgPpjQdFpDxYy6"}
		When the client requests with GET /users, body: {"controller":"users","action":"index"}, headers: {"Authorization":"KKTAe9iYvZJgPpjQdFpDxYy6"}
		Then the response status should be 200
		And The JSON response should be [{"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"},{"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"},{"id":3,"name":"caderno","email":"30caderno@edd.cccesd","password_digest":"$2a$12$/I.pnmdSrOlFczYeUdOpbuWXqeP5pOGqnp/5SZaw.m9KUDKeXyWo.","created_at":"2021-03-25T17:14:53.195Z","updated_at":"2021-03-25T17:14:53.195Z","token":"KKTAe9iYvZJgPpjQdFpDxYy6"}]

	Scenario: users show
		Given There is an instance of User with id 1 and params: {"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"}
		Given There is an instance of User with id 2 and params: {"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"}
		Given There is an instance of User with id 3 and params: {"id":3,"name":"caderno","email":"30caderno@edd.cccesd","password_digest":"$2a$12$/I.pnmdSrOlFczYeUdOpbuWXqeP5pOGqnp/5SZaw.m9KUDKeXyWo.","created_at":"2021-03-25T17:14:53.195Z","updated_at":"2021-03-25T17:14:53.195Z","token":"KKTAe9iYvZJgPpjQdFpDxYy6"}
		When the client requests with GET /users/3, body: {"controller":"users","action":"show","id":"3"}, headers: {"Authorization":"dedeed"}
		Then the response status should be 200
		And The JSON response should be {"id":3,"name":"caderno","email":"30caderno@edd.cccesd","password_digest":"$2a$12$/I.pnmdSrOlFczYeUdOpbuWXqeP5pOGqnp/5SZaw.m9KUDKeXyWo.","created_at":"2021-03-25T17:14:53.195Z","updated_at":"2021-03-25T17:14:53.195Z","token":"KKTAe9iYvZJgPpjQdFpDxYy6"}

	Scenario: users update
		Given There is an instance of User with id 1 and params: {"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"}
		Given There is an instance of User with id 2 and params: {"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"}
		Given There is an instance of User with id 3 and params: {"id":3,"name":"caderno","email":"30caderno@edd.cccesd","password_digest":"$2a$12$/I.pnmdSrOlFczYeUdOpbuWXqeP5pOGqnp/5SZaw.m9KUDKeXyWo.","created_at":"2021-03-25T17:14:53.195Z","updated_at":"2021-03-25T17:14:53.195Z","token":"KKTAe9iYvZJgPpjQdFpDxYy6"}
		When the client requests with PATCH /user, body: {"user":{"name":"clarita caneca"},"controller":"users","action":"update"}, headers: {"Authorization":"KKTAe9iYvZJgPpjQdFpDxYy6"}
		Then the response status should be 200
		And The JSON response should be {"id":3,"name":"clarita caneca","password_digest":"$2a$12$/I.pnmdSrOlFczYeUdOpbuWXqeP5pOGqnp/5SZaw.m9KUDKeXyWo.","email":"30caderno@edd.cccesd","created_at":"2021-03-25T17:14:53.195Z","updated_at":"2021-03-25T18:12:11.355Z","token":"KKTAe9iYvZJgPpjQdFpDxYy6"}

	Scenario: users show
		Given There is an instance of User with id 1 and params: {"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"}
		Given There is an instance of User with id 2 and params: {"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"}
		Given There is an instance of User with id 3 and params: {"id":3,"name":"clarita caneca","email":"30caderno@edd.cccesd","password_digest":"$2a$12$/I.pnmdSrOlFczYeUdOpbuWXqeP5pOGqnp/5SZaw.m9KUDKeXyWo.","created_at":"2021-03-25T17:14:53.195Z","updated_at":"2021-03-25T18:12:11.355Z","token":"KKTAe9iYvZJgPpjQdFpDxYy6"}
		When the client requests with GET /users/3, body: {"controller":"users","action":"show","id":"3"}, headers: {"Authorization":"dedeed"}
		Then the response status should be 200
		And The JSON response should be {"id":3,"name":"clarita caneca","email":"30caderno@edd.cccesd","password_digest":"$2a$12$/I.pnmdSrOlFczYeUdOpbuWXqeP5pOGqnp/5SZaw.m9KUDKeXyWo.","created_at":"2021-03-25T17:14:53.195Z","updated_at":"2021-03-25T18:12:11.355Z","token":"KKTAe9iYvZJgPpjQdFpDxYy6"}

	Scenario: users destroy
		Given There is an instance of User with id 1 and params: {"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"}
		Given There is an instance of User with id 2 and params: {"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"}
		Given There is an instance of User with id 3 and params: {"id":3,"name":"clarita caneca","email":"30caderno@edd.cccesd","password_digest":"$2a$12$/I.pnmdSrOlFczYeUdOpbuWXqeP5pOGqnp/5SZaw.m9KUDKeXyWo.","created_at":"2021-03-25T17:14:53.195Z","updated_at":"2021-03-25T18:12:11.355Z","token":"KKTAe9iYvZJgPpjQdFpDxYy6"}
		When the client requests with DELETE /user, body: {"controller":"users","action":"destroy"}, headers: {}
		Then the response status should be 401
		And The JSON response should be {"errors":"Not Authenticated"}

	Scenario: users destroy
		Given There is an instance of User with id 1 and params: {"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"}
		Given There is an instance of User with id 2 and params: {"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"}
		Given There is an instance of User with id 3 and params: {"id":3,"name":"clarita caneca","email":"30caderno@edd.cccesd","password_digest":"$2a$12$/I.pnmdSrOlFczYeUdOpbuWXqeP5pOGqnp/5SZaw.m9KUDKeXyWo.","created_at":"2021-03-25T17:14:53.195Z","updated_at":"2021-03-25T18:12:11.355Z","token":"KKTAe9iYvZJgPpjQdFpDxYy6"}
		When the client requests with DELETE /user, body: {"controller":"users","action":"destroy"}, headers: {}
		Then the response status should be 401
		And The JSON response should be {"errors":"Not Authenticated"}

	Scenario: users destroy
		Given There is an instance of User with id 1 and params: {"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"}
		Given There is an instance of User with id 2 and params: {"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"}
		Given There is an instance of User with id 3 and params: {"id":3,"name":"clarita caneca","email":"30caderno@edd.cccesd","password_digest":"$2a$12$/I.pnmdSrOlFczYeUdOpbuWXqeP5pOGqnp/5SZaw.m9KUDKeXyWo.","created_at":"2021-03-25T17:14:53.195Z","updated_at":"2021-03-25T18:12:11.355Z","token":"KKTAe9iYvZJgPpjQdFpDxYy6"}
		When the client requests with DELETE /user, body: {"controller":"users","action":"destroy"}, headers: {"Authorization":"KKTAe9iYvZJgPpjQdFpDxYy6"}
		Then the response status should be 200
		And The JSON response should be {}

	Scenario: users index
		Given There is an instance of User with id 1 and params: {"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"}
		Given There is an instance of User with id 2 and params: {"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"}
		When the client requests with GET /users, body: {"controller":"users","action":"index"}, headers: {"Authorization":"KKTAe9iYvZJgPpjQdFpDxYy6"}
		Then the response status should be 200
		And The JSON response should be [{"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"},{"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"}]

	Scenario: users user
		Given There is an instance of User with id 1 and params: {"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"}
		Given There is an instance of User with id 2 and params: {"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"}
		Given There is an instance of User with id 4 and params: {"id":4,"name":"caderno","email":"30caderno@edd.cccesdd","password_digest":"$2a$12$bg4w6sHJ/DeveCWp6oE/IepD.Smq5WF27A/gYNvi66uU/I8/LVVTC","created_at":"2021-03-25T18:18:09.644Z","updated_at":"2021-03-25T18:18:09.644Z","token":"tiEPFbRA2U5PUvvtJCioWFLi"}
		Given There is an instance of User with id 5 and params: {"id":5,"name":"caderno","email":"30caddeerno@edd.cccesdd","password_digest":"$2a$12$gFYnpxWdcpE8fjtvWXXfuOOgwcO9TvLeS0lDTX.uWEI5ir3uZWt1u","created_at":"2021-03-26T01:06:30.157Z","updated_at":"2021-03-26T01:06:30.157Z","token":"vGcv7wwDVT9mzthYXvJLoZSQ"}
		When the client requests with GET /user, body: {"controller":"users","action":"user"}, headers: {"Authorization":"KKTAe9iYvZJgPpjQdFpDxYy6"}
		Then the response status should be 401
		And The JSON response should be {"errors":"Not Authenticated"}

	Scenario: users user
		Given There is an instance of User with id 1 and params: {"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"}
		Given There is an instance of User with id 2 and params: {"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"}
		Given There is an instance of User with id 4 and params: {"id":4,"name":"caderno","email":"30caderno@edd.cccesdd","password_digest":"$2a$12$bg4w6sHJ/DeveCWp6oE/IepD.Smq5WF27A/gYNvi66uU/I8/LVVTC","created_at":"2021-03-25T18:18:09.644Z","updated_at":"2021-03-25T18:18:09.644Z","token":"tiEPFbRA2U5PUvvtJCioWFLi"}
		Given There is an instance of User with id 5 and params: {"id":5,"name":"caderno","email":"30caddeerno@edd.cccesdd","password_digest":"$2a$12$gFYnpxWdcpE8fjtvWXXfuOOgwcO9TvLeS0lDTX.uWEI5ir3uZWt1u","created_at":"2021-03-26T01:06:30.157Z","updated_at":"2021-03-26T01:06:30.157Z","token":"vGcv7wwDVT9mzthYXvJLoZSQ"}
		When the client requests with GET /user, body: {"controller":"users","action":"user"}, headers: {"Authorization":"KKTAe9iYvZJgPpjQdFpDxYy6"}
		Then the response status should be 401
		And The JSON response should be {"errors":"Not Authenticated"}

	Scenario: users index
		Given There is an instance of User with id 1 and params: {"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"}
		Given There is an instance of User with id 2 and params: {"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"}
		Given There is an instance of User with id 4 and params: {"id":4,"name":"caderno","email":"30caderno@edd.cccesdd","password_digest":"$2a$12$bg4w6sHJ/DeveCWp6oE/IepD.Smq5WF27A/gYNvi66uU/I8/LVVTC","created_at":"2021-03-25T18:18:09.644Z","updated_at":"2021-03-25T18:18:09.644Z","token":"tiEPFbRA2U5PUvvtJCioWFLi"}
		Given There is an instance of User with id 5 and params: {"id":5,"name":"caderno","email":"30caddeerno@edd.cccesdd","password_digest":"$2a$12$gFYnpxWdcpE8fjtvWXXfuOOgwcO9TvLeS0lDTX.uWEI5ir3uZWt1u","created_at":"2021-03-26T01:06:30.157Z","updated_at":"2021-03-26T01:06:30.157Z","token":"vGcv7wwDVT9mzthYXvJLoZSQ"}
		When the client requests with GET /users, body: {"controller":"users","action":"index"}, headers: {}
		Then the response status should be 200
		And The JSON response should be [{"id":1,"name":"caderno","email":"30caderno@edd.ccce","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z"},{"id":2,"name":"caderno","email":"30caderno@edd.ccces","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z"},{"id":4,"name":"caderno","email":"30caderno@edd.cccesdd","created_at":"2021-03-25T18:18:09.644Z","updated_at":"2021-03-25T18:18:09.644Z"},{"id":5,"name":"caderno","email":"30caddeerno@edd.cccesdd","created_at":"2021-03-26T01:06:30.157Z","updated_at":"2021-03-26T01:06:30.157Z"}]

	Scenario: authentication login
		Given There is an instance of User with id 1 and params: {"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"}
		Given There is an instance of User with id 2 and params: {"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"}
		Given There is an instance of User with id 4 and params: {"id":4,"name":"caderno","email":"30caderno@edd.cccesdd","password_digest":"$2a$12$bg4w6sHJ/DeveCWp6oE/IepD.Smq5WF27A/gYNvi66uU/I8/LVVTC","created_at":"2021-03-25T18:18:09.644Z","updated_at":"2021-03-25T18:18:09.644Z","token":"tiEPFbRA2U5PUvvtJCioWFLi"}
		Given There is an instance of User with id 5 and params: {"id":5,"name":"caderno","email":"30caddeerno@edd.cccesdd","password_digest":"$2a$12$gFYnpxWdcpE8fjtvWXXfuOOgwcO9TvLeS0lDTX.uWEI5ir3uZWt1u","created_at":"2021-03-26T01:06:30.157Z","updated_at":"2021-03-26T01:06:30.157Z","token":"vGcv7wwDVT9mzthYXvJLoZSQ"}
		When the client requests with POST /auth/login?email=30caderno@edd.ccce&password=aaa123, body: {"email":"30caderno@edd.ccce","password":"aaa123","controller":"authentication","action":"login"}, headers: {}
		Then the response status should be 200
		And The JSON response should be {"token":"7MbgdG267eggnb6z15746yhJ","email":"30caderno@edd.ccce"}

	Scenario: users user
		Given There is an instance of User with id 1 and params: {"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"}
		Given There is an instance of User with id 2 and params: {"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"}
		Given There is an instance of User with id 4 and params: {"id":4,"name":"caderno","email":"30caderno@edd.cccesdd","password_digest":"$2a$12$bg4w6sHJ/DeveCWp6oE/IepD.Smq5WF27A/gYNvi66uU/I8/LVVTC","created_at":"2021-03-25T18:18:09.644Z","updated_at":"2021-03-25T18:18:09.644Z","token":"tiEPFbRA2U5PUvvtJCioWFLi"}
		Given There is an instance of User with id 5 and params: {"id":5,"name":"caderno","email":"30caddeerno@edd.cccesdd","password_digest":"$2a$12$gFYnpxWdcpE8fjtvWXXfuOOgwcO9TvLeS0lDTX.uWEI5ir3uZWt1u","created_at":"2021-03-26T01:06:30.157Z","updated_at":"2021-03-26T01:06:30.157Z","token":"vGcv7wwDVT9mzthYXvJLoZSQ"}
		When the client requests with GET /user, body: {"controller":"users","action":"user"}, headers: {"Authorization":"7MbgdG267eggnb6z15746yhJ"}
		Then the response status should be 200
		And The JSON response should be {"id":1,"name":"caderno","email":"30caderno@edd.ccce","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z"}

	Scenario: users user
		Given There is an instance of User with id 1 and params: {"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"}
		Given There is an instance of User with id 2 and params: {"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"}
		Given There is an instance of User with id 4 and params: {"id":4,"name":"caderno","email":"30caderno@edd.cccesdd","password_digest":"$2a$12$bg4w6sHJ/DeveCWp6oE/IepD.Smq5WF27A/gYNvi66uU/I8/LVVTC","created_at":"2021-03-25T18:18:09.644Z","updated_at":"2021-03-25T18:18:09.644Z","token":"tiEPFbRA2U5PUvvtJCioWFLi"}
		Given There is an instance of User with id 5 and params: {"id":5,"name":"caderno","email":"30caddeerno@edd.cccesdd","password_digest":"$2a$12$gFYnpxWdcpE8fjtvWXXfuOOgwcO9TvLeS0lDTX.uWEI5ir3uZWt1u","created_at":"2021-03-26T01:06:30.157Z","updated_at":"2021-03-26T01:06:30.157Z","token":"vGcv7wwDVT9mzthYXvJLoZSQ"}
		When the client requests with GET /user, body: {"controller":"users","action":"user"}, headers: {"Authorization":"7MbgdG267eggnb6z15746yhJ"}
		Then the response status should be 200
		And The JSON response should be {"id":1,"name":"caderno","email":"30caderno@edd.ccce","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z"}

	Scenario: users user
		Given There is an instance of User with id 1 and params: {"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"}
		Given There is an instance of User with id 2 and params: {"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"}
		Given There is an instance of User with id 4 and params: {"id":4,"name":"caderno","email":"30caderno@edd.cccesdd","password_digest":"$2a$12$bg4w6sHJ/DeveCWp6oE/IepD.Smq5WF27A/gYNvi66uU/I8/LVVTC","created_at":"2021-03-25T18:18:09.644Z","updated_at":"2021-03-25T18:18:09.644Z","token":"tiEPFbRA2U5PUvvtJCioWFLi"}
		Given There is an instance of User with id 5 and params: {"id":5,"name":"caderno","email":"30caddeerno@edd.cccesdd","password_digest":"$2a$12$gFYnpxWdcpE8fjtvWXXfuOOgwcO9TvLeS0lDTX.uWEI5ir3uZWt1u","created_at":"2021-03-26T01:06:30.157Z","updated_at":"2021-03-26T01:06:30.157Z","token":"vGcv7wwDVT9mzthYXvJLoZSQ"}
		When the client requests with GET /user, body: {"controller":"users","action":"user"}, headers: {"Authorization":"7MbgdG267eggnb6z15746yhJ"}
		Then the response status should be 200
		And The JSON response should be {"id":1,"name":"caderno","email":"30caderno@edd.ccce","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z"}

	Scenario: posts index
		Given There is an instance of User with id 1 and params: {"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"}
		Given There is an instance of User with id 2 and params: {"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"}
		Given There is an instance of User with id 4 and params: {"id":4,"name":"caderno","email":"30caderno@edd.cccesdd","password_digest":"$2a$12$bg4w6sHJ/DeveCWp6oE/IepD.Smq5WF27A/gYNvi66uU/I8/LVVTC","created_at":"2021-03-25T18:18:09.644Z","updated_at":"2021-03-25T18:18:09.644Z","token":"tiEPFbRA2U5PUvvtJCioWFLi"}
		Given There is an instance of User with id 5 and params: {"id":5,"name":"caderno","email":"30caddeerno@edd.cccesdd","password_digest":"$2a$12$gFYnpxWdcpE8fjtvWXXfuOOgwcO9TvLeS0lDTX.uWEI5ir3uZWt1u","created_at":"2021-03-26T01:06:30.157Z","updated_at":"2021-03-26T01:06:30.157Z","token":"vGcv7wwDVT9mzthYXvJLoZSQ"}
		When the client requests with GET /posts, body: {"controller":"posts","action":"index"}, headers: {}
		Then the response status should be 200
		And The JSON response should be []

	Scenario: posts create
		Given There is an instance of User with id 1 and params: {"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"}
		Given There is an instance of User with id 2 and params: {"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"}
		Given There is an instance of User with id 4 and params: {"id":4,"name":"caderno","email":"30caderno@edd.cccesdd","password_digest":"$2a$12$bg4w6sHJ/DeveCWp6oE/IepD.Smq5WF27A/gYNvi66uU/I8/LVVTC","created_at":"2021-03-25T18:18:09.644Z","updated_at":"2021-03-25T18:18:09.644Z","token":"tiEPFbRA2U5PUvvtJCioWFLi"}
		Given There is an instance of User with id 5 and params: {"id":5,"name":"caderno","email":"30caddeerno@edd.cccesdd","password_digest":"$2a$12$gFYnpxWdcpE8fjtvWXXfuOOgwcO9TvLeS0lDTX.uWEI5ir3uZWt1u","created_at":"2021-03-26T01:06:30.157Z","updated_at":"2021-03-26T01:06:30.157Z","token":"vGcv7wwDVT9mzthYXvJLoZSQ"}
		When the client requests with POST /posts, body: {"post":{"title":"caderno","body":"text text"},"controller":"posts","action":"create"}, headers: {"Authorization":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE2MTY3NzQyMjF9.G5s2VuB8xRkSa7Ve5WsldVwIDEYUv3L4yfcJZ36cEwA"}
		Then the response status should be 422
		And The JSON response should be {"user":["must exist"]}

	Scenario: posts index
		Given There is an instance of User with id 1 and params: {"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"}
		Given There is an instance of User with id 2 and params: {"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"}
		Given There is an instance of User with id 4 and params: {"id":4,"name":"caderno","email":"30caderno@edd.cccesdd","password_digest":"$2a$12$bg4w6sHJ/DeveCWp6oE/IepD.Smq5WF27A/gYNvi66uU/I8/LVVTC","created_at":"2021-03-25T18:18:09.644Z","updated_at":"2021-03-25T18:18:09.644Z","token":"tiEPFbRA2U5PUvvtJCioWFLi"}
		Given There is an instance of User with id 5 and params: {"id":5,"name":"caderno","email":"30caddeerno@edd.cccesdd","password_digest":"$2a$12$gFYnpxWdcpE8fjtvWXXfuOOgwcO9TvLeS0lDTX.uWEI5ir3uZWt1u","created_at":"2021-03-26T01:06:30.157Z","updated_at":"2021-03-26T01:06:30.157Z","token":"vGcv7wwDVT9mzthYXvJLoZSQ"}
		When the client requests with GET /posts, body: {"controller":"posts","action":"index"}, headers: {"Authorization":"7MbgdG267eggnb6z15746yhJ"}
		Then the response status should be 200
		And The JSON response should be []

	Scenario: posts create
		Given There is an instance of User with id 1 and params: {"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"}
		Given There is an instance of User with id 2 and params: {"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"}
		Given There is an instance of User with id 4 and params: {"id":4,"name":"caderno","email":"30caderno@edd.cccesdd","password_digest":"$2a$12$bg4w6sHJ/DeveCWp6oE/IepD.Smq5WF27A/gYNvi66uU/I8/LVVTC","created_at":"2021-03-25T18:18:09.644Z","updated_at":"2021-03-25T18:18:09.644Z","token":"tiEPFbRA2U5PUvvtJCioWFLi"}
		Given There is an instance of User with id 5 and params: {"id":5,"name":"caderno","email":"30caddeerno@edd.cccesdd","password_digest":"$2a$12$gFYnpxWdcpE8fjtvWXXfuOOgwcO9TvLeS0lDTX.uWEI5ir3uZWt1u","created_at":"2021-03-26T01:06:30.157Z","updated_at":"2021-03-26T01:06:30.157Z","token":"vGcv7wwDVT9mzthYXvJLoZSQ"}
		When the client requests with POST /posts, body: {"post":{"title":"caderno","body":"text text"},"controller":"posts","action":"create"}, headers: {"Authorization":"7MbgdG267eggnb6z15746yhJ"}
		Then the response status should be 201
		And The JSON response should be {"id":1,"title":"caderno","body":"text text","user_id":1,"created_at":"2021-03-26T01:15:30.862Z","updated_at":"2021-03-26T01:15:30.862Z","user":{"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"}}

