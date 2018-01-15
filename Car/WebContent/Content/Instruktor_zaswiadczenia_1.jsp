<%@ page import ="java.sql.*, java.io.*, com.itextpdf.text.*, com.itextpdf.text.pdf.*, java.util.Date, java.text.DateFormat, java.text.SimpleDateFormat, java.util.*, com.itextpdf.text.Font" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		String sql = "SELECT * FROM USERS WHERE USER_ID =" + student;
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){	
			
		Date now = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(now);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String date = format.format(cal.getTime());
			
		// generuje plik
		Document document = new Document();
		BaseFont font = BaseFont.createFont("C:\\Users\\Maciek\\Desktop\\eclipse\\workspace\\Car\\arialuni.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
		PdfWriter.getInstance(document, new FileOutputStream("C:\\Users\\Maciek\\Downloads\\zaswiadczenie - " + resultSet.getString("NAME") + ".pdf"));
		document.open();
		
		String text1 = "Bydgoszcz, dnia " + date;
	    Paragraph a = new Paragraph(text1, new Font(font, 12));
	    a.setAlignment(Element.ALIGN_RIGHT);
	    document.add(a);
	    String text2 = " ";
	    Paragraph b = new Paragraph(text2);
	    b.setAlignment(Element.ALIGN_CENTER);
	    document.add(b);
	    String text3 = " ";
	    Paragraph c = new Paragraph(text3);
	    c.setAlignment(Element.ALIGN_CENTER);
	    document.add(c);
	    String text4 = "Zaświadczenie";
	    Paragraph d = new Paragraph(text4, new Font(font, 22));
	    d.setAlignment(Element.ALIGN_CENTER);
	    document.add(d);
	    String text5 = " ";
	    Paragraph e = new Paragraph(text5);
	    e.setAlignment(Element.ALIGN_CENTER);
	    document.add(e);
	    String text6 = " ";
	    Paragraph f = new Paragraph(text6);
	    f.setAlignment(Element.ALIGN_CENTER);
	    document.add(f);
	    String text7 = "Zaświadcza się, iż " + resultSet.getString("NAME") + " zamieszkały/ła w miejscowości " + resultSet.getString("ADDRESS") + " ukonczył/ła kurs na prawo jazdy kategorii B z wynikiem pozytywnym. Ponadto kurs wykazał, iż nie istnieją żadne przeciwwskazania aby kursant przystąpił do egzaminu na prawo jazdy.";
	    Paragraph g = new Paragraph(text7, new Font(font, 13));
	    g.setAlignment(Element.ALIGN_JUSTIFIED);
	    document.add(g);	
	    String text8 = " ";
	    Paragraph h = new Paragraph(text8);
	    h.setAlignment(Element.ALIGN_CENTER);
	    document.add(h);
	    String text9 = " ";
	    Paragraph i = new Paragraph(text9);
	    i.setAlignment(Element.ALIGN_CENTER);
	    document.add(i);
	    String text10 = "Podpis i pieczęć szkoły";
	    Paragraph j = new Paragraph(text10, new Font(font, 10));
	    j.setAlignment(Element.ALIGN_RIGHT);
	    document.add(j);
	    String text11 = " ";
	    Paragraph k = new Paragraph(text11);
	    k.setAlignment(Element.ALIGN_CENTER);
	    document.add(k);
	    String text12 = " ";
	    Paragraph m = new Paragraph(text12);
	    m.setAlignment(Element.ALIGN_CENTER);
	    document.add(m);
	    String text13 = " ";
	    Paragraph n = new Paragraph(text13);
	    n.setAlignment(Element.ALIGN_CENTER);
	    document.add(n);
	    String text14 = " ";
	    Paragraph o = new Paragraph(text14);
	    o.setAlignment(Element.ALIGN_CENTER);
	    document.add(o);
	    String text15 = " ";
	    Paragraph p = new Paragraph(text15);
	    p.setAlignment(Element.ALIGN_CENTER);
	    document.add(p);
	    String text16 = "**Niniejszy dokument jest potwierdzeniem ukończenia kursu na prawo jazdy kategorii B. Należy przedstawić go w odpowiedniej placówce Wojewódzkiego Ośrodka Ruchu Drogowego podczas składania wniosku o przeprowadzenie egzaminu na prawo jazdy kategorii B.";
	    Paragraph r = new Paragraph(text16, new Font(font, 8));
	    r.setAlignment(Element.ALIGN_JUSTIFIED);
	    document.add(r);
	    
		document.close();
		response.sendRedirect("Instruktor_zaswiadczenia_0.jsp");
		}
	%>
</body>
</html>