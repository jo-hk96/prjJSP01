<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
//넘어온 정보를 변수에 받는다.
request.setCharacterEncoding("utf-8"); //넘어온정보 한글 처리
String name = request.getParameter("name");
String userid = request.getParameter("userid");
String password = request.getParameter("password");
String email = request.getParameter("email");

//db연결
String driver = "oracle.jdbc.OracleDriver";
String url ="jdbc:oracle:thin:@192.168.0.60:1521:xe";
String dbuid = "test";
String dbpwd = "1234";
//db에 저장
Class.forName(driver);
Connection conn = DriverManager.getConnection(url,dbuid,dbpwd);

String sql = "insert into tuser(ID,NAME,USERID,PASSWORD,EMAIL) VALUES(SEQID.NEXTVAL,?,?,?,?)";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1,name);
pstmt.setString(2,userid);
pstmt.setString(3,password);
pstmt.setString(4,email);
pstmt.executeUpdate(); //insert,delete,update

pstmt.close();
conn.close();

//입력한 경로로 이동
String loc ="http://localhost:8080/prjJSP01/user/userlist.jsp?name=all"; 
response.sendRedirect(loc);

%>