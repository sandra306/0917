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
	String delete_id=request.getParameter("id");
	Connection conn = null;
	PreparedStatement pstmt =null;
	ResultSet rs = null;
	
	try{
		
		 Class.forName("com.mysql.jdbc.Driver");         
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "multi2018");
	       
		
	
		
		pstmt=conn.prepareStatement("Delete from 20162422_tms where id=?");
		pstmt.setString(1, delete_id);
		pstmt.executeUpdate();

		out.println("<script>");
		out.println("alert('정상적으로 삭제되었습니다.')");
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