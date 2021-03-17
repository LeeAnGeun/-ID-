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
int sql = Integer.parseInt( request.getParameter("sql") );

String title = request.getParameter("title");
String content = request.getParameter("content");

System.out.println(sql + title + content);

BbsDao dao = BbsDao.getInstance();
boolean isS = dao.updateBbs(sql, title, content);

if(isS){
	%>
	<script type="text/javascript">
	alert("글 수정 성공");
	location.href = "bbslist.jsp";
	</script>	
	<%
}else{	
	%>
	<script type="text/javascript">
	alert("글 수정 실패");
	location.href = "bbslist.jsp";
	</script>
	<%
}

%>

</body>
</html>