<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<% request.setCharacterEncoding("utf-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   
    String user_id  = request.getParameter("user_id");
	
    String phone  = request.getParameter("phone"); 
    
    
    Connection con = null;
    try {
         Class.forName("com.mysql.jdbc.Driver");         
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "multi2018");

        String query = "select passwd from 20162422_member where user_id = ? and phone = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, user_id);
        
        pstmt.setString(2, phone);
        ResultSet result = pstmt.executeQuery();
        
        %>
    	<table width=100% height=100% align=center align=middle >
    	<tr>
    	<td align=center>
        <%
        if(result.next()) {
        	String passwd = result.getString("passwd");
        	
        %>
        	회원님의 비밀번호는 <%=passwd %> 입니다.
      	<%
        }  else {
            out.print("입력정보가 틀렸거나 없습니다.."+"<br>");
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
</td>
        	</tr>
<input name=idcheck type="button" onClick="location.href='loginform.jsp'" value="돌아가기" class="login_b">
	</table>
</body>
</html>