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
		String lesson_id = request.getParameter("lesson_id"); // w nawiasie wpisana jest nazwa inputa z Instruktor_lekcje_edycja_1.jsp
		String lesson_type = request.getParameter("lesson_type");
		String lesson_name = request.getParameter("lesson_name");
		String hour_start = request.getParameter("hour_start");
		String hour_end = request.getParameter("hour_end");
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
		String sql = "UPDATE LESSONS SET LESSON_TYPE ='"+lesson_type+"', LESSON_NAME ='"+lesson_name+"', HOUR_START ='"+hour_start+"', HOUR_END ='"+hour_end+"' WHERE LESSON_ID = " + lesson_id;
		statement.executeUpdate(sql);
		
		response.sendRedirect("Instruktor_lekcje_0.jsp");
	%>
</body>
</html>