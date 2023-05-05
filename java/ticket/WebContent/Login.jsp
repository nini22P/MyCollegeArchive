<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd 

">
	<html>

	<head>
		<style type="text/css">
			body {
				text-align: center;
			}

			.a {
				margin: 10% auto;
				width: 400px;
				height: 150px;
				border-width: 1px;
				border-style: solid;
				border-color: #ccccff;
				background-color: white
			}

			.a1 {
				background-color: #eeeeee;
				font-family: 隶书;
				font-size: 35px;
				border-width: 2px 0 1px 0;
				border-style: solid;
				border-color: #ccccff
			}

			.a2 {
				font-family: 隶书;
				font-size: 25px;
			}
		</style>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>登录</title>
	</head>

	<body>
		<div class="a">
			<div class="a1">&nbsp网上铁路购票系统登录&nbsp</div>
			<div class="a2">
				<form action="loading.jsp" method="post">
					<span class="b1">账户:<input type="text" name="Id" /></span><br />
					<span class="b2">密码:<input type="password" name="Password" /></span><br />
			</div><br />
			<div class="a3">
				<input type="reset" value="重置">
				<input type="submit" value="登录" />
			</div>
			</form>
		</div>
	</body>

	</html>