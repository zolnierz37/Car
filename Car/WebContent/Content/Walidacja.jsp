<%@ page import ="java.sql.*" %>
<%
	String email = request.getParameter("email");
    String password = request.getParameter("password");
    //Class.forName ("org.h2.Driver");
    //Connection conn = DriverManager.getConnection("jdbc:h2:~/test", "maciek", "maciek");
    Class.forName ("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/car?verifyServerCertificate=false&useSSL=true", "root", "root");
	PreparedStatement pst = conn.prepareStatement("SELECT * FROM USERS WHERE EMAIL=? AND PASSWORD=?");
	pst.setString(1, email);
	pst.setString(2, password);
	ResultSet rs = pst.executeQuery();                        
	if(rs.next()) {
		Integer userId = rs.getInt("USER_ID");
		String userType = rs.getString("TYPE");
    	session = request.getSession();
    	session.setAttribute("userId", userId);	
		response.sendRedirect(userType + ".jsp"); 
	} else {
		response.sendRedirect("Logowanie.jsp");   
	}
%>