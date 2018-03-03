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
				<h1 class="content-tittle">Spis lekcji</h1>
				<form action="Instruktor_lekcje_1.jsp">
					<input type="submit" name="add" class="dodaj1" value="Dodaj">
				</form>	
				<hr>
			</div>
			<div class="content-in-down-table">
				<table class="tabela-kursanci">
					<tr>
				    	<th class="opisy">Typ lekcji </th>
						<th class="opisy">Nazwa </th>
						<th class="opisy">Kursant </th>
						<th class="opisy">Data </th>
						<th class="opisy">Godz. od - do </th>
						<th class="opisy">Zarządzaj </th>
				  	</tr>
				  	<%
						connection = DriverManager.getConnection(url, user, pass);
						statement = connection.createStatement();
						//String sql = "SELECT * FROM LESSONS WHERE INSTRUCTOR_ID = " + userId + " ORDER BY DATE";
						String sql = "SELECT * FROM LESSONS INNER JOIN USERS ON LESSONS.STUDENT_ID = USERS.USER_ID WHERE (INSTRUCTOR_ID =" + userId + ") AND (ARCHIVES = 'Nie') ORDER BY DATE";
						resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
					%>
				  	<tr>
						<td class="wartosci"><%=resultSet.getString("LESSON_TYPE")%></td>
						<td class="wartosci"><%=resultSet.getString("LESSON_NAME")%></td>
						<td class="wartosci"><%=resultSet.getString("USERS.NAME")%></td>
						<td class="wartosci"><%=resultSet.getString("DATE")%></td>
						<td class="wartosci"><%=resultSet.getString("HOUR_START")%> - <%=resultSet.getString("HOUR_END")%></td>
						<td class="wartosci">
							<form action="Instruktor_lekcje_edytuj_1.jsp">
								<input type="hidden" name="lesson_id" value="<%=resultSet.getString("LESSON_ID") %>"/>
								<input type="hidden" name="lesson_type" value="<%=resultSet.getString("LESSON_TYPE")%>">
								<input type="hidden" name="lesson_name" value="<%=resultSet.getString("LESSON_NAME")%>">
								<input type="hidden" name="user_name" value="<%=resultSet.getString("USERS.NAME")%>">
								<input type="hidden" name="date" value="<%=resultSet.getString("DATE")%>">
								<input type="hidden" name="hour_start" value="<%=resultSet.getString("HOUR_START")%>">
								<input type="hidden" name="hour_end" value="<%=resultSet.getString("HOUR_END")%>">
								<input class="btn-edytuj" type="submit" value="Edytuj"/>
							</form>
							<form action="Instruktor_lekcje_usun.jsp">
								<input type="hidden" name="lesson_id" value="<%=resultSet.getString("LESSON_ID") %>"/>
								<input class="btn-usun" type="submit" value="Usuń"/>
							</form>
							<form action="Instruktor_sms.jsp">
								<input type="hidden" name="lesson_id" value="<%=resultSet.getString("LESSON_ID") %>"/>
								<input class="btn-sms" type="submit" value="SMS"/>
							</form>
							<form action="Instruktor_archiwum_dodaj.jsp">
								<input type="hidden" name="lesson_id" value="<%=resultSet.getString("LESSON_ID") %>"/>
								<input class="btn-arch" type="submit" value="Archiw."/>
							</form>
						</td>
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