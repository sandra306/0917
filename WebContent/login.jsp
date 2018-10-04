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
    
    String user_id = request.getParameter("user_id");
    String passwd = request.getParameter("passwd"); 
    //String name = (String)session.getAttribute("name");
    Connection con = null;
    try {
     	Class.forName("com.mysql.jdbc.Driver");       
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "multi2018");

        String query = "select * from 20162422_member where user_id = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, user_id);
        ResultSet result = pstmt.executeQuery();
        
        if(result.next()) {
            if(result.getString("passwd").equals(passwd)) {
                session.setMaxInactiveInterval(-1);
                session.setAttribute("user_id", result.getString("user_id"));
                session.setAttribute("passwd", result.getString("passwd"));
                session.setAttribute("user_name", result.getString("user_name"));
                session.setAttribute("email", result.getString("email"));
                session.setAttribute("addr", result.getString("addr"));
                session.setAttribute("phone", result.getString("phone"));
                session.setAttribute("is_admin", result.getString("is_admin"));
                response.sendRedirect("index.jsp");
            }
            else {
            	out.println("<script>alert('아이디나 비밀번호가 틀렸습니다.'); location.href='loginform.jsp';</script>");
            }           
        }
        pstmt.close();
    }
    catch(SQLException e) {
    	System.out.println(e);
    }
    catch(ClassNotFoundException e) {
    	System.out.println(e);
    }
    finally {
        try {
            con.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }
    
%>
</body>
</html>