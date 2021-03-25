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
		When the client requests with GET /users, body: {"controller":"users","action":"index"}, headers: {}
		Then the response status should be 401
		And The JSON response should be {"errors":"Not Authenticated"}

	Scenario: users index
		Given There is an instance of User with id 1 and params: {"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"}
		Given There is an instance of User with id 2 and params: {"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"}
		Given There is an instance of User with id 3 and params: {"id":3,"name":"caderno","email":"30caderno@edd.cccesd","password_digest":"$2a$12$/I.pnmdSrOlFczYeUdOpbuWXqeP5pOGqnp/5SZaw.m9KUDKeXyWo.","created_at":"2021-03-25T17:14:53.195Z","updated_at":"2021-03-25T17:14:53.195Z","token":"KKTAe9iYvZJgPpjQdFpDxYy6"}
		When the client requests with GET /users, body: {"controller":"users","action":"index"}, headers: {"Authorization":"KKTAe9iYvZJgPpjQdFpDxYy6"}
		Then the response status should be 200
		And The JSON response should be [{"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"},{"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"},{"id":3,"name":"caderno","email":"30caderno@edd.cccesd","password_digest":"$2a$12$/I.pnmdSrOlFczYeUdOpbuWXqeP5pOGqnp/5SZaw.m9KUDKeXyWo.","created_at":"2021-03-25T17:14:53.195Z","updated_at":"2021-03-25T17:14:53.195Z","token":"KKTAe9iYvZJgPpjQdFpDxYy6"}]

