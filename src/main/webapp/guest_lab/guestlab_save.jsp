<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*, java.util.*" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!-- DB접속 -->
<%@ include file = "conn_oracle.jsp" %>

<!-- DB로 전송할 값 받아오기 -->
<%	
	String idx = request.getParameter("idx");
	String en = request.getParameter("ename");
	String ph = request.getParameter("phone");
	String gd = request.getParameter("gender");	
	String add = request.getParameter("addr");
	
%>

<!-- 변수를통해 넢어오는 값을 쿼리로 저장 -->
<%
	String sql = null; //SQL쿼리를 담을 변수
	Statement stmt = null; //쿼리를 DB에서 적용할 변수
	
	try {
		
		stmt = conn.createStatement();
		
		sql = "insert into guestlab (idx, ename, phone, gender, addr)";
		sql = sql + "values ('"+idx+"','"+en+"','"+ph+"','"+gd+"','"+add+"')";

		int cnt = 0 ; //sql 쿼리가 잘 처리되었는지 확인 변수 

		//Statement 객체가 sql 쿼리를 실행해서 DB에 저장 
		cnt = stmt.executeUpdate(sql);
		
	}
	catch(Exception e) {
		out.println("Data Base Insert 중 문제가 발생되었습니다. <p/>");
		out.println("고객센터로 문의 바랍니다. 02-111-1111");
		e.printStackTrace();
	}finally {
		//객체 제거
		if(conn != null) {
			conn.close();
		}if(stmt != null){
			stmt.close();
		}}
	
	response.sendRedirect("guestlab_list.jsp");

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 정보를 받아 페이지로 이동</title>
</head>
<body>

</body>
</html>