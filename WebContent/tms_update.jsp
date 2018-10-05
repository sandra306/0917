<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String user_id=null;
	if((session.getAttribute("user_id")==null) || (!((String)session.getAttribute("user_id")).equals("admin"))){
		out.println("<script>");
		out.println("lication.href='tms_list.jsp'");
		out.println("</script>");
	}
	String update_id=request.getParameter("id");
	String confirm_deposit=request.getParameter("confirm_deposit");
	String status_shipping=request.getParameter("status_shipping");
	String shipping_date=request.getParameter("shipping_date");
	String delivery_date=request.getParameter("delivery_date");
	Connection conn = null;
	PreparedStatement pstmt =null;
	ResultSet rs = null;
	
	try{
		
		 Class.forName("com.mysql.jdbc.Driver");         
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "multi2018");
	       
		
	
		String sql = "update 20162422_tms set";
		sql += " confirm_deposit=?,";
		sql += " status_shipping=?,";
		sql += " shipping_date=?,";
		sql += " delivery_date=?";
		sql += " where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, confirm_deposit);
		pstmt.setString(2, status_shipping);
		pstmt.setString(3, shipping_date);
		pstmt.setString(4, delivery_date);
		pstmt.setString(5, update_id);
		pstmt.executeUpdate();
		
		out.println("<script>");
		out.println("alert('정상적으로 수정되었습니다.')");
		out.println("location.href='tms_list.jsp'");
		out.println("</script>");
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		pstmt.close();
		conn.close();
	}
%>
</body>
</html>