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
		String date = request.getParameter("date"); // w nawiasie wpisana jest nazwa inputa z Kursant_lekcje_1.jsp
	
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
				<h1 class="content-tittle">Zapisz się na lekcję</h1>
				<hr>
			</div>
			<div class="content-in-down">
				<div class="content-in-down-in-left">
					<label class="label-1">Typ lekcji: </label>
					<label class="label-2">Nazwa lekcji: </label>
					<label class="label-2">Godzina rozpoczęcia: </label>
					<label class="label-2">Godzina zakończenia: </label>
					<label class="label-2">Instruktorzy: </label>
				</div>
				<%
					connection = DriverManager.getConnection(url, user, pass);
					statement = connection.createStatement();
					String sql = "SELECT * FROM USERS WHERE TYPE = 'Instruktor'";
					resultSet = statement.executeQuery(sql);
				%> 
				<form action="Kursant_lekcje_3.jsp" enctype="multipart/form-data">
					<div class="content-in-down-in-right">
						<input type="hidden" name="id" value="<%=userId%>"/>
						<input type="hidden" name="date" value="<%=date%>">
						<select name="lesson_type">
							<option value=""></option>
							<option value="Teoria">Teoria</option>
							<option value="Praktyka">Praktyka</option>
						</select>
						<input type="text" name="lesson_name">
						<input type="time" name="hour_start">
						<input type="time" name="hour_end">
						<select name="instructor">
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
					<input type="submit" name="edit" class="dodaj2" value="Dodaj">
				</form>
				<form action="Kursant_lekcje_1.jsp">
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