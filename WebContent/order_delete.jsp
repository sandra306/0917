<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id=null;
	
	String delete_id=request.getParameter("id");
	Connection conn = null;
	PreparedStatement pstmt =null;
	ResultSet rs = null;
	
	try{
		
		 Class.forName("com.mysql.jdbc.Driver");         
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "multi2018");
	       
		
	
		
		pstmt=conn.prepareStatement("Delete from 20162422_saleorder where id=?");
		pstmt.setString(1, delete_id);
		pstmt.executeUpdate();
		
		out.println("<script>");
		out.println("location.href='order_list.jsp'");
		out.println("</script>");
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</body>
</html>