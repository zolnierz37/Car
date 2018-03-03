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
						<li class="nav-left"><a href="Administrator.jsp" class="nav-text">Strona główna</a></li>
						<li class="nav-left"><a href="Administrator_profil_edycja_1.jsp" class="nav-text">Profil</a></li>
						<li class="nav-left"><a href="Administrator_kursanci.jsp" class="nav-text">Kursanci</a></li>
						<li class="nav-left"><a href="Administrator_instruktorzy.jsp" class="nav-text">Instruktorzy</a></li>
						<li class="nav-left"><a href="Administrator_lekcje.jsp" class="nav-text">Lekcje</a></li>
						<li class="nav-left"><a href="Administrator_archiwum.jsp" class="nav-text">Archiwum</a></li>
						<li class="nav-left"><a href="Administrator_zaswiadczenia_0.jsp" class="nav-text">Zaświadczenia</a></li>
						<li class="nav-left"><a href="Administrator_gps.jsp" class="nav-text">Śledź</a></li>
						<li class="nav-right"><a href="Wylogowanie.jsp" class="nav-text">Wyloguj</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="content">
			<div class="content-in-up">
				<h1 class="content-tittle">Archiwum</h1>
				<hr>
			</div>
			<div class="content-in-down">
				<div class="content-in-down-in-left">
					<label class="label-1">Wybierz kursanta: </label>
				</div>
				<%
					connection = DriverManager.getConnection(url, user, pass);
					statement = connection.createStatement();
					String sql = "SELECT * FROM USERS WHERE TYPE = 'Kursant'";
					resultSet = statement.executeQuery(sql);
				%> 
				<form action="Administrator_archiwum_kursanci_1.jsp" enctype="multipart/form-data">
					<div class="content-in-down-in-right">
						<select name="student">
							<option value=""></option>
							<%  
								while(resultSet.next())
								{
							%>
							<option value="<%= resultSet.getString(1)%>"><%= resultSet.getString(2)%></option>
        					<% 
        						}
        					%>
						</select>
					</div>
					<input type="submit" name="edit" class="dodaj2" value="Wyświetl">
				</form>
				<form action="Administrator_archiwum.jsp">
					<input type="submit" name="edit" class="cofnij" value="Cofnij">
				</form>
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