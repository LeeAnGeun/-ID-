<%@page import="dto.PdsDto"%>
<%@page import="dao.PdsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int seq = Integer.parseInt( request.getParameter("seq"));	
	String fupload = application.getRealPath("/upload");
	
	PdsDao dao = PdsDao.getInstance();
	PdsDto dto = dao.getPds(seq);
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="pdsupload.jsp" method="post" enctype="multipart/form-data">  <!-- 업로드는 post로 무조건 해야한다 multipart는 String형과 byte형 둘다를 받기 위함, form-data는 form형식에 data를 저장하기 위함 -->
<input type="hidden" name="seq" value="<%=seq %> ">

<div align="center">

<h3>게시물 수정</h3>

<table border="1">
<col width="200"><col width="500">

<tr>
	<th>아이디</th>
	<td>
		<input type="text" name="id" value="<%=dto.getId() %>" readonly="readonly">
	</td>
</tr>

<tr>	
	<th>파일 업로드</th>
	<td>
		<input type="file" name="fileload" style="width: 400px">
	</td>
</tr>

<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" value="<%=dto.getTitle() %>">
	</td>
</tr>

<tr>
	<th>내용</th>
	<td>
		<textarea rows="20" cols="50" name="content"><%=dto.getContent() %></textarea>
	</td>
</tr>

<tr align="center">
	<td colspan="2">
		<input type="submit" value="수정">
	</td>
</tr>

</table>
</form> 

</div>

</body>
</html>