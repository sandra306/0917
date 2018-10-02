<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<!DOCTYPE html>
<html>
<head>

</head>
<body align="center">
<%
  String user_id = (String)session.getAttribute("user_id");
  String passwd = (String)session.getAttribute("passwd");  
  
  Connection con = null;   
  
  try {
       Class.forName("com.mysql.jdbc.Driver");         
       con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "multi2018");
       
       String query = "delete from 20162422_member where user_id = ?";
       PreparedStatement stmt = con.prepareStatement(query);
       stmt.setString(1, user_id);
       stmt.executeUpdate();       
       stmt.close();
       
       session.invalidate();
      }       
  catch(SQLException e) {           
           out.println(e);
           
       }      
       out.println("<script>alert('이용해주셔서 감사합니다.');location.href='index.jsp'; </script>");    
 %>
 <meta http-equiv="refresh" content="1;url=loginform.jsp">      
</body>
</html>
