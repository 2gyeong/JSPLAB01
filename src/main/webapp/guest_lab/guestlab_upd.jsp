<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %> 
<%@ include file = "conn_oracle.jsp" %>

<%

	String sql = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	String p = request.getParameter("page");
	
	try {
		sql = "select * from guestlab where idx = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		rs = pstmt.executeQuery();
		
		if(!(rs.next())){
			out.println("해당 게시글이 존재하지 않습니다.");
		}else {
			//값이 존재한다면

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function check() {
		with (document.fileglabwrite){
			if(idx.value.length==0){
				alert("회원번호를 입력해 주세요");
				idx.focus();
				return false;
			}
			if(ename.value.length==0){
				alert("이름을 입력해 주세요");
				ename.focus();
				return false;
			}
			if(phone.value.length==0){
				alert("휴대폰 번호를 입력해 주세요");
				phone.focus();
				return false;
			}
			if(gender.value.length==0){
				alert("성별을 입력해 주세요");
				gender.focus();
				return false;
			}
			if(addr.value.length==0){
				alert("주소를 입력해 주세요");
				addr.focus();
				return false;
			}
			document.fileglabwrite.submit();
		}
	}

</script>
</head>
<body>
			<form name = "fileglabwrite" method = "post" action = "guestlab_upddb.jsp"> 
	<div>
		<table width = "600px" cellspacing = "0" cellpadding = "2">
			<tr>
				<td colspan = "2" bgcolor="#1f4f8f" height = "1"></td>
			</tr>	
			<tr>
				<td colspan = "2" bgcolor="#1f4f8f" height = "1"><span id="write" style ="color:white">회원가입</span></td>
			</tr>
			<tr>
				<td> 번호 : </td>
				<td> <input type = "text" name=idx value="<%=rs.getString("idx") %>" class = "input_style1"></td>
			</tr>
			<tr>
				<td> 이름 : </td>
				<td> <input type = "text" name=ename value="<%=rs.getString("ename") %>" class = "input_style1"></td>
			</tr>
			<tr>
				<td> 핸드폰 번호 : </td>
				<td> <input type = "text" name=phone value="<%=rs.getString("phone") %>" class = "input_style1"></td>
			</tr>
			<tr>
				<td> 성별 : </td>
				<td> <input type = "text" name=gender value="<%=rs.getString("gender") %>" class = "input_style1"></td>
			</tr>
			<tr>
				<td> 주소 : </td>
				<td> <input type = "text" name=addr value="<%=rs.getString("addr") %>" class = "input_style1"></td>
			</tr>
			<tr>
				<td colspan='2'>
				<a href = "guestlab_list.jsp?go=<%= request.getParameter("page")%>"><button>완료</button></a>
				</td>
			</tr>
		</table>
		
	</div>
		
	</form>
	
	<% }//end of else
			
			}catch(Exception e){
				out.println("수정을 완료할수 없습니다. 관리자에게 문의하세요");
			}
			
			%>

</body>
</html>