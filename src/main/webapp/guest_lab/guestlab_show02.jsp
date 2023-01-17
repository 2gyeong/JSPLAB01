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
show02
<%

Vector idx = new Vector();
Vector ename = new Vector();
Vector phone = new Vector();
Vector gender = new Vector();
Vector addr = new Vector();

String sql = null;
Statement stmt = null;
ResultSet rs = null;

sql = "select * from guestlab";

stmt = conn.createStatement();

rs = stmt.executeQuery(sql);

if(rs.next()) {
	do{
		idx.addElement(rs.getString("idx"));
		ename.addElement(rs.getString("ename"));
		phone.addElement(rs.getString("phone"));
		gender.addElement(rs.getString("gender"));
		addr.addElement(rs.getString("addr"));
	}
	while(rs.next());
}

for(int i = 0; i < idx.size(); i++){
	


%>

	<div>
		<table width=500px border=1px>
			<tr>
				<td>사번</td>
				<td><%= idx.elementAt(i) %></td>
			</tr>
			<tr>
				<td> 이름  </td>
				<td><%= ename.elementAt(i) %></td>
			</tr>
			<tr>
				<td>폰번호  </td>
				<td><%= phone.elementAt(i) %></td>
			</tr>
			<tr>
				<td>성별 </td>
				<td><%= gender.elementAt(i) %></td>
			</tr>
			<tr>
				<td>주소  </td>
				<td><%= addr.elementAt(i) %></td>
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