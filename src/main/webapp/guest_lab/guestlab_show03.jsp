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
show03
<%

ArrayList idx = new ArrayList();
ArrayList ename = new ArrayList();
ArrayList phone = new ArrayList();
ArrayList gender = new ArrayList();
ArrayList addr = new ArrayList();

String sql = null;
Statement stmt = null;
ResultSet rs = null;

sql = "select * from guestlab";

stmt = conn.createStatement();

rs = stmt.executeQuery(sql);

if(rs.next()) {
	do{
		idx.add(rs.getString("idx"));
		ename.add(rs.getString("ename"));
		phone.add(rs.getString("phone"));
		gender.add(rs.getString("gender"));
		addr.add(rs.getString("addr"));
	}
	while(rs.next());
}

for(int i = 0; i < idx.size(); i++){
	


%>



	<div>
		<table width=500px border=1px>
			<tr>
				<td>사번</td>
				<td><%= idx.get(i) %></td>
			</tr>
			<tr>
				<td> 이름  </td>
				<td><%= ename.get(i) %></td>
			</tr>
			<tr>
				<td>폰번호  </td>
				<td><%= phone.get(i) %></td>
			</tr>
			<tr>
				<td>성별 </td>
				<td><%= gender.get(i) %></td>
			</tr>
			<tr>
				<td>주소  </td>
				<td><%= addr.get(i) %></td>
			</tr>
		</table>
	</div>

<%
}

%>

<div>
	<a href="guestlab_write.html"><img src="images/write.gif" width=100px></a>
</div>

</body>
</html>