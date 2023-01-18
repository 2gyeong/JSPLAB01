<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ page import="java.sql.*,java.util.*, java.text.*" %> 

<!-- DB연결 설정 -->
<%@ include file = "conn_oracle.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.menu {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	text-align: center;
	font-weight : bold;
	color : white;
	background-color : black;
	}
	
	td{
	padding: 5px 0 5px 0;
	text-align:center;}
	
</style>	
</head>
<body>
	
	<table style="border-collapse:collapse;">
		<td class = "menu" width = "50">번호</td>
		<td class = "menu" width = "100">이름</td>
		<td class = "menu" width = "200">핸드폰</td>
		<td class = "menu" width = "50">성별</td>
		<td class = "menu" width = "300">주소</td>
	</tr>
	
	<%
		String sql = null;
		//Statement stmt = null;
		PreparedStatement pstmt = null; //변수를 ?로 처리
		ResultSet rs = null;
		
		//getParameter는 모두 String타입이므로 int타입으로 받기 위해서 정의가 필요
		int idx = Integer.parseInt(request.getParameter("idx"));
	 
		//PreparedStatement 객체 사용
		//변수에 들어가는 값을 ? 로 처리, 
		//매번 컴파일 하지 않고 한번만 컴파일 처리하기때문에 Statement보다 속도가 빠르다
		sql = "select * from guestlab where idx = ?";
		pstmt = conn.prepareStatement(sql); //pstmt 객체 생성시 sql문 삽입
		pstmt.setInt(1, idx); //첫번째 물음표에 변수값 할당
		rs = pstmt.executeQuery();
		
		
		if(!(rs.next())){
			out.println("정보가 존재하지 않습니다.");
		}else {
	
	%>
	
	<tr>
		<td><%=rs.getString("idx")%></td>
		<td><%=rs.getString("ename")%></td>
		<td><%=rs.getString("phone")%></td>
		<td><%=rs.getString("gender")%></td>
		<td><%=rs.getString("addr")%></td>
	</tr>
	
	<% }//end of else %>
	
	<tr>
	<td colspan='5'>
		<a href ="guestlab_upd.jsp?idx=<%=idx%>&page=1"><button>수정</button></a>
		<a href ="guestlab_del.jsp?idx=<%=idx%>&page=1"><button>삭제</button></a>
	</td>
	</tr>
	</table>
	

</body>
</html>

