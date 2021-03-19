<%@page import="calendar.CalendarDao"%>
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
int seq = Integer.parseInt( request.getParameter("seq"));

CalendarDao dao = CalendarDao.getInstance();

boolean isS = dao.deleteCalendar(seq);

if(isS){
%>
	<script type="text/javascript">
	alert("일정을 삭제하였습니다.")
	location.href = "calendarlist.jsp"; 
	</script>
<%
}else{
%>
	<script type="text/javascript">
	alert("일정 삭제를 실패하였습니다.")
	location.href = "calendarlist.jsp";
	</script>
<%
}
%>


</body>
</html>