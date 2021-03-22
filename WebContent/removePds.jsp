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

</body>
</html>