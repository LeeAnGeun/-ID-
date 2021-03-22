<%@page import="calendar.CalendarDto"%>
<%@page import="java.util.List"%>
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
String syear = request.getParameter("year");
String smonth = request.getParameter("month");
String sday = request.getParameter("day");

System.out.println(syear + " " + smonth + " " + sday);

String rdate = syear + UtilEx.two(smonth) + UtilEx.two(sday);

CalendarDao dao = CalendarDao.getInstance();
List<CalendarDto> list = dao.getChoiceCal(rdate);

int year = Integer.parseInt(syear);
int month = Integer.parseInt(smonth);

System.out.println(list);
%>

<div align="center">
<table border="1">
	
	<col width="100"><col width="500">
	<tr>
		<th>번호</th><th>제목</th>
	</tr>
	<%
	for(int i=0; i<list.size(); i++){
		CalendarDto dto = list.get(i);
		%>
		<tr>
			<td><%=i+1 %></td><td><a href="caldetail.jsp?seq=<%=dto.getSeq() %>"> <%=dto.getTitle() %> </a></td>
		</tr>
		<%
	}
	%>
	
</table>
</div>
</body>
</html>