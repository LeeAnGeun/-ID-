<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
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
request.setCharacterEncoding("utf-8");
String ser = request.getParameter("search");
String text = request.getParameter("searchbbs");

System.out.println(ser + text);

BbsDao dao = BbsDao.getInstance();

List<BbsDto> list= new ArrayList<BbsDto>();

list = dao.searchBbs(ser, text);
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

<h4>검색결과입니다</h4>

<form action="searchbbs.jsp">
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
		<td colspan="3">검색 결과의 글이 없습니다</td>
	</tr>
	<%	
}else{ // 저장된 게시물이 있을 경우
	for(int i=0; i<list.size(); i++){
		BbsDto bbs = list.get(i);
		if(bbs.getDel()==0){
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
}
%>
</table>
<br><br>
<a href="bbswrite.jsp">글쓰기</a>
<br><br>
<select name="search">
	<option>검색</option>
	<option value="id">작성자</option>
	<option value="title">제목</option>
	<option value="content">내용</option>
</select>
<input type="text" name="searchbbs">
<input type="submit" value="검색"></button>
</div>
</form>

</body>
</html>