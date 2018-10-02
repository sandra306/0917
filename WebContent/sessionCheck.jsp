<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %> 
<% request.setCharacterEncoding("utf-8"); %>       
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body>
<%
    String id = (String)session.getAttribute("user_id");
    String pwd = (String)session.getAttribute("passwd");
    
    if(id == null || pwd == null) {
        response.sendRedirect("loginform.jsp");
    }   
%>
</body>
</html>