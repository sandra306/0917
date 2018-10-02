<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	String user_id = (String)session.getAttribute("user_id");
	
	
	if(user_id !=null){
		session.invalidate();
		out.println("<script>alert('로그아웃 되었습니다. 이용해주셔서 감사합니다.');location.href='index.jsp'; </script>");
	} else {
		out.println("<script>alert('계정이 등록 되었습니다');</script>");

	}
	
	out.flush();

%>

</body>
</html>