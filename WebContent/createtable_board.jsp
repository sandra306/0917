<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
  sql="create table 20162422_board(id int primary key, name varchar(10) not null, password varchar(10),email	varchar(50),subject	varchar(50) not null, content text not null, inputdate varchar(20) not null, masterid	int default 0,  replynum	int default 0,  step int default 0)";
  st.executeUpdate(sql); //sql처리
  
  conn.close();//Connection 객체해제
  st.close();//Statement 해제
  
  out.println("board 테이블이 생성되었습니다.");
%>

</body>
</html>