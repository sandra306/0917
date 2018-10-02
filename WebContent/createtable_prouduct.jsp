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
  sql="create table 20162422_product(id int primary key, category varchar(10) not null, wname varchar(20) not null, pname varchar(20) not null, price int not null, downprice int default 0, inputdate varchar(50), stock int default 0,  description text, small varchar(20),large varchar(20) null)";
  st.executeUpdate(sql); //sql처리
  
  conn.close();//Connection 객체해제
  st.close();//Statement 해제
  
  out.println("product 테이블이 생성되었습니다.");
%>
</body>
</html>