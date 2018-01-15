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
				<h1 class="content-tittle">Baza kursantów</h1>
				<form action="Instruktor_kursanci_dodaj_1.jsp">
					<input type="submit" name="add" class="dodaj1" value="Dodaj">
				</form>
				<hr>
			</div>
			<div class="content-in-down-table">
				<table class="tabela-kursanci">
					<tr>
				    	<th class="opisy">Imię i nazwisko </th>
						<th class="opisy">Email </th>
						<th class="opisy">Numer telefonu </th>
						<th class="opisy">Adres </th>
						<th class="opisy">Zarządzaj </th>
				  	</tr>
				  	<%
						connection = DriverManager.getConnection(url, user, pass);
						statement = connection.createStatement();
						String sql = "SELECT * FROM USERS WHERE TYPE = 'Kursant' ORDER BY USER_ID";
						resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
					%>
				  	<tr>
						<td class="wartosci"><%=resultSet.getString("NAME")%></td>
						<td class="wartosci"><%=resultSet.getString("EMAIL")%></td>
						<td class="wartosci"><%=resultSet.getString("PHONE_NUMBER")%></td>
						<td class="wartosci"><%=resultSet.getString("ADDRESS")%></td>
						<td class="wartosci">
							<form action="Instruktor_kursanci_edytuj_1.jsp">
								<input type="hidden" name="id" value="<%=resultSet.getString("USER_ID") %>"/>
								<input type="hidden" name="name" value="<%=resultSet.getString("NAME")%>">
								<input type="hidden" name="email" value="<%=resultSet.getString("EMAIL")%>">
								<input type="hidden" name="password" value="<%=resultSet.getString("PASSWORD")%>">
								<input type="hidden" name="phone_number" value="<%=resultSet.getString("PHONE_NUMBER")%>">
								<input type="hidden" name="address" value="<%=resultSet.getString("ADDRESS")%>">
								<input class="btn-edytuj" type="submit" value="Edytuj"/>
							</form>
							<form action="Instruktor_kursanci_usun.jsp">
								<input type="hidden" name="id" value="<%=resultSet.getString("USER_ID") %>"/>
								<input class="btn-usun" type="submit" value="Usuń"/>
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
				<p>Created by Maciej Tomczak Copyright © 2017</p>
			</div>
		</div>
	</div>
</body>
</html>