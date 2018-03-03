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
		String lesson_id = request.getParameter("lesson_id"); // w nawiasie wpisana jest nazwa inputa z Instruktor_lekcje_0.jsp
		String lesson_type = request.getParameter("lesson_type");
		String lesson_name = request.getParameter("lesson_name");
		String date = request.getParameter("date");
		String hour_start = request.getParameter("hour_start");
		String hour_end = request.getParameter("hour_end");
		String user_name = request.getParameter("user_name");
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
				<h1 class="content-tittle">Edycja danych lekcji</h1>
				<hr>
			</div>
			<div class="content-in-down">
				<div class="content-in-down-in-left">
					<label class="label-1">Typ lekcji: </label>
					<label class="label-2">Nazwa lekcji: </label>
					<label class="label-2">Godzina rozpoczęcia: </label>
					<label class="label-2">Godzina zakończenia: </label>
					<label class="label-2">Kursanci: </label>
				</div>
				<form action="Instruktor_lekcje_edytuj_2.jsp" enctype="multipart/form-data">
					<div class="content-in-down-in-right">
						<input type="hidden" name="lesson_id" value="<%=lesson_id%>"/>
						<select name="lesson_type">
							<option value="<%=lesson_type%>"><%=lesson_type%></option>
						</select>
						<input type="text" name="lesson_name" value="<%=lesson_name%>">
						<input type="time" name="hour_start" value="<%=hour_start%>">
						<input type="time" name="hour_end" value="<%=hour_end%>">
						<select name="student">
							<option value=""><%=user_name%></option>
						</select>
					</div>
					<input type="submit" name="edit" class="zapisz" value="Zapisz">
				</form>
				<form action="Instruktor_lekcje_0.jsp">
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