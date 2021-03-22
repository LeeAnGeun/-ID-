<%@page import="dto.MemberDto"%>
<%@page import="dto.PdsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.PdsDao"%>
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
PdsDao dao = PdsDao.getInstance();
List<PdsDto> list = dao.getPdsList();

MemberDto mem = (MemberDto)session.getAttribute("login");
%>

<h2>자료실</h2>

<div align="center">

<table border="1">
<col width="70"><col width="100"><col width="400"><col width="100">
<col width="80"><col width="120"><col width="120">

<tr>
	<th>번호</th><th>작성자</th><th>제목</th><th>다운로드</th>
	<th>조회수</th><th>다운로드 수</th><th>작성일</th>
</tr>
<%
if(list.size() == 0){
	%>
	<tr>
		<td colspan="7">자료가 없습니다.</td>
	</tr>
	<%
}else{
	for(int i=0; i< list.size(); i++){
		PdsDto pds= list.get(i);
	%>
	<tr align="center">
		<th><%=i+1 %></th>
		<td><%=pds.getId() %></td>
		<td>
			<a href="pdsdetail.jsp?seq=<%=pds.getSeq() %>">
				<%=pds.getTitle() %>
			</a>
		</td>
		<td>
			<input type="button" name="btndown" value="파일"
				onclick="location.href='filedown?filename=<%=pds.getFilename() %>&originalfilename=<%=pds.getOrginalFileName() %>&seq=<%=pds.getSeq() %>'">
		</td>
		<td><%=pds.getReadcount() %></td>
		<td><%=pds.getDowncount() %></td>
		<td><%=pds.getRegdate() %></td>
	</tr>
	<%
	}
}
%>
</table>

<br>

<a href="pdswrite.jsp">자료올리기</a>

</div>

</body>
</html>













