<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %> 
<% request.setCharacterEncoding("utf-8"); %>       
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="detail.css">


<script>
function move(arg) {
    if(arg == 0) {
        document.location = "joinform.jsp";
    }
    else if(arg == 1) {
        document.location = "index.jsp";
    }
}
</script>
</head>
<body>
<table width=100% height=100%>
<tr><td align=center valign=center class=text>
<%
    boolean isInserted = false;
    

    request.setCharacterEncoding("utf-8");
    String user_id = request.getParameter("user_id");
    String user_name = request.getParameter("user_name");
    String passwd = request.getParameter("passwd");
    String passwd_ch = request.getParameter("passwd_ch");
    String email = request.getParameter("email");
    String addr = request.getParameter("addr");
    String phone = request.getParameter("phone");

    
    
    Connection con = null;
    
    try {
        Class.forName("com.mysql.jdbc.Driver");       
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "multi2018");

        String query = " insert into 20162422_member " +
                       " (user_id, user_name, passwd,passwd_ch,email, addr, phone) " +
                       " VALUES " +
                       " (?, ?, ?, ?,?, ?,?)";
                       
        PreparedStatement pstmt = con.prepareStatement(query);
        
        
        pstmt.setString(1, user_id);
        pstmt.setString(2, user_name);
        pstmt.setString(3, passwd);
        pstmt.setString(4, passwd_ch);
        pstmt.setString(5, email);
        pstmt.setString(6, addr);
        pstmt.setString(7, phone);
             
        
        //int result = pstmt.executeUpdate();
        pstmt.executeUpdate();
        session.setAttribute("user_name", user_name);
        pstmt.close();
        isInserted = true;
    }
    catch(SQLException e) {
        isInserted = false;
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
    
    if(isInserted == true) {
%>

out.println("<script>alert('회원 가입을 축하합니다. 로그인 하세요.');location.href='index.jsp'; </script>");

<%
    }
    else {
%>

out.println("<script>alert('회원 가입에 실패했습니다.<br> 다시 가입서를 작성해 주세요.');location.href='joinform.jsp'; </script>");

<%
    }
%>
</td></tr>
</table>
</body>
</html>