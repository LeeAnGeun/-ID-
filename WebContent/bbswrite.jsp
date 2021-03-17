<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>

<%
request.setCharacterEncoding("utf-8");
//	String id = request.getParameter("id");
//	MemberDao dao = MemberDao.getInstance();
//	MemberDto dto = new MemberDto();
	MemberDto ologin = (MemberDto)session.getAttribute("login");
%>
<!-- 글을 작성할수 있는 form -->
<form action="bbswriteAf.jsp" id="frm">
<div align="center">
	<table border="1" >
		<col width="100"><col width="300">
		<tr>
			<td>id</td><td><input type="text" name="id" id="_id" value="<%=ologin.getId() %>"></td>
		</tr>
		<tr>
			<td>제목</td><td width="50"><input name="title" type="text" id="_title" size="50"> </td>
		</tr>
		<tr>
			<td>내용</td><td><textarea rows="20" cols="60" name="content" id="_content"></textarea> </td>
		</tr>
	</table>
	<br>
	<button type="button" id="insert">글 추가</button>
</div>
</form>

<!-- bbswriteAf.jsp -->
<script type="text/javascript">
$(document).ready(function() {
	
	$("#insert").click(function() {
		
		$("#frm").submit();
	});
});

</script>

</body>
</html>