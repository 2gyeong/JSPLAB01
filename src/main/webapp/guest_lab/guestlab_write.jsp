<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<script>
	function check(){
		with(document.filegbwrite){
			if(ename.value.length == 0){
				alert("이메일을 입력해 주세요");
				ename.focus();
				return false;
			}
			if(phone.value.length == 0){
				alert("전화번호를 입력해 주세요");
				phone.focus();
				return false;
			}
			if(gender.value.length == 0){
				alert("성별을 입력해 주세요");
				gender.focus();
				return false;
			}
			if(addr.value.length == 0){
				alert("주소를 입력해 주세요");
				addr.focus();
				return false;
			}
			document.filegbwrite.submit();
		}
	}
</script>
</head>
<body>
<form name = "filegbwrite" method = "post" action="guestlab_save.jsp">
	<div>
		<table width="600px cellspacing="0" cellpadding="2">
			<tr><td colspan = "2" bgcolor="#1F4F8F" height = "1"></td></tr>
			<tr><td font-size="13px">신규 회원정보</td></tr>
			<tr><td>이메일 : </td>
				<td> <input type = "text" name = "ename" class="input_style1"></td>
			</tr>
			<tr>
			<tr><td>전화번호 : </td>
			<td> <input type = "text" name = "phone" class="input_style1"></td>
			</tr>
			<tr>
			<tr><td>성별 : </td>
			<td> <input type = "text" name = "gender" class="input_style1"></td>
			</tr>
			<tr><td>주소 : </td>
			<td> <input type = "text" name = "addr" class="input_style1"></td>
			</tr>
			<tr>
				<td colspan = "2" height="50px">&nbsp; </td>	<!-- 공백 -->
			</tr>
			<tr><td colspan="2" > <!-- 취소 / 확인 / 글쓰기 이미지를 처리 -->
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
				 <tr>                     
         <td width="28%">&nbsp;</td>               
         <td width="51%">&nbsp;</td>                
         <td width="12%"><a href="#" onClick="history.go(-1)"><img src="image/cancle.gif" width="46" height="20" border="0"></td>
         <td width="9%"><a href="#" onClick="check();"><img src="image/ok.gif" width="46" height="20" border="0"></a></td>
        </tr>
				</table>
			</td>
			</tr>
		</table>
	
	</div>
	</from>


</body>
</html>