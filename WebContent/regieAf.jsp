<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// request.setCharacterEncoding;
%>


<!-- DB에 데이터를 추가 -->
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String email = request.getParameter("email");

System.out.println(id + " " + pwd + " " + name + " " + email);

// out.println(id);

%>

<!-- 다시 로그인 화면으로 이동 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
MemberDao dao = MemberDao.getInstance();


MemberDto dto = new MemberDto(id, pwd, name, email, 0);
boolean isS = dao.addMember(dto);

if(isS){ // 회원가입이 성공했을 경우
%>
	<script type="text/javascript">
	alert("성공적으로 가입되었습니다.");
	location.href = "login.jsp";
	</script>
<%	
}else{ // 회원가입이 실패했을 경우
%>
	<script type="text/javascript">
	alert("다시 기입해 주십시오");
	location.href = "regi.jsp";
	</script>
<%
}
%>


</body>
</html>