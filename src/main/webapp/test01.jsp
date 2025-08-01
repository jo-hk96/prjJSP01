<%@page import="java.util.Date"%> <!-- new Date() 는 sql import 안댐 -->
<%@page import="java.text.SimpleDateFormat"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- ctrl + shift + M 임포트 -->
	<!-- ctrl + shift + /  주석 -->
    <%
     String 		  header = "Hello world!!!!!!!!";
     Date             today  = new Date();
     SimpleDateFormat sdf    = new SimpleDateFormat("yyyy년MM월dd일"); 
     String now              = sdf.format(today);    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%=header %></h1>
	<p>서버의 시간(JSP)</p>
	<p><%=now %></p>
	<p>클라이언트의 시간(Javascript)</p>
<script>
	const lastP     = document.querySelector('p:last-of-type')//p중 마지막 자식 선택
	let today       = new Date(); //today 
	lastP.innerHTML = today.toLocaleString(); //lastP 한국시간
</script>
</body>
</html>