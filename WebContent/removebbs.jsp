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
int seq = Integer.parseInt(request.getParameter("sql"));
System.out.println(seq);

BbsDao dao = BbsDao.getInstance();
boolean isS = dao.removeBbs(seq);

if(isS){
%>
	<script type="text/javascript">
	alert("게시물을 삭제하였습니다.");
	location.href = 'bbslist.jsp';
	</script>
<%
}else{
%>
	<script type="text/javascript">
	alert("게시물 삭제에 실패하였습니다");
	location.href = 'bbslist.jsp';
	</script>
<%
}
%>
</body>
</html>