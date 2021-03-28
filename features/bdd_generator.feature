Feature: bdd_generator

	Scenario: users create
		When the client requests with POST /users, body: {"user":{"name":"Nome Test","email":"test@email.com","password":"aaa123","password_confirmation":"aaa123"},"controller":"users","action":"create"}, headers: {}
		Then the response status should be 201
		And The JSON response should be {"id":9,"name":"Nome Test","email":"test@email.com","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:02:02.511Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}

	Scenario: users create
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:02:02.511Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		When the client requests with POST /users, body: {"user":{"password_confirmation":"aaa123"},"controller":"users","action":"create"}, headers: {}
		Then the response status should be 422
		And The JSON response should be {"password":["can't be blank","is too short (minimum is 6 characters)"],"email":["can't be blank","is invalid"],"name":["can't be blank"],"password_confirmation":["doesn't match Password"]}

	Scenario: users create
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:02:02.511Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		When the client requests with POST /users, body: {"user":{"name":"Nome Test"},"controller":"users","action":"create"}, headers: {}
		Then the response status should be 422
		And The JSON response should be {"password":["can't be blank","is too short (minimum is 6 characters)"],"email":["can't be blank","is invalid"]}

	Scenario: users create
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:02:02.511Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		When the client requests with POST /users, body: {"user":{"name":"Nome Test","email":"test@email.com","password":"aaa123","password_confirmation":"aaa123"},"controller":"users","action":"create"}, headers: {}
		Then the response status should be 422
		And The JSON response should be {"email":["has already been taken"]}

	Scenario: users create
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:02:02.511Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		When the client requests with POST /users, body: {"user":{"name":"Nome Test","email":"test2@email.com","password":"aaa123","password_confirmation":"aaa123"},"controller":"users","action":"create"}, headers: {}
		Then the response status should be 201
		And The JSON response should be {"id":10,"name":"Nome Test","email":"test2@email.com","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}

	Scenario: users create
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:02:02.511Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with POST /users, body: {"user":{"name":"Nome Test","email":"test@email.com","password":"aaa123","password_confirmation":"aaa123"},"controller":"users","action":"create"}, headers: {}
		Then the response status should be 422
		And The JSON response should be {"email":["has already been taken"]}

	Scenario: users index
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:02:02.511Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with GET /users, body: {"controller":"users","action":"index"}, headers: {}
		Then the response status should be 200
		And The JSON response should be [{"id":9,"name":"Nome Test","email":"test@email.com","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:02:02.511Z"},{"id":10,"name":"Nome Test","email":"test2@email.com","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z"}]

	Scenario: authentication login
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:02:02.511Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with POST /auth/login, body: {"email":"test@email.com","password":"aaa123","controller":"authentication","action":"login"}, headers: {}
		Then the response status should be 200
		And The JSON response should be {"token":"7gorpkLC5Z3BKmd9SrPaTphE","email":"test@email.com"}

	Scenario: authentication login
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:02:02.511Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with POST /auth/login, body: {"email":"test@email.com2","password":"aaa123","controller":"authentication","action":"login"}, headers: {}
		Then the response status should be 401
		And The JSON response should be {"error":"unauthorized"}

	Scenario: authentication login
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:02:02.511Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with POST /auth/login, body: {"email":"test@email.com","password":"aaa123","controller":"authentication","action":"login"}, headers: {}
		Then the response status should be 200
		And The JSON response should be {"token":"7gorpkLC5Z3BKmd9SrPaTphE","email":"test@email.com"}

	Scenario: users user
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:02:02.511Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with GET /user, body: {"controller":"users","action":"user"}, headers: {"Authorization":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Then the response status should be 200
		And The JSON response should be {"id":9,"name":"Nome Test","email":"test@email.com","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:02:02.511Z"}

	Scenario: users user
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:02:02.511Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with GET /user, body: {"controller":"users","action":"user"}, headers: {}
		Then the response status should be 401
		And The JSON response should be {"errors":"Not Authenticated"}

	Scenario: users user
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:02:02.511Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with GET /user, body: {"controller":"users","action":"user"}, headers: {"Authorization":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Then the response status should be 200
		And The JSON response should be {"id":9,"name":"Nome Test","email":"test@email.com","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:02:02.511Z"}

	Scenario: users update
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:02:02.511Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with PATCH /user, body: {"user":{"name":"Nome Test2","email":"test2@email.com","password":"aaa1234","password_confirmation":"aaa1234"},"controller":"users","action":"update"}, headers: {}
		Then the response status should be 401
		And The JSON response should be {"errors":"Not Authenticated"}

	Scenario: users update
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:02:02.511Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with PATCH /user, body: {"user":{"name":"Nome Test2","email":"test2@email.com","password":"aaa1234","password_confirmation":"aaa1234"},"controller":"users","action":"update"}, headers: {"Authorization":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Then the response status should be 422
		And The JSON response should be {"email":["has already been taken"]}

	Scenario: users update
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:02:02.511Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with PATCH /user, body: {"user":{"name":"Nome Test2","email":"test@email.com"},"controller":"users","action":"update"}, headers: {"Authorization":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Then the response status should be 200
		And The JSON response should be {"id":9,"name":"Nome Test2","email":"test@email.com","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z"}

	Scenario: users user
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with GET /user, body: {"controller":"users","action":"user"}, headers: {"Authorization":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Then the response status should be 200
		And The JSON response should be {"id":9,"name":"Nome Test2","email":"test@email.com","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z"}

	Scenario: users show
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with GET /users/9, body: {"controller":"users","action":"show","id":"9"}, headers: {}
		Then the response status should be 200
		And The JSON response should be {"id":9,"name":"Nome Test2","email":"test@email.com","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z"}

	Scenario: users show
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with GET /users/10, body: {"controller":"users","action":"show","id":"10"}, headers: {}
		Then the response status should be 200
		And The JSON response should be {"id":10,"name":"Nome Test","email":"test2@email.com","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z"}

	Scenario: users posts
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with GET /users/9/posts, body: {"controller":"users","action":"posts","id":"9"}, headers: {}
		Then the response status should be 200
		And The JSON response should be []

	Scenario: posts create
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with POST /posts, body: {"post":{"title":"Titulo Post","body":"text text"},"controller":"posts","action":"create"}, headers: {}
		Then the response status should be 401
		And The JSON response should be {"errors":"Not Authenticated"}

	Scenario: posts create
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with POST /posts, body: {"post":{"title":"Titulo Post","body":"text text"},"controller":"posts","action":"create"}, headers: {"Authorization":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Then the response status should be 201
		And The JSON response should be {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z","user":{"id":9,"name":"Nome Test2","email":"test@email.com","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z"}}

	Scenario: posts create
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with POST /posts, body: {"post":{"title":"Titulo Post"},"controller":"posts","action":"create"}, headers: {"Authorization":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Then the response status should be 422
		And The JSON response should be {"body":["can't be blank"]}

	Scenario: posts create
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with POST /posts, body: {"post":{"body":"text text"},"controller":"posts","action":"create"}, headers: {"Authorization":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Then the response status should be 422
		And The JSON response should be {"title":["can't be blank"]}

	Scenario: posts create
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with POST /posts, body: {"post":{"title":"Titulo Post","body":"text text"},"controller":"posts","action":"create"}, headers: {"Authorization":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Then the response status should be 201
		And The JSON response should be {"id":19,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:05:19.422Z","user":{"id":9,"name":"Nome Test2","email":"test@email.com","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z"}}

	Scenario: users posts
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:05:19.422Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with GET /users/9/posts, body: {"controller":"users","action":"posts","id":"9"}, headers: {}
		Then the response status should be 200
		And The JSON response should be [{"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"},{"id":19,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:05:19.422Z"}]

	Scenario: posts show
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:05:19.422Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with GET /posts/19, body: {"controller":"posts","action":"show","id":"19"}, headers: {}
		Then the response status should be 200
		And The JSON response should be {"id":19,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:05:19.422Z","user":{"id":9,"name":"Nome Test2","email":"test@email.com","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z"}}

	Scenario: posts index
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:05:19.422Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with GET /posts, body: {"controller":"posts","action":"index"}, headers: {}
		Then the response status should be 200
		And The JSON response should be [{"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z","user":{"id":9,"name":"Nome Test2","email":"test@email.com","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z"}},{"id":19,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:05:19.422Z","user":{"id":9,"name":"Nome Test2","email":"test@email.com","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z"}}]

	Scenario: posts update
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:05:19.422Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with PATCH /posts/19, body: {"post":{"title":"Titulo Post2","body":"text2"},"controller":"posts","action":"update","id":"19"}, headers: {}
		Then the response status should be 401
		And The JSON response should be {"errors":"Not Authenticated"}

	Scenario: posts update
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:05:19.422Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with PATCH /posts/19, body: {"post":{"title":"Titulo Post2","body":"text2"},"controller":"posts","action":"update","id":"19"}, headers: {"Authorization":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Then the response status should be 200
		And The JSON response should be {"user_id":9,"id":19,"title":"Titulo Post2","body":"text2","created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}

	Scenario: posts update
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post2","body":"text2","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with PATCH /posts/19, body: {"post":{"title":"Titulo Post2"},"controller":"posts","action":"update","id":"19"}, headers: {"Authorization":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Then the response status should be 200
		And The JSON response should be {"user_id":9,"id":19,"title":"Titulo Post2","body":"text2","created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}

	Scenario: posts update
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post2","body":"text2","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with PATCH /posts/19, body: {"post":{"body":"text2"},"controller":"posts","action":"update","id":"19"}, headers: {"Authorization":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Then the response status should be 200
		And The JSON response should be {"user_id":9,"id":19,"body":"text2","title":"Titulo Post2","created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}

	Scenario: posts update
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post2","body":"text2","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with PATCH /posts/19, body: {"post":{"title":"Titulo Post2","body":"text2"},"controller":"posts","action":"update","id":"19"}, headers: {"Authorization":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Then the response status should be 200
		And The JSON response should be {"user_id":9,"id":19,"title":"Titulo Post2","body":"text2","created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}

	Scenario: posts create
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post2","body":"text2","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with POST /posts, body: {"post":{"title":"Titulo Post","body":"text text"},"controller":"posts","action":"create"}, headers: {"Authorization":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Then the response status should be 201
		And The JSON response should be {"id":20,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:06:29.959Z","updated_at":"2021-03-28T16:06:29.959Z","user":{"id":9,"name":"Nome Test2","email":"test@email.com","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z"}}

	Scenario: posts destroy
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post2","body":"text2","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}
		Given There is an instance of Post with id 20 and params: {"id":20,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:06:29.959Z","updated_at":"2021-03-28T16:06:29.959Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with DELETE /posts/20, body: {"controller":"posts","action":"destroy","id":"20"}, headers: {"Authorization":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Then the response status should be 200
		And The JSON response should be {}

	Scenario: posts destroy
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post2","body":"text2","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with DELETE /posts/19, body: {"controller":"posts","action":"destroy","id":"19"}, headers: {}
		Then the response status should be 401
		And The JSON response should be {"errors":"Not Authenticated"}

	Scenario: comments create
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post2","body":"text2","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with POST /posts/19/comments, body: {"comment":{"message":"Comentario"},"controller":"comments","action":"create","post_id":"19"}, headers: {}
		Then the response status should be 401
		And The JSON response should be {"errors":"Not Authenticated"}

	Scenario: comments create
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post2","body":"text2","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with POST /posts/19/comments, body: {"comment":{"message":"Comentario"},"controller":"comments","action":"create","post_id":"19"}, headers: {"Authorization":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Then the response status should be 201
		And The JSON response should be {"id":10,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:13.214Z","updated_at":"2021-03-28T16:07:13.214Z","user":{"id":9,"name":"Nome Test2","email":"test@email.com","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z"}}

	Scenario: comments create
		Given There is an instance of Comment with id 10 and params: {"id":10,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:13.214Z","updated_at":"2021-03-28T16:07:13.214Z"}
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post2","body":"text2","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with POST /posts/19/comments, body: {"comment":{"message":""},"controller":"comments","action":"create","post_id":"19"}, headers: {"Authorization":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Then the response status should be 422
		And The JSON response should be {"message":["can't be blank"]}

	Scenario: comments create
		Given There is an instance of Comment with id 10 and params: {"id":10,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:13.214Z","updated_at":"2021-03-28T16:07:13.214Z"}
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post2","body":"text2","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with POST /posts/19/comments, body: {"comment":{"message":"Comentario"},"controller":"comments","action":"create","post_id":"19"}, headers: {"Authorization":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Then the response status should be 201
		And The JSON response should be {"id":11,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:25.619Z","updated_at":"2021-03-28T16:07:25.619Z","user":{"id":9,"name":"Nome Test2","email":"test@email.com","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z"}}

	Scenario: comments create
		Given There is an instance of Comment with id 10 and params: {"id":10,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:13.214Z","updated_at":"2021-03-28T16:07:13.214Z"}
		Given There is an instance of Comment with id 11 and params: {"id":11,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:25.619Z","updated_at":"2021-03-28T16:07:25.619Z"}
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post2","body":"text2","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with POST /posts/19/comments, body: {"comment":{"message":"Comentario"},"controller":"comments","action":"create","post_id":"19"}, headers: {"Authorization":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Then the response status should be 201
		And The JSON response should be {"id":12,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:28.905Z","updated_at":"2021-03-28T16:07:28.905Z","user":{"id":9,"name":"Nome Test2","email":"test@email.com","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z"}}

	Scenario: comments index
		Given There is an instance of Comment with id 10 and params: {"id":10,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:13.214Z","updated_at":"2021-03-28T16:07:13.214Z"}
		Given There is an instance of Comment with id 11 and params: {"id":11,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:25.619Z","updated_at":"2021-03-28T16:07:25.619Z"}
		Given There is an instance of Comment with id 12 and params: {"id":12,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:28.905Z","updated_at":"2021-03-28T16:07:28.905Z"}
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post2","body":"text2","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with GET /posts/19/comments, body: {"controller":"comments","action":"index","post_id":"19"}, headers: {}
		Then the response status should be 200
		And The JSON response should be [{"id":10,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:13.214Z","updated_at":"2021-03-28T16:07:13.214Z","user":{"id":9,"name":"Nome Test2","email":"test@email.com","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z"}},{"id":11,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:25.619Z","updated_at":"2021-03-28T16:07:25.619Z","user":{"id":9,"name":"Nome Test2","email":"test@email.com","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z"}},{"id":12,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:28.905Z","updated_at":"2021-03-28T16:07:28.905Z","user":{"id":9,"name":"Nome Test2","email":"test@email.com","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z"}}]

	Scenario: comments index
		Given There is an instance of Comment with id 10 and params: {"id":10,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:13.214Z","updated_at":"2021-03-28T16:07:13.214Z"}
		Given There is an instance of Comment with id 11 and params: {"id":11,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:25.619Z","updated_at":"2021-03-28T16:07:25.619Z"}
		Given There is an instance of Comment with id 12 and params: {"id":12,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:28.905Z","updated_at":"2021-03-28T16:07:28.905Z"}
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post2","body":"text2","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with GET /posts/19/comments, body: {"controller":"comments","action":"index","post_id":"19"}, headers: {}
		Then the response status should be 200
		And The JSON response should be [{"id":10,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:13.214Z","updated_at":"2021-03-28T16:07:13.214Z","user":{"id":9,"name":"Nome Test2","email":"test@email.com","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z"}},{"id":11,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:25.619Z","updated_at":"2021-03-28T16:07:25.619Z","user":{"id":9,"name":"Nome Test2","email":"test@email.com","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z"}},{"id":12,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:28.905Z","updated_at":"2021-03-28T16:07:28.905Z","user":{"id":9,"name":"Nome Test2","email":"test@email.com","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z"}}]

	Scenario: comments destroy
		Given There is an instance of Comment with id 10 and params: {"id":10,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:13.214Z","updated_at":"2021-03-28T16:07:13.214Z"}
		Given There is an instance of Comment with id 11 and params: {"id":11,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:25.619Z","updated_at":"2021-03-28T16:07:25.619Z"}
		Given There is an instance of Comment with id 12 and params: {"id":12,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:28.905Z","updated_at":"2021-03-28T16:07:28.905Z"}
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post2","body":"text2","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with DELETE /posts/19/comments/10, body: {"controller":"comments","action":"destroy","post_id":"19","comment_id":"10"}, headers: {"Authorization":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Then the response status should be 200
		And The JSON response should be {}

	Scenario: comments destroy
		Given There is an instance of Comment with id 11 and params: {"id":11,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:25.619Z","updated_at":"2021-03-28T16:07:25.619Z"}
		Given There is an instance of Comment with id 12 and params: {"id":12,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:28.905Z","updated_at":"2021-03-28T16:07:28.905Z"}
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post2","body":"text2","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with DELETE /posts/19/comments/11, body: {"controller":"comments","action":"destroy","post_id":"19","comment_id":"11"}, headers: {}
		Then the response status should be 401
		And The JSON response should be {"errors":"Not Authenticated"}

	Scenario: comments create
		Given There is an instance of Comment with id 11 and params: {"id":11,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:25.619Z","updated_at":"2021-03-28T16:07:25.619Z"}
		Given There is an instance of Comment with id 12 and params: {"id":12,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:28.905Z","updated_at":"2021-03-28T16:07:28.905Z"}
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post2","body":"text2","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with POST /posts/19/comments, body: {"comment":{"message":"Comentario"},"controller":"comments","action":"create","post_id":"19"}, headers: {"Authorization":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Then the response status should be 201
		And The JSON response should be {"id":13,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:08:04.857Z","updated_at":"2021-03-28T16:08:04.857Z","user":{"id":9,"name":"Nome Test2","email":"test@email.com","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z"}}

	Scenario: posts update
		Given There is an instance of Comment with id 11 and params: {"id":11,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:25.619Z","updated_at":"2021-03-28T16:07:25.619Z"}
		Given There is an instance of Comment with id 12 and params: {"id":12,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:28.905Z","updated_at":"2021-03-28T16:07:28.905Z"}
		Given There is an instance of Comment with id 13 and params: {"id":13,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:08:04.857Z","updated_at":"2021-03-28T16:08:04.857Z"}
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post2","body":"text2","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with PATCH /posts/19, body: {"post":{"title":"Titulo Post2","body":""},"controller":"posts","action":"update","id":"19"}, headers: {"Authorization":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Then the response status should be 422
		And The JSON response should be {"body":["can't be blank"]}

	Scenario: posts update
		Given There is an instance of Comment with id 11 and params: {"id":11,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:25.619Z","updated_at":"2021-03-28T16:07:25.619Z"}
		Given There is an instance of Comment with id 12 and params: {"id":12,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:28.905Z","updated_at":"2021-03-28T16:07:28.905Z"}
		Given There is an instance of Comment with id 13 and params: {"id":13,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:08:04.857Z","updated_at":"2021-03-28T16:08:04.857Z"}
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post2","body":"text2","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with PATCH /posts/19, body: {"post":{"title":"Titulo Post2","body":"text2"},"controller":"posts","action":"update","id":"19"}, headers: {"Authorization":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Then the response status should be 200
		And The JSON response should be {"user_id":9,"id":19,"title":"Titulo Post2","body":"text2","created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}

	Scenario: authentication login
		Given There is an instance of Comment with id 11 and params: {"id":11,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:25.619Z","updated_at":"2021-03-28T16:07:25.619Z"}
		Given There is an instance of Comment with id 12 and params: {"id":12,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:28.905Z","updated_at":"2021-03-28T16:07:28.905Z"}
		Given There is an instance of Comment with id 13 and params: {"id":13,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:08:04.857Z","updated_at":"2021-03-28T16:08:04.857Z"}
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post2","body":"text2","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with POST /auth/login, body: {"email":"test2@email.com","password":"aaa123","controller":"authentication","action":"login"}, headers: {}
		Then the response status should be 200
		And The JSON response should be {"token":"zyiCwCMXkuwFngy6vwKSeK8v","email":"test2@email.com"}

	Scenario: users user
		Given There is an instance of Comment with id 11 and params: {"id":11,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:25.619Z","updated_at":"2021-03-28T16:07:25.619Z"}
		Given There is an instance of Comment with id 12 and params: {"id":12,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:28.905Z","updated_at":"2021-03-28T16:07:28.905Z"}
		Given There is an instance of Comment with id 13 and params: {"id":13,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:08:04.857Z","updated_at":"2021-03-28T16:08:04.857Z"}
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post2","body":"text2","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with GET /user, body: {"controller":"users","action":"user"}, headers: {"Authorization":"zyiCwCMXkuwFngy6vwKSeK8v"}
		Then the response status should be 200
		And The JSON response should be {"id":10,"name":"Nome Test","email":"test2@email.com","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z"}

	Scenario: posts update
		Given There is an instance of Comment with id 11 and params: {"id":11,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:25.619Z","updated_at":"2021-03-28T16:07:25.619Z"}
		Given There is an instance of Comment with id 12 and params: {"id":12,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:28.905Z","updated_at":"2021-03-28T16:07:28.905Z"}
		Given There is an instance of Comment with id 13 and params: {"id":13,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:08:04.857Z","updated_at":"2021-03-28T16:08:04.857Z"}
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post2","body":"text2","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with PATCH /posts/19, body: {"post":{"title":"Titulo Post2","body":"text2"},"controller":"posts","action":"update","id":"19"}, headers: {"Authorization":"zyiCwCMXkuwFngy6vwKSeK8v"}
		Then the response status should be 401
		And The JSON response should be {"errors":"Dont have Permission"}

	Scenario: posts destroy
		Given There is an instance of Comment with id 11 and params: {"id":11,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:25.619Z","updated_at":"2021-03-28T16:07:25.619Z"}
		Given There is an instance of Comment with id 12 and params: {"id":12,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:28.905Z","updated_at":"2021-03-28T16:07:28.905Z"}
		Given There is an instance of Comment with id 13 and params: {"id":13,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:08:04.857Z","updated_at":"2021-03-28T16:08:04.857Z"}
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post2","body":"text2","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with DELETE /posts/19, body: {"controller":"posts","action":"destroy","id":"19"}, headers: {"Authorization":"zyiCwCMXkuwFngy6vwKSeK8v"}
		Then the response status should be 401
		And The JSON response should be {"errors":"Dont have Permission"}

	Scenario: comments destroy
		Given There is an instance of Comment with id 11 and params: {"id":11,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:25.619Z","updated_at":"2021-03-28T16:07:25.619Z"}
		Given There is an instance of Comment with id 12 and params: {"id":12,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:28.905Z","updated_at":"2021-03-28T16:07:28.905Z"}
		Given There is an instance of Comment with id 13 and params: {"id":13,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:08:04.857Z","updated_at":"2021-03-28T16:08:04.857Z"}
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post2","body":"text2","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with DELETE /posts/19/comments/11, body: {"controller":"comments","action":"destroy","post_id":"19","comment_id":"11"}, headers: {"Authorization":"zyiCwCMXkuwFngy6vwKSeK8v"}
		Then the response status should be 401
		And The JSON response should be {"errors":"Dont have Permission"}

	Scenario: users destroy
		Given There is an instance of Comment with id 11 and params: {"id":11,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:25.619Z","updated_at":"2021-03-28T16:07:25.619Z"}
		Given There is an instance of Comment with id 12 and params: {"id":12,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:28.905Z","updated_at":"2021-03-28T16:07:28.905Z"}
		Given There is an instance of Comment with id 13 and params: {"id":13,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:08:04.857Z","updated_at":"2021-03-28T16:08:04.857Z"}
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post2","body":"text2","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with DELETE /user, body: {"controller":"users","action":"destroy"}, headers: {}
		Then the response status should be 401
		And The JSON response should be {"errors":"Not Authenticated"}

	Scenario: users destroy
		Given There is an instance of Comment with id 11 and params: {"id":11,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:25.619Z","updated_at":"2021-03-28T16:07:25.619Z"}
		Given There is an instance of Comment with id 12 and params: {"id":12,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:07:28.905Z","updated_at":"2021-03-28T16:07:28.905Z"}
		Given There is an instance of Comment with id 13 and params: {"id":13,"message":"Comentario","post_id":19,"user_id":9,"created_at":"2021-03-28T16:08:04.857Z","updated_at":"2021-03-28T16:08:04.857Z"}
		Given There is an instance of Post with id 18 and params: {"id":18,"title":"Titulo Post","body":"text text","user_id":9,"created_at":"2021-03-28T16:05:05.348Z","updated_at":"2021-03-28T16:05:05.348Z"}
		Given There is an instance of Post with id 19 and params: {"id":19,"title":"Titulo Post2","body":"text2","user_id":9,"created_at":"2021-03-28T16:05:19.422Z","updated_at":"2021-03-28T16:06:02.083Z"}
		Given There is an instance of User with id 9 and params: {"id":9,"name":"Nome Test2","email":"test@email.com","password_digest":"$2a$12$zDsdDB49oK2V0coRnogOqeLtMHcQLXRSgTkIIGtQ3orUujz95NQJq","created_at":"2021-03-28T16:02:02.511Z","updated_at":"2021-03-28T16:04:11.798Z","token":"7gorpkLC5Z3BKmd9SrPaTphE"}
		Given There is an instance of User with id 10 and params: {"id":10,"name":"Nome Test","email":"test2@email.com","password_digest":"$2a$12$vz.EbU3fXefiuacEFDkfM.5MVIiXV9a0OGYEsAPMrq0Z.hy2CfGsK","created_at":"2021-03-28T16:02:29.500Z","updated_at":"2021-03-28T16:02:29.500Z","token":"zyiCwCMXkuwFngy6vwKSeK8v"}
		When the client requests with DELETE /user, body: {"controller":"users","action":"destroy"}, headers: {"Authorization":"zyiCwCMXkuwFngy6vwKSeK8v"}
		Then the response status should be 200
		And The JSON response should be {}

