<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
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
  sql="create table 20162422_saleorder(id int primary key,name varchar(20) not null, orderdate varchar(20) not null, addr varchar(50) not null, phone varchar(20) not null, pay varchar(10) not null, cardno varchar(20) not null, prodcount int default 0, total int default 0)";
  st.executeUpdate(sql); //sql처리
  
  conn.close();//Connection 객체해제
  st.close();//Statement 해제
  
  out.println("saleorder 테이블이 생성되었습니다.");
%>
</body>
</html>