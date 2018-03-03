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
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Szkoła Jazdy</title>
	<link rel="stylesheet" href="style.css?v=<%= java.lang.Math.random() %>">
</head>
<body>
	<%
		String name = request.getParameter("name"); // w nawiasie wpisana jest nazwa inputa z Administrator_kursanci_dodaj_1.jsp
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phone_number = request.getParameter("phone_number");
		String address = request.getParameter("address");
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/car?verifyServerCertificate=false&useSSL=true";
		String user = "root";
        String pass = "root";
        
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        
        connection = DriverManager.getConnection(url, user, pass);
		statement = connection.createStatement();
		String sql = "INSERT INTO USERS (USER_ID, NAME, EMAIL, PASSWORD, TYPE, PHONE_NUMBER, ADDRESS) VALUES (default, '"+name+"', '"+email+"', '"+password+"', 'Kursant', '"+phone_number+"', '"+address+"')";
		statement.executeUpdate(sql);
		
		response.sendRedirect("Administrator_kursanci.jsp");
	%>
</body>
</html>