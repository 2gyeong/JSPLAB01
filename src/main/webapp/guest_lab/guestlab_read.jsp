<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%@ include file="conn_oracle.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String sql = null;
Statement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

int id = Integer.parseInt(request.getParameter("id"));


/* sql = "select * from guestlab where idx = " + id;

stmt = conn.createStatement();
rs = stmt.executeQuery(sql); */


sql = "select * from guestlab where idx = ?";
pstmt = conn.prepareStatement(sql);
pstmt.setInt(1, id);
rs = pstmt.executeQuery();

if(rs.next()){
%>

	<table width='600' cellspacing='0' cellpadding='2' align='center'>
			   <tr>
			   <td height='22'>&nbsp;</td></tr>
			   <tr align='center'>
			   <td height='1' bgcolor='#1F4F8F'></td>
			   </tr>
			   <tr align='center' bgcolor='#DFEDFF'>
			   <td class='button' bgcolor='#DFEDFF'> 
			   <div align='left'><font size='4'> 이메일 : <%= rs.getString("ename") %></div> </td>
			   </tr>
			   <tr align='center' bgcolor='#FFFFFF'>
			   <td align='center' bgcolor='#F4F4F4'>
			   <table width='100%' border='0' cellpadding='0' cellspacing='4' height='1'>
			   <tr bgcolor='#F4F4F4'>
			   <td width='13%' height='7'></td>
			   <td width='51%' height='7'>전화번호 : <%= rs.getString("phone") %></td>
			   <td width='25%' height='7'></td>
			   <td width='11%' height='7'></td>
			   </tr>
			   <tr bgcolor='#F4F4F4'>
			   <td width='13%'></td>
			   <td width='51%'> 성별 : <%= rs.getString("gender") %></td>
		
			   <td width='11%'></td>
			   </tr>
			   </table>
			   </td>
			   </tr>
			   <tr align='center'>
			   <td bgcolor='#1F4F8F' height='1'></td>
			   </tr>
			   <tr align='center'>
			   <td style='padding:10 0 0 0'>
			   <div align='left'><br>
			   <font size='3' color='#333333'> <pre> <%= rs.getString("addr") %> </pre>  </div>
			   <br>
			   </td>
			   </tr>
			   <tr align='center'>
			   <td class='button' height='1'></td>
			   </tr>
			   <tr align='center'>
			   <td bgcolor='#1F4F8F' height='1'></td>
			   </tr>
	 </table>
<%
}else {
	out.println("해당 레코드는 존재하지 않는다");
}
%>

   <table width="600" border="0" cellpadding="0" cellspacing="5" >
	<tr> 

		<td align="right" width="450"><A href="guestlab_list.jsp?go=<%= request.getParameter("page") %>"><img src="images/list.jpg" border=0></a></td>
		<td width="70" align="right"><A href="guestlab_write.html?id=<%= request.getParameter("idx") %>&page=<%= request.getParameter("page") %>"> <img src="images/reply.jpg" border=0></A></td>
		<td width="70" align="right"><A href="guestlab_upd.jsp?id=<%= id %>&page=<%= request.getParameter("page") %>"><img src="images/edit.jpg" border=0></A></td>
		<td width="70" align="right"><A href="guestlab_del.jsp?id=<%= id %>&page=<%= request.getParameter("page") %>"><img src="images/del.jpg"  border=0></A></td>
	</tr>
  </table>

</body>
</html>
