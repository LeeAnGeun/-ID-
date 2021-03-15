<%@page import="dao.MemberDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%-- id 중복확인을 위한 jsp 파일 --%>
<%

String id = request.getParameter("id");
System.out.println("id:" + id );

MemberDao dao = MemberDao.getInstance();
boolean b = dao.getId(id);

if(b == true){ // id있음
	out.println("NO");
}else{ // id없음
	out.println("YES");
}
%>
