Feature: bdd_generator

	Scenario: users index
		Given There is an instance of Post with id 1 and params: {"id":1,"title":"caderno","body":"text text","user_id":1,"created_at":"2021-03-26T01:15:30.862Z","updated_at":"2021-03-26T01:15:30.862Z"}
		Given There is an instance of Post with id 2 and params: {"id":2,"title":"caderno","body":"text text","user_id":1,"created_at":"2021-03-26T01:15:55.574Z","updated_at":"2021-03-26T01:15:55.574Z"}
		Given There is an instance of Post with id 3 and params: {"id":3,"title":"clarita caneca","body":"5000000","user_id":1,"created_at":"2021-03-26T01:16:11.064Z","updated_at":"2021-03-26T01:56:22.792Z"}
		Given There is an instance of Post with id 4 and params: {"id":4,"title":"caderno","body":"text text","user_id":1,"created_at":"2021-03-26T01:16:30.182Z","updated_at":"2021-03-26T01:16:30.182Z"}
		Given There is an instance of Post with id 6 and params: {"id":6,"title":"caderno","body":"text text","user_id":1,"created_at":"2021-03-26T01:19:09.166Z","updated_at":"2021-03-26T01:19:09.166Z"}
		Given There is an instance of Post with id 7 and params: {"id":7,"title":"caderno","body":"text text","user_id":1,"created_at":"2021-03-26T01:21:37.374Z","updated_at":"2021-03-26T01:21:37.374Z"}
		Given There is an instance of Post with id 8 and params: {"id":8,"title":"caderno","body":"text text","user_id":1,"created_at":"2021-03-26T01:21:54.125Z","updated_at":"2021-03-26T01:21:54.125Z"}
		Given There is an instance of Post with id 9 and params: {"id":9,"title":"caderno","body":"text text","user_id":1,"created_at":"2021-03-26T01:23:00.051Z","updated_at":"2021-03-26T01:23:00.051Z"}
		Given There is an instance of Post with id 10 and params: {"id":10,"title":"caderno","body":"text text","user_id":1,"created_at":"2021-03-26T01:26:32.424Z","updated_at":"2021-03-26T01:26:32.424Z"}
		Given There is an instance of Post with id 11 and params: {"id":11,"title":"caderno","body":"text text","user_id":1,"created_at":"2021-03-26T01:26:52.043Z","updated_at":"2021-03-26T01:26:52.043Z"}
		Given There is an instance of Post with id 12 and params: {"id":12,"title":"caderno","body":"text text","user_id":1,"created_at":"2021-03-26T01:27:04.396Z","updated_at":"2021-03-26T01:27:04.396Z"}
		Given There is an instance of Post with id 13 and params: {"id":13,"title":"caderno","body":"text text","user_id":1,"created_at":"2021-03-26T01:46:33.845Z","updated_at":"2021-03-26T01:46:33.845Z"}
		Given There is an instance of User with id 1 and params: {"id":1,"name":"caderno","email":"30caderno@edd.ccce","password_digest":"$2a$12$sFVhoXzJBW/sybU11jEvnOorslBRzrUTaNI7lLBx.qD8oSLf02gaW","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z","token":"7MbgdG267eggnb6z15746yhJ"}
		Given There is an instance of User with id 2 and params: {"id":2,"name":"caderno","email":"30caderno@edd.ccces","password_digest":"$2a$12$Z5fCMhve9qKIT8UVIK8ryeLXko/FtQ/WiTu4omRvpYgXXPJ3qKyqy","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z","token":"7phG9w2oN3Aehs7pFRxHvpq3"}
		Given There is an instance of User with id 4 and params: {"id":4,"name":"caderno","email":"30caderno@edd.cccesdd","password_digest":"$2a$12$bg4w6sHJ/DeveCWp6oE/IepD.Smq5WF27A/gYNvi66uU/I8/LVVTC","created_at":"2021-03-25T18:18:09.644Z","updated_at":"2021-03-25T18:18:09.644Z","token":"tiEPFbRA2U5PUvvtJCioWFLi"}
		Given There is an instance of User with id 5 and params: {"id":5,"name":"caderno","email":"30caddeerno@edd.cccesdd","password_digest":"$2a$12$gFYnpxWdcpE8fjtvWXXfuOOgwcO9TvLeS0lDTX.uWEI5ir3uZWt1u","created_at":"2021-03-26T01:06:30.157Z","updated_at":"2021-03-26T01:06:30.157Z","token":"vGcv7wwDVT9mzthYXvJLoZSQ"}
		When the client requests with GET /users, body: {"controller":"users","action":"index"}, headers: {"Authorization":"KKTAe9iYvZJgPpjQdFpDxYy6"}
		Then the response status should be 200
		And The JSON response should be [{"id":1,"name":"caderno","email":"30caderno@edd.ccce","created_at":"2021-03-25T17:11:20.509Z","updated_at":"2021-03-25T17:11:20.509Z"},{"id":2,"name":"caderno","email":"30caderno@edd.ccces","created_at":"2021-03-25T17:13:28.047Z","updated_at":"2021-03-25T17:13:28.047Z"},{"id":4,"name":"caderno","email":"30caderno@edd.cccesdd","created_at":"2021-03-25T18:18:09.644Z","updated_at":"2021-03-25T18:18:09.644Z"},{"id":5,"name":"caderno","email":"30caddeerno@edd.cccesdd","created_at":"2021-03-26T01:06:30.157Z","updated_at":"2021-03-26T01:06:30.157Z"}]

