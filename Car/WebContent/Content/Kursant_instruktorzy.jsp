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
						<li class="nav-left"><a href="Kursant.jsp" class="nav-text">Strona główna</a></li>
						<li class="nav-left"><a href="Kursant_profil_edycja_1.jsp" class="nav-text">Profil</a></li>
						<li class="nav-left"><a href="Kursant_instruktorzy.jsp" class="nav-text">Instruktorzy</a></li>
						<li class="nav-left"><a href="Kursant_lekcje_0.jsp" class="nav-text">Lekcje</a></li>
						<li class="nav-left"><a href="Kursant_archiwum.jsp" class="nav-text">Archiwum</a></li>
						<li class="nav-right"><a href="Wylogowanie.jsp" class="nav-text">Wyloguj</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="content">
			<div class="content-in-up">
				<h1 class="content-tittle">Baza instruktorów</h1>
				<hr>
			</div>
			<div class="content-in-down-table">
				<table class="tabela-kursanci">
					<tr>
				    	<th class="opisy">Imię i nazwisko </th>
						<th class="opisy">Email </th>
						<th class="opisy">Numer telefonu </th>
				  	</tr>
				  	<%
						connection = DriverManager.getConnection(url, user, pass);
						statement = connection.createStatement();
						String sql = "SELECT * FROM USERS WHERE TYPE = 'Instruktor' ORDER BY USER_ID";
						resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
					%>
				  	<tr>
						<td class="wartosci"><%=resultSet.getString("NAME")%></td>
						<td class="wartosci"><%=resultSet.getString("EMAIL")%></td>
						<td class="wartosci"><%=resultSet.getString("PHONE_NUMBER")%></td>
					</tr>
					<%
						}
					%>
				</table>	
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