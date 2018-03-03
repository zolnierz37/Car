<%@ page import ="java.sql.*, java.util.Date, java.text.DateFormat, java.text.SimpleDateFormat, java.util.*"  language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		String student = request.getParameter("student");
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/car?verifyServerCertificate=false&useSSL=true";
		String user = "root";
	    String pass = "root";
        
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        
        connection = DriverManager.getConnection(url, user, pass);
		statement = connection.createStatement();
		//String sql = "SELECT * FROM LESSONS WHERE INSTRUCTOR_ID = " + userId + " ORDER BY DATE";
		String sql1 = "SELECT * FROM USERS WHERE USER_ID =" + student;
		resultSet = statement.executeQuery(sql1);
		while(resultSet.next()){
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
				<h1 class="content-tittle">Archiwum kursanta <%=resultSet.getString("NAME")%></h1>
				<%
					}
				%>
				<hr>
			</div>
			<div class="content-in-down-table">
				<table class="tabela-kursanci">
					<tr>
				    	<th class="opisy">Typ lekcji </th>
						<th class="opisy">Nazwa </th>
						<th class="opisy">Instruktor </th>
						<th class="opisy">Data </th>
						<th class="opisy">Godz. od - do </th>
				  	</tr>
				  	<%
						connection = DriverManager.getConnection(url, user, pass);
						statement = connection.createStatement();
						String sql2 = "SELECT * FROM LESSONS INNER JOIN USERS ON LESSONS.INSTRUCTOR_ID = USERS.USER_ID WHERE (STUDENT_ID = " + student + ") AND (ARCHIVES = 'Tak') ORDER BY DATE";
						resultSet = statement.executeQuery(sql2);
						while(resultSet.next()){
					%>
				  	<tr>
						<td class="wartosci"><%=resultSet.getString("LESSON_TYPE")%></td>
						<td class="wartosci"><%=resultSet.getString("LESSON_NAME")%></td>
						<td class="wartosci"><%=resultSet.getString("USERS.NAME")%></td>
						<td class="wartosci"><%=resultSet.getString("DATE")%></td>
						<td class="wartosci"><%=resultSet.getString("HOUR_START")%> - <%=resultSet.getString("HOUR_END")%></td>
					</tr>
					<%
						}
					%>
				</table>
				<form action="Administrator_archiwum_kursanci_0.jsp">
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