<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*,java.util.*" %>   
<%
    boolean isExist = false;
    String user_id = request.getParameter("user_id");

    Connection con = null;
    
    try {
        Class.forName("com.mysql.jdbc.Driver");        
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "multi2018");
        
        String query = "select user_id from 20162422_member where user_id = '" + user_id + "'";
        Statement stmt = con.createStatement();
        
        ResultSet rs = stmt.executeQuery(query);
        
        if(rs.next()) {
            isExist = true;
        }
        else {
            isExist = false;
        }
        
        rs.close();
        stmt.close();
    }
    
    catch(SQLException e) {
    	out.println("SQL Error : " + e.getMessage());
    }
    
    catch(ClassNotFoundException e) {
        out.println(e);
    }
    
    finally {
        try {
            con.close();
        }
        catch(Exception e) {
            out.println(e);
        }
    }
%>
 
<!DOCTYPE html">
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="detail.css">
</head>
<body bgcolor="#ffffff">
<table width="228" border="0" cellspacing="1" cellpadding="3" height="51">
    <tr>
        <td height="25" class="result_Bg" align=center>
            신청 ID : <%= user_id %>
        </td>
    </tr>
    
    <tr>
        <td height="25" class="result_Fg" align=center>
        <%  if(isExist) { %>
        사용할 수 없는 아이디입니다.
        <%  } else { %> 
        사용 가능한 아이디입니다. 
        <%  } %>
        </td>
    </tr>
</table>

<table width="228" border="0" cellspacing="1" cellpadding="3" height="50">
    <tr>
        <td align=center>
            <a href="javascript:window.close()"><input type="button" value="사용하기" ></a>
        </td>
    </tr>
</table>
</body>
</html>