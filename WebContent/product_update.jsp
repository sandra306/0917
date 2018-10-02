<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page language="java" import="java.sql.*,java.text.*, java.lang.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<h2>상품 정보 수정</h2>
<hr>
<%
	String pname=request.getParameter("pname");
	String dprice=request.getParameter("dprice");
	String description=request.getParameter("description");
	
	Connection db=null;
	Statement st=null;
	
	String query="update 20162422_product set pname='"+pname+"', dprice='"+dprice+"' where description='"+description+"'";
	try{
		Class.forName("com.mysql.jdbc.Driver");
		db=DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "multi2018");
		st = db.createStatement();
		st.executeUpdate(query);
		
		out.println("<p>");
		out.println("DB의 상품 정보가 수정되었습니다");
		out.println("<p>");
		
		st.close();
		db.close();
	}catch(SQLException e){
		System.out.println("SQL Error : " + e.getMessage());
	}		
%>
<hr><p>
<form action="product_list.jsp">
	<input type="submit" value="메인화면">
</form>
</body>
</html>