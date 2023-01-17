<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*, java.util.*" %>
<%@ include file="conn_oracle.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, td, tr {
	 border-collapse: collapse;
	 text-align: center;
	}
</style>

</head>
<body>
show01
<%

String sql = null;
Statement stmt = null;
ResultSet rs = null;

sql = "select * from guestlab";

stmt = conn.createStatement();

rs = stmt.executeQuery(sql);

if(rs.next()) {
	do{
		

%>

	<div>
		<table width=500px border=1px>
			<tr>
				<td>사번</td>
				<td><%= rs.getString("idx") %></td>
			</tr>
			<tr>
				<td> 이름  </td>
				<td><%= rs.getString("ename") %></td>
			</tr>
			<tr>
				<td>폰번호  </td>
				<td><%= rs.getString("phone") %></td>
			</tr>
			<tr>
				<td>성별 </td>
				<td><%= rs.getString("gender") %></td>
			</tr>
			<tr>
				<td>주소  </td>
				<td><%= rs.getString("addr") %></td>
			</tr>
		</table>
	</div>
<%
	}while (rs.next());
	
}
else {
	out.println("방명록에 데이터가 존재하지 않습니다.");
}

%>

<div>
	<a href="guestlab_write.html"><img src="images/write.gif" width=100px></a>
</div>

</body>
</html>