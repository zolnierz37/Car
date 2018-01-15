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
				<h1 class="content-tittle">Wybierz dzień</h1>
				<hr>
			</div>
			<div style="" class="content-in-down">
				<div class="content-in-down-in-data">
					<%
						for(int i = 0; i < 18; i++)
						{
							Date now = new Date();
							Calendar cal = Calendar.getInstance();
							cal.setTime(now);
							cal.add(Calendar.DATE, i);
							SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
							String date = format.format(cal.getTime());
					%>
							<form action="Kursant_lekcje_2.jsp?date=<% out.println(date); %>">
								<input type="submit" name="date" class="data" value="<% out.println(date); %>"/>
								<input type="hidden" name="date" value="<%=date%>"/>
							</form>
					<%
						}
					%>
							<form action="Kursant_lekcje_0.jsp">
								<input type="submit" name="edit" class="cofnij" value="Cofnij">
							</form>
				</div>
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