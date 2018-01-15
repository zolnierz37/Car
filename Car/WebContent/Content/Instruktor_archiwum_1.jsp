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
				<h1 class="content-tittle">Archiwum</h1>
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
						String sql = "SELECT * FROM LESSONS INNER JOIN USERS ON LESSONS.INSTRUCTOR_ID = USERS.USER_ID WHERE (STUDENT_ID = " + student + ") AND (ARCHIVES = 'Tak') ORDER BY DATE";
						resultSet = statement.executeQuery(sql);
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
				<form action="Instruktor_archiwum_0.jsp">
					<input type="submit" name="edit" class="cofnij" value="Cofnij">
				</form>
			</div>
		</div>
		<div class="footer">
			<div class="footer-in">
				<p>Created by Maciej Tomczak Copyright © 2017</p>
			</div>
		</div>
	</div>
</body>
</html>