<%@page import="calendar.CalendarDto"%>
<%@page import="calendar.CalendarDao"%>
<%@page import="util.UtilEx"%>
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

int seq = Integer.parseInt( request.getParameter("seq"));
String id = request.getParameter("id");
String title = request.getParameter("title");
String content = request.getParameter("content");

String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
String hour = request.getParameter("hour");
String min = request.getParameter("min");

String rdate = year + UtilEx.two(month) + UtilEx.two(day) + UtilEx.two(hour) + UtilEx.two(min);

CalendarDao dao = CalendarDao.getInstance();

boolean isS = dao.updateCalendar(new CalendarDto(seq, id, title, content, rdate, ""));

if(isS){
	%>
	<script type="text/javascript">
	alert("일정을 수정하였습니다.");
	location.href="calendarlist.jsp";
	</script>
	<%
}else{
	%> 
	<script type="text/javascript">
	alert("일정이 수정되지 않았습니다.");
	location.href="caldetail.jsp";
	</script>
	<%
}
%>

</body>
</html>