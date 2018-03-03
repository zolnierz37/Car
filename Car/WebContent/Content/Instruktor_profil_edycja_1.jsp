<%@ page import ="java.sql.*" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session = request.getSession();
	if (session.getAttribute("userId") == null) {
		response.sendRedirect("Logowanie.jsp"); 
	}
	Integer userId = (Integer)session.getAttribute("userId");
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Szkoła Jazdy</title>
	<link rel="stylesheet" href="style.css?v=<%= java.lang.Math.random() %>">
</head>
<body>
	<%
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/car?verifyServerCertificate=false&useSSL=true";
		String user = "root";
	    String pass = "root";
        
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
	%>
	<div>
		<div class="header">
			<div class="logo-bar">
				<div class="logo-bar-in">
				</div>
			</div>
			<div class="navigation-bar">
				<div class="navigation-bar-in">
					<ul>
						<li class="nav-left"><a href="Instruktor.jsp" class="nav-text">Strona główna</a></li>
						<li class="nav-left"><a href="Instruktor_profil_edycja_1.jsp" class="nav-text">Profil</a></li>
						<li class="nav-left"><a href="Instruktor_kursanci.jsp" class="nav-text">Kursanci</a></li>
						<li class="nav-left"><a href="Instruktor_lekcje_0.jsp" class="nav-text">Lekcje</a></li>
						<li class="nav-left"><a href="Instruktor_archiwum_0.jsp" class="nav-text">Archiwum</a></li>
						<li class="nav-left"><a href="Instruktor_zaswiadczenia_0.jsp" class="nav-text">Zaświadczenia</a></li>
						<li class="nav-left"><a href="Instruktor_gps_0.jsp" class="nav-text">Śledź</a></li>
						<li class="nav-right"><a href="Wylogowanie.jsp" class="nav-text">Wyloguj</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="content">
			<div class="content-in-up">
				<h1 class="content-tittle">Edycja danych użytkownika</h1>
				<hr>
			</div>
			<div class="content-in-down">
				<div class="content-in-down-in-left">
					<label class="label-1">Imię i nazwisko: </label>
					<label class="label-2">Email: </label>
					<label class="label-2">Hasło: </label>
					<label class="label-2">Numer telefonu: </label>
					<label class="label-2">Adres zamieszkania: </label>
				</div>
				<%
					connection = DriverManager.getConnection(url, user, pass);
					statement = connection.createStatement();
					String sql = "SELECT * FROM USERS WHERE USER_ID = " + userId;
					resultSet = statement.executeQuery(sql);
					while(resultSet.next()){
				%>
				<form action="Instruktor_profil_edycja_2.jsp" enctype="multipart/form-data">
					<div class="content-in-down-in-right">
						<input type="hidden" name="id" value="<%=resultSet.getString("USER_ID")%>"/>
						<input type="text" name="name" value="<%=resultSet.getString("NAME")%>">
						<input type="text" name="email" value="<%=resultSet.getString("EMAIL")%>">
						<input type="password" name="password" value="<%=resultSet.getString("PASSWORD")%>">
						<input type="number" name="phone_number" value="<%=resultSet.getString("PHONE_NUMBER")%>">
						<input type="text" name="address" value="<%=resultSet.getString("ADDRESS")%>">
					</div>
					<input type="submit" name="edit" class="edytuj" value="Zapisz">
				</form>
				<%
					}
				%>
			</div>
		</div>
		<div class="footer">
			<div class="footer-in">
				<p>Created by Maciej Tomczak Copyright © 2018</p>
			</div>
		</div>
	</div>
</body>
</html>