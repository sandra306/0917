<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  Connection conn=null;
  Statement st=null;
  //jdbc드라이브 로드
  Class.forName("com.mysql.jdbc.Driver");
  //데이터베이스 연결
  conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb","root","multi2018");
  st=conn.createStatement();
  //quary작업
  String sql= null;
  sql="insert into 20162422_member (user_id , passwd,passwd_ch, user_name, email, addr, phone, is_admin) values ('admin', '1234','1234','관리자', ' ',' ',' ', 'Y')";
  st.executeUpdate(sql); //sql처리
  
  conn.close();//Connection 객체해제
  st.close();//Statement 해제
  
  out.println("member 테이블이 업데이트 되었습니다.");
%>
</body>
</html>