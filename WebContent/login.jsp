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
    boolean isSuccess = false;
    
    String user_id = request.getParameter("user_id");
    String passwd = request.getParameter("passwd"); 
    //String name = (String)session.getAttribute("name");
    
    Connection con = null;
    try {
    	Class.forName("com.mysql.jdbc.Driver");       
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "multi2018");

        String query = "select passwd from 20162422_member where user_id = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, user_id);
        ResultSet result = pstmt.executeQuery();
        
        if(result.next()) {
            if(result.getString(1).equals(passwd)) {
                isSuccess = true;
            }
            else {
                isSuccess = false;
            }           
        }
        pstmt.close();
    }
    catch(SQLException e) {
        isSuccess = false;
    }
    catch(ClassNotFoundException e) {
        isSuccess = false;
    }
    finally {
        try {
            con.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    out.println(isSuccess);
    
    if(isSuccess == true) {
        session.setMaxInactiveInterval(-1);
        session.setAttribute("user_id", user_id);
        session.setAttribute("passwd", passwd); 
        //session.setAttribute("name", name);
        response.sendRedirect("index.jsp");
    }
    else {
        out.println("<script>alert('아이디나 비밀번호가 틀렸습니다.'); location.href='loginform.jsp';</script>");
    }  
%>
</body>
</html>