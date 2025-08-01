<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%//넘어 오는 값 받기
   	  //http://localhost:8080/prjJSP01/userlist.jsp?name=all
   	  String name = request.getParameter("name");
      if(name == null)
    	  name = "all";
      System.out.println(name);
      
      //문자열
	    String driver = "oracle.jdbc.OracleDriver";
        String url ="jdbc:oracle:thin:@192.168.0.60:1521:xe";
        String dbuid = "test";
        String dbpwd = "1234";
		
      
      //db조회
      	if(name.equals("all")){
      		name = "";	
      	}
   		Class.forName(driver);
      	Connection conn = DriverManager.getConnection(url,dbuid,dbpwd);
      	
      	String sql = "select * from tuser where name like ? order by id asc";
      	PreparedStatement pstmt = conn.prepareStatement(sql);
      	pstmt.setString ( 1, "%" + name + "%");
      	ResultSet rs = pstmt.executeQuery();
      	      
      	
      	String tag = "<table id='t2'>";
      	while(rs.next()){
      		int id 	     = rs.getInt("id");
	      	tag += "<tr>";
	      	tag += "<td>" + rs.getInt("id") + "</td>";
	      	tag += "<td>" + rs.getString("name") + "</td>";
	      	tag += "<td>" + rs.getString("userid") + "</td>";
	      	tag += "<td>" + rs.getString("password") + "</td>";
	      	tag += "<td>" + rs.getString("email") + "</td>";
	      	tag += "<td>" + rs.getString("regdate") + "</td>";
	      	tag += "<td><a href ='deluser.jsp?id="+ id + "'>  삭제  </a></td>";
	      	tag +="</tr>";
      	}
      	tag += "</table>";
      	rs.close();
      	pstmt.close();
      	conn.close();
      	
      	/* }else{
    	}
       */
      
      
      //출력한 html만들기
    %>
<!DOCTYPE html>
<html>
<script src = "https://code.jquery.com/jquery.min.js"></script>
<style>
table,th,td{
border:1px solid black;
border-collapse: collapse;
}
table{width :80% ; margin: 0 auto;}
td {padding:20px; }
h2{text-align: center;}


 table, th, td { 
      border:1px solid black;
      border-collapse: collapse;
   }
   #t1, #t2  { width :80%; margin:0 auto;}
   td     { padding: 10px; }  
   h2     { text-align: center; }  
   
   #t1   td  { text-align : center; }
   #t1   td:nth-of-type(1) input {width:40px;}
   #t1   td:nth-of-type(2) input  {width:120px;}
   #t1   td:nth-of-type(3) input  {width:120px;}
   #t1   td:nth-of-type(4) input  {width:120px;}
   #t1   td:nth-of-type(5) input  {width:120px;}
   #t1   td:nth-of-type(6) input  {width:120px;}
   
   
   #t1   [name="name"], [name="passwd"], [name="email"]    
      { border:2px solid red;   }
      
      
</style>

<script>
$(function(){
	console.log($('tr'))
	$('#t2 tr').on({
		mouseover:function(){
			$(this).css({backgroundColor:'cyan', color:'white'})
			
		},
		mouseout:function(){
			$(this).css({backgroundColor:'white', color:'black'})
			
		},dblclick : function(){
			console.dir(this)
			// for (var i = 0; i< this.childNodes.length-1; i++) -1 마지막 껀 제외
			for (var i = 0; i< this.childNodes.length-1; i++) {
				let td = this.childNodes[i]
				const input = document.querySelectorAll('#t1 input')[i]
				input.value = td.innerHTML
				
			}
		}
			/* console.log(this)
			this.childNodes.forEach(function(td,i){
				$('#t1 input').eq(i).val(td.innerHTML)
				
			}) */
			
		/* 	name = this.childNodes[1].innerHTML
			$('#1 td[name = "name"]').val(name)
			alert(name) */
		
	})
})
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>사용자 목록 조회 결과</h2>
	<a href ="tuserlist.html">HOME</a>
	<form action = "updateuser.jsp" method ="get">
		<table id = "t1">
			<tr>
			 <!-- readonly 읽기만가능  -->
				<td><input type ="text" name="id" readonly value = "123"></td>
				<td><input type ="text" name="name"></td>
				<td><input type ="text" name="userid" readonly></td>
				<td><input type ="text" name="password"></td>
				<td><input type ="text" name="email"></td>
				<td><input type ="text" name="regdate"></td>
				<td><input type ="submit" value="수정"></td>
			</tr>
		</table>
	</form>
	<P><%=tag %></P>
</body>
</html>