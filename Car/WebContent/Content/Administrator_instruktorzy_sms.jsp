<%@ page import ="java.sql.*, java.io.*, java.net.*" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		String lesson_id = request.getParameter("lesson_id");
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/car?verifyServerCertificate=false&useSSL=true";
		String user = "root";
	    String pass = "root";
	    
		Connection connection = null;
	    Statement statement = null;
		ResultSet resultSet = null;
			
		connection = DriverManager.getConnection(url, user, pass);
		statement = connection.createStatement();
		String sql = "SELECT * FROM LESSONS INNER JOIN USERS ON LESSONS.INSTRUCTOR_ID = USERS.USER_ID WHERE LESSON_ID =" + lesson_id;
		resultSet = statement.executeQuery(sql);
		resultSet.next();
		String phone_number = resultSet.getString("USERS.PHONE_NUMBER");
		String user_name = resultSet.getString("USERS.NAME");
		String date = resultSet.getString("DATE");
		String hour_start = resultSet.getString("HOUR_START");
		String lesson_type = resultSet.getString("LESSON_TYPE");
		String lesson_name = resultSet.getString("LESSON_NAME");
			
		//Wysyłanie SMS	
		StringBuilder result = new StringBuilder();
		String tresc = "Witaj "+user_name+". Dnia "+date+" o godzinie "+hour_start+" przeprowadzisz zajęcia "+lesson_type+" z " +lesson_name+ ". Do zobaczenia! Szkola jazdy.";	//tresc smsa
		tresc = tresc.replace(" ", "%20");
		String number = phone_number;
		String urlToRead = "https://api.smsapi.pl/sms.do?username=matomw37@gmail.com&password=8c059f8c2e56fdec828217cb4b68f0ea&to="+phone_number+"&message="+tresc+"&format=json";
		URL smsUrl = new URL(urlToRead);
		HttpURLConnection conn = (HttpURLConnection) smsUrl.openConnection();
		conn.setRequestMethod("GET");
		BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		String line;
		while ((line = rd.readLine()) != null) {
			result.append(line);
		}
		rd.close();
		response.sendRedirect("Administrator_lekcje_instruktorzy_0.jsp");
		%>			
</body>
</html>