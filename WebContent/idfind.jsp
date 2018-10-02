<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %> 
<% request.setCharacterEncoding("utf-8"); %>       
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>

<%
   
    String user_name  = request.getParameter("user_name");
    String phone  = request.getParameter("phone"); 
    //String name = (String)session.getAttribute("name");
    
    Connection con = null;
    try {
         Class.forName("com.mysql.jdbc.Driver");         
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "multi2018");

        String query = "select user_id from 20162422_member where user_name = ? and phone = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, user_name);
        pstmt.setString(2, phone);
        ResultSet result = pstmt.executeQuery();
        
        if(result.next()) {
        	String user_id = result.getString("user_id");
        	
        	%>
        	<table>
        	<tr>
        	<td>
        	회원님의 아이디는 <%=user_id %> 입니다.
        	</td>
        	</tr>
        	
        	</table>
        	<%
        }
        
        else {
            out.print("아이디가 없습니다");
        }           
        pstmt.close();
    }
    catch(SQLException e) {

    }
    catch(ClassNotFoundException e) {

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

<input name=idcheck type="button" onClick="location.href='loginform.jsp'" value="login" class="login_b">

</body>
</html>