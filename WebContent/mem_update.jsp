<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %> 
<% request.setCharacterEncoding("utf-8"); %>     
<!DOCTYPE html>
<html long="ko">
<head>
</head>
<body>
<%
    String user_id = request.getParameter("user_id");
    String passwd = request.getParameter("passwd"); 
    String passwd_ch = request.getParameter("passwd_ch");
    String user_name = request.getParameter("user_name"); 
    String email = request.getParameter("email");
    String addr = request.getParameter("addr");    
    String phone = request.getParameter("phone");    

    Connection con = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");        
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "multi2018");

        String query = "update 20162422_member set passwd = ?,passwd_ch = ?, user_name = ?, email = ?, addr = ?, phone = ?" +"where user_id= ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, passwd);
        pstmt.setString(2, passwd);
        pstmt.setString(3, user_name);
        pstmt.setString(4, email);
        pstmt.setString(5, addr);
        pstmt.setString(6, phone); 
        pstmt.setString(7, user_id);
        //int result = pstmt.executeUpdate();
        pstmt.executeUpdate();
        out.println("데이터가 갱신되었습니다.");
        pstmt.close();
    }
    catch(SQLException e) {
        e.printStackTrace();
        out.println(e.getMessage());
    }
    catch(ClassNotFoundException e) {
        e.printStackTrace();
        out.println(e.getMessage());
    }
    finally {
        try {
            con.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }    
    response.sendRedirect("mypage.jsp");
%>
</body>
</html>