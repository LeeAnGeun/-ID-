<%@page import="dao.BbsDao"%>
<%@page import="dto.BbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String id = request.getParameter("id");
String title = request.getParameter("title");
String content = request.getParameter("content");

System.out.println(id + " " + title + " " + content);

BbsDto bdto = new BbsDto(id, title, content);

BbsDao dao = BbsDao.getInstance();
boolean b = dao.addBbslist(bdto);

if(b){
	%>
	<script type="text/javascript">
	alert("게시물이 추가되었습니다.");
	location.href = "bbslist.jsp";
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("게시물 추가에 실패하였습니다. 다시 작성해주세요");
	location.href = "bbswrite.jsp";
	</script>
	<%
}
%>


</body>
</html>