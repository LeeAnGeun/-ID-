<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
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
String pwd = request.getParameter("pwd");

MemberDao dao = MemberDao.getInstance();

MemberDto dto = new MemberDto(id, pwd, null, null, 0);

boolean d = dao.checkmember(dto);
//boolean d = dao.checkmember(id, pwd);

if( d == true){
	// session에 로그인 정보 저장
	session.setAttribute("login", dto);
//	session.setMaxInactiveInterval(30 * 60 * 60); // session 시간제한
%>
	<script type="text/javascript">
	alert("로그인에 성공하셨습니다");
	location.href = "bbslist.jsp";
	</script>
<%
}else{
%>
	<script type="text/javascript">
	alert("로그인에 실패하셨습니다. id와 pw를 다시 확인해주세요.");
	location.href = "login.jsp";
	</script>
<%	
}
%>

</body>
</html>