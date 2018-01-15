<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Szkoła Jazdy</title>
	<link rel="stylesheet" href="style.css?v=<%= java.lang.Math.random() %>">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div class="login-container">
		<form action="Walidacja.jsp">
			<img src="Image\user.png" class="login-logo">
			<div class="login-form">
				<h2>Zaloguj się</h2>
				<i class="fa fa-user fa-2x cust" aria-hidden="true"></i>
				<input type="text" name="email" value="" placeholder="Podaj email"><br/>
				<i class="fa fa-lock fa-2x cust" aria-hidden="true"></i>
				<input type="password" name="password" value="" placeholder="Podaj hasło"><br/>
				<input type="submit" name="submit" class="zaloguj" value="Zaloguj"><br/>
				<%/*%><a href="" class="rem-pass-text">Nie pamiętasz hasła?</a><%*/%>
			</div>
		</form>
	</div>
	<div class="footer-login">
		<div class="footer-login-in">
			<p>Created by Maciej Tomczak Copyright © 2017</p>
		</div>
	</div>
</body>
</html>