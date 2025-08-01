<%@page import = "java.sql.*" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<% //java 서버
	//System.out.println("<h2>Hello </h2>");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	String Uname = request.getParameter("Uname");
	
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.60:1521:XE", "test", "1234");
	String sql = "SELECT * FROM TUSER where name = ?"; //db 조회
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,Uname);
	
	rs = pstmt.executeQuery();
	String msg = "<ul>";
	
	while(rs.next()){
		int id 			= rs.getInt("id");
		String name 	= rs.getString("name");
		String userid	= rs.getString("userid");
		String password = rs.getString("password");
		String email    = rs.getString("email");
		String regdate  = rs.getString("regdate");
		

		String fmt = "<li>";
		fmt += "%d %s %s %s %s %s";
		fmt += "</li>";
		msg += String.format(fmt,
					id,name,userid,password,email,regdate);
	}
	msg += "</li>";
//----------------------------------------------------------------	
	rs.close();
	pstmt.close();
	conn.close();
	
	
	%>
    <!-- html  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=msg%>




</body>
</html>