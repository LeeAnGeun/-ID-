<%@page import="java.util.Date"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
MemberDto mem = (MemberDto)session.getAttribute("login");

// file명 변경
// String filename = (new Date().getTime()) + ""; // 시간으로 파일네임을 바꿔준다 -> 파일명의 충돌을 방지하기위해.
// System.out.println("filename = " + filename);

// DB에는 mydate.txt의 파일 명과 1616979150728.txt을 둘다 저장을 해야한다.
// mydate.txt -> 1616979150728.txt
// original filename : mydata.txt
// filename : 1616979150728.txt
// 1616979150728.txt -> mydate.txt


%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>자료 올리기</h2>

<div align="center">

<%--
	id		-> String form field data
	title	-> 
	content
	
	file	-> byte
 --%>
 

<form action="pdsupload.jsp" method="post" enctype="multipart/form-data">  <!-- 업로드는 post로 무조건 해야한다 multipart는 String형과 byte형 둘다를 받기 위함, form-data는 form형식에 data를 저장하기 위함 -->
	
<table border="1">
<col width="200"><col width="500">

<tr>
	<th>아이디</th>
	<td>
		<input type="text" name="id" value="<%=mem.getId() %>" readonly="readonly">
	</td>
</tr>

<tr>
	<th>파일 업로드</th>
	<td>
		<input type="file" name="fileload" style="width: 400px">
	</td>
</tr>

<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title">
	</td>
</tr>

<tr>
	<th>내용</th>
	<td>
		<textarea rows="20" cols="50" name="content"></textarea>
	</td>
</tr>

<tr align="center">
	<td colspan="2">
		<input type="submit" value="올리기">
	</td>
</tr>

</table>
</form> 

</div>
</body>
</html>





















