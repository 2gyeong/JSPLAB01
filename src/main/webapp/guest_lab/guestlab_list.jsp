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
<link href="freeboard.css" rel="stylesheet" type="text/css">
<SCRIPT language="javascript">
 function check(){
  with(document.msgsearch){
   if(sval.value.length == 0){
    alert("검색어를 입력해 주세요!!");
    sval.focus();
    return false;
   }	
   document.msgsearch.submit();
  }
 }
 function rimgchg(p1,p2) {
  if (p2==1) 
   document.images[p1].src= "image/open.gif";
  else
   document.images[p1].src= "image/arrow.gif";
  }

 function imgchg(p1,p2) {
  if (p2==1) 
   document.images[p1].src= "image/open.gif";
  else
   document.images[p1].src= "image/close.gif";
 }
</SCRIPT>
</head>
<body>

<CENTER>
 <TABLE border=0 width=600 cellpadding=4 cellspacing=0>
  <tr align="center"> 
   <td colspan="5" height="1" bgcolor="#1F4F8F"></td>
  </tr>
  <tr align="center" bgcolor="#87E8FF"> 
   <td width="42" bgcolor="#DFEDFF"><font size="2">번호</font></td>
   <td width="340" bgcolor="#DFEDFF"><font size="2">이메일</font></td>
   <td width="84" bgcolor="#DFEDFF"><font size="2">전화번호</font></td>
   <td width="78" bgcolor="#DFEDFF"><font size="2">성별</font></td>
   <td width="100" bgcolor="#DFEDFF"><font size="2">주소</font></td>
  </tr>
  <tr align="center"> 
   <td colspan="5" bgcolor="#1F4F8F" height="1"></td>
  </tr>
  
  <%
  
  Vector idx = new Vector();
  Vector ename = new Vector();
  Vector phone = new Vector();
  Vector gender = new Vector();
  Vector addr = new Vector();
  

  int where = 1;
  

  int totalgroup = 0;
  int maxpages = 5;
  int startpage = 1;
  int endpage = startpage + maxpages -1;
  int wheregroup = 1;
  

  if(request.getParameter("go") != null){
	  where = Integer.parseInt(request.getParameter("go"));
	  wheregroup = (where -1) / maxpages +1;
	  startpage = (wheregroup -1) * maxpages +1;
	  endpage = startpage + maxpages -1;
  
  
  }else if (request.getParameter("gogroup") != null){
	  wheregroup = Integer.parseInt(request.getParameter("gogroup"));
	  startpage = (wheregroup -1) * maxpages +1;
	  where = startpage;
	  endpage = startpage + maxpages -1;
  }
  

  int nextgroup = wheregroup +1;
  int priorgroup = wheregroup -1;
  
  int startrow = 0;
  int endrow = 0;
  int maxrow = 5;
  int totalrows = 0;
  int totalpages = 0;
  

  int id = 0;
  String em = null;
  

	  String sql = null;
	  Statement stmt = null;
	  ResultSet rs = null;
	  

   sql = "select * from guestlab order by idx desc";
	  
	  stmt = conn.createStatement();
	  rs = stmt.executeQuery(sql);
	  

   if (!(rs.next())){
	   out.println("게시판에 올라온 글이 없습니다.");
   }else {
	   do{
		   idx.addElement(rs.getString("idx"));
		   ename.addElement(rs.getString("ename"));
		   phone.addElement(rs.getString("phone"));
		   gender.addElement(rs.getString("gender"));
		   addr.addElement(rs.getString("addr"));
	   }while(rs.next());
   }
   totalrows = ename.size();
   totalpages = (totalrows -1)/maxrow +1;
   startrow = (where -1) * maxrow;
   endrow = startrow + maxrow -1;
   

   totalgroup = (totalpages -1)/ maxpages +1;
   

   if(endrow >= totalrows) {
	   endrow = totalrows -1;
   }if(endpage > totalpages) {
	   endpage = totalpages;
   }
 
  for(int j = startrow ; j <= endrow ; j++){

  %>

  <tr>

 		<td> <%= idx.elementAt(j) %></td>
 	
 		<td><a href="guestlab_read.jsp?id=<%= idx.elementAt(j) %>&page=<%= where %>"><%= ename.elementAt(j) %></a></td>
 		<td><%= phone.elementAt(j) %></td>
 		<td><%= gender.elementAt(j) %></td>
 		<td><%= addr.elementAt(j) %></td>
 	</tr>
 	
 	<%
 	 }
 	
 	%>
 	
 	 </TABLE>

 	 <!-- 페이징  -->
 	 <%
 	 //13 처음, 이전
 	 if(wheregroup > 1){
 		 out.println("[<a href=guestlab_list.jsp?gogroup=1>처음</a>]");
 		 out.println("[<a href=guestlab_list.jsp?gogroup=" + priorgroup + ">이전</a>]");
 	 }else{
 		out.println("[처음]");
 		out.println("[이전]");
 	 }
 	 
 	 //페이징 갯수
 	 if(ename.size() != 0) {
 		 for(int jj = startpage; jj<= endpage; jj++){
 			 if(jj == where){
 				 out.println("["+jj+"]");
 			 }else {
 				 out.println("[<a href=guestlab_list.jsp?go="+jj+">"+jj+"</a>]");
 			 }
 		 }
 	 }
 	 
 	 //다음,끝
 	 if(wheregroup < totalgroup){
 		out.println("[<a href=guestlab_list.jsp?gogroup=" + nextgroup + ">다음</a>]");
 		out.println("[<a href=guestlab_list.jsp?gogroup=" + totalgroup + ">끝</a>]");
 	 }else {
 		out.println("[다음]");
 		out.println("[끝]");
 	 }
 	 
 	 out.println("전체글 수 : " + totalrows);
 	 
 	 %>
 	 
 	 <FORM method="post" name="msgsearch" action="freeboard_search.jsp">
<TABLE border=0 width=600 cellpadding=0 cellspacing=0>
 <TR>
  <TD align=right width="241"> 
   <SELECT name=stype >
    <OPTION value=1 >이름 </OPTION>
    <OPTION value=2 >제목 </OPTION>
    <OPTION value=3 >내용 </OPTION>
    <OPTION value=4 >이름+제목 </OPTION>
    <OPTION value=5 >이름+내용 </OPTION>
    <OPTION value=6 >제목+내용 </OPTION>
    <OPTION value=7 >이름+제목+내용 </OPTION>
   </SELECT>
   
  </TD>
  <TD width="127" align="center">
   <INPUT type=text size="17" name="sval" >
  </TD>
  <TD width="115">&nbsp;<a href="#" onClick="check();"><img src="./image/serach.gif" border="0" align='absmiddle'></A></TD>
  <TD align=right valign=bottom width="117"><A href="guestlab_write.jsp"><img src="./image/write.gif" border="0"></A></TD>
 </TR>
</TABLE>
</FORM>
 	 	</center> 

</body>
</html>