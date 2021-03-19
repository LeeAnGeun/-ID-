<%@page import="calendar.CalendarDto"%>
<%@page import="java.util.List"%>
<%@page import="calendar.CalendarDao"%>
<%@page import="util.UtilEx"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4 align="right" style="background-color: #f0f0f0">환영합니다. <%=mem.getId() %>님</h4>

<h2>일정관리</h2>
<%
//	Calendar 클래스를 가져오는 두가지 방법
	Calendar cal = Calendar.getInstance();
//	Calendar cal = new GregorianCalendar();
	
	cal.set(Calendar.DATE, 1);	// 오늘 날짜를 -> 1일로 초기화해주는 설정
	
	String syear = request.getParameter("year"); // 다시 들어오는 값이 있는 경우
	String smonth = request.getParameter("month"); // 다시 들어오는 값이 있는 경우
	
	int year = cal.get(Calendar.YEAR);
	if(UtilEx.nvl(syear) == false){ // parameter가 넘어와서 syear가 값이 있을 경우
		year = Integer.parseInt(syear);
	}
	
	int month = cal.get(Calendar.MONTH) + 1;
	if(UtilEx.nvl(smonth) == false){
		month = Integer.parseInt(smonth);
	}
	
	if(month < 1){
		month = 12;
		year--;
	}else if(month > 12){
		month = 1;
		year++;
	}
	
	cal.set(year, month-1, 1); // 연 월 일 세팅 완료
	
	// 요일
	int datOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	
	// image 설정
	// <<  	year--
	String pp = String.format("<a href='%s?year=%d&month=%d'><img src='image/left.gif'></a>", "calendarlist.jsp", year-1, month);
	
	// <	month--
	String p = String.format("<a href='%s?year=%d&month=%d'><img src='image/prec.gif'></a>", "calendarlist.jsp", year, month-1);
	
	// >	month++
	String n = String.format("<a href='%s?year=%d&month=%d'><img src='image/next.gif'></a>", "calendarlist.jsp", year, month+1);
	
	// >>	year++
	String nn = String.format("<a href='%s?year=%d&month=%d'><img src='image/last.gif'></a>", "calendarlist.jsp", year+1, month);
	
	CalendarDao dao = CalendarDao.getInstance();
	List<CalendarDto> list = dao.getCalendalList(mem.getId(), year + UtilEx.two(month + ""));
%>

<div align="center">

<table border="1">
<col width="100"><col width="100"><col width="100"><col width="100">
<col width="100"><col width="100"><col width="100">

<tr height="100">
	<td colspan="7" align="center" style="padding-top: 20px">
		<%=pp %>&nbsp;&nbsp;<%=p %>&nbsp;&nbsp;
		
		<font color="black" style="font-size: 50px"> 
			<%=String.format("%d년&nbsp;&nbsp;%d월", year, month) %>
		</font>
		
		<%=n %>&nbsp;&nbsp;<%=nn %>
	</td>
</tr>

<tr height="50">
	<th align="center">일</th>
	<th align="center">월</th>
	<th align="center">화</th>
	<th align="center">수</th>
	<th align="center">목</th>
	<th align="center">금</th>
	<th align="center">토</th>
</tr> 

<tr height="100" align="left" valign="top">
<%
// 위쪽 빈칸
for(int i=1; i < datOfWeek; i++){
	%>
	<td style="background-color: #cecece">&nbsp;</td>
	<%
}
// 날짜
int lastday = cal.getActualMaximum(Calendar.DAY_OF_MONTH); // 마지막 날짜
for(int i=1; i<=lastday; i++){
	%>
	<td>
		<%=UtilEx.calllist(year, month, i) %>&nbsp;&nbsp;<%=UtilEx.showPen(year, month, i) %>
		<%=UtilEx.makeTable(year, month, i, list) %>
	</td>
	<%
	if( (i + datOfWeek-1) % 7 == 0 && i != lastday){ // 줄을 바꿔주기 위해 테이블을 새로 생성 && i가 마지막 날짜일때는 개행을 하면 안된다.
		%>
		</tr><tr height="100" align="left" valign="top"> 
		<%
	}
}
%>

<%-- 밑의 빈칸 --%>

<%
cal.set(Calendar.DATE, lastday); // 그 달의 마지막 날짜로 세팅
int weekday = cal.get(Calendar.DAY_OF_WEEK);
for(int i=0; i< 7 - weekday; i++){
	%>
		<td style="background-color: #cecece">&nbsp;</td>
	<%
}
%>
</tr>
</table>
</div>

</body>
</html>
























