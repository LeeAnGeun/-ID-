<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.BbsDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Object ologin = session.getAttribute("login");
MemberDto mem = null;

if(ologin == null){ // 로그인 세션이 없을경우 
	%>
	<script>
	alert('로그인을 해 주십시오');
	location.href = "login.jsp"; // 다시 login창으로 돌아간다.
	</script>	
	<%
}

mem = (MemberDto)ologin;
%>

<%!
// 댓글의 depth와 image를 추가하는 함수
// depth = 1	' '->
// depth = 2	'  ' ->
public String arrow(int depth){
	String rs = "<img src='./image/arrow.png' width='20px' height='30px'/>";
	String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;"; // 여백
	
	String ts = "";
	for(int i = 0; i < depth; i++){
		ts += nbsp;
	}
	
	return depth==0 ? "":ts + rs;
}
%>

<%
// dao로 부터 list를 불러온다
BbsDao dao = BbsDao.getInstance();

List<BbsDto> list = dao.getBbsList();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bbslist(Bulletin Board System) = 전자 게시판</title>
</head>
<body>
<h4 align="right" style="background-color: #f0f0f0">환영합니다. <%=mem.getId() %>님</h4>

<h1>게시판</h1>

<div align="center">

<table border="1">
<col width="70"><col width="600"><col width="150">
<tr>
	<th>번호</th><th>제목</th><th>작성자</th>
</tr>
<%
if(list == null || list.size() == 0){ // 저장된 게시물으 없을 경우
	%>
	<tr>
		<td colspan="3">작성된 글이 없습니다</td>
	</tr>
	<%	
}else{ // 저장된 게시물이 있을 경우
	for(int i=0; i<list.size(); i++){
		BbsDto bbs = list.get(i);
		%>
		<tr>
			<th><%=i + 1 %></th>
			<td>
				<%=arrow(bbs.getDepth()) %> <!-- 여백 + 이미지 -->
				<a href="bbsdetail.jsp?seq=<%=bbs.getSeq() %>">
					<%=bbs.getTitle() %>
				</a>
			</td>
			<td><%=bbs.getId() %></td>
		</tr>
		<%
	}
}
%>
</table>

<br><br>
<a href="bbswrite.jsp">글쓰기</a>
</div>

</body>
</html>

















