<%@page import="dto.PdsDto"%>
<%@page import="dao.PdsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int seq = Integer.parseInt( request.getParameter("seq"));	
	
	PdsDao dao = PdsDao.getInstance();
	dao.readcount(seq);
	PdsDto dto = dao.getPds(seq);
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>

<div align="center">
<form action="" id="frm">
<table border="1">
<col width="100"><col width="500">
<tr>
	<th>작성자</th>
	<td><%=dto.getId() %></td>
</tr>
<tr>
	<th>제목</th>
	<td><%=dto.getTitle() %></td>
</tr>
<tr>
	<th>조회수</th>
	<td><%=dto.getReadcount() %></td>
</tr>
<tr>
	<th>다운로드수</th>
	<td><%=dto.getDowncount() %></td>
</tr>
<tr>
	<th>파일명</th>
	<td><%=dto.getOrginalFileName() %></td>
</tr>
<tr>
	<th>다운로드</th>
	<td><input type="button" name="btndown" value="파일"
				onclick="location.href='filedown?filename=<%=dto.getFilename() %>&originalfilename=<%=dto.getOrginalFileName() %>&seq=<%=dto.getSeq() %>'">
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="20" cols="50" name="content"><%=dto.getContent() %></textarea>
	</td>
</tr>
</table>
<br>
	<input type="button" id="update" value="수정">
	<input type="button" id="remove" value="삭제">
	<input type="button" id="pdslist" value="자료실">
</form>
</div>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#update").click(function() {
		location.href = "updatePds.jsp?seq=<%=seq %>"
	});
	$("#remove").click(function() {
		location.href = "removePds.jsp?seq=<%=seq %>"	
	});
	$("#pdslist").click(function() {
		location.href = "pdslist.jsp"
	});
});
</script>
</body>
</html>













