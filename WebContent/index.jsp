<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
  Boolean init = (Boolean)application.getAttribute("tableInit");
System.out.println("init : " + init);
  if(init==null){
	  Connection conn=null;
	  Statement st=null;
	  //jdbc드라이브 로드
	  Class.forName("com.mysql.jdbc.Driver");
	  //데이터베이스 연결
	  conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb","root","multi2018");
	  st=conn.createStatement();
	  //quary작업
	  String sql= null;
	  //테이블 생성 시작
	  try{
		  sql="create table 20162422_board(id int primary key, name varchar(10) not null, password varchar(10),email	varchar(50),subject	varchar(50) not null, content text not null, inputdate varchar(20) not null, masterid	int default 0,  replynum	int default 0,  step int default 0)";
		  st.executeUpdate(sql); //sql처리
	  }catch(SQLException e){
		  
	  }
	  try{
		  sql="create table 20162422_item( orderid int not null, mynum int not null, prodid int not null, pname varchar(40) , quantity int default 0, price int default 0)";
		  st.executeUpdate(sql); //sql처리
	  }catch(SQLException e){
		  
	  }
	  try{ 
		  sql="create table 20162422_member(user_id varchar(20) not null primary key, passwd varchar(10) not null, passwd_ch varchar(10) not null, user_name char(8) not null, email char(40) not null ,  addr varchar(40) not null, phone varchar(15) not null, is_admin char(5) null)";
	  	  st.executeUpdate(sql); //sql처리
	  }catch(SQLException e){
		  
	  }
	  try{
		  sql="create table 20162422_product(id int primary key, category varchar(10) not null, wname varchar(20) not null, pname varchar(20) not null, price int not null, downprice int default 0, inputdate varchar(50), stock int default 0,  description text, small varchar(20),large varchar(20) null)";
		  st.executeUpdate(sql); //sql처리
	  }catch(SQLException e){
		  
	  }
	  try{
		  sql="create table 20162422_saleorder(id int primary key,name varchar(20) not null, orderdate varchar(20) not null, addr varchar(50) not null, phone varchar(20) not null, pay varchar(10) not null, cardno varchar(20) not null, prodcount int default 0, total int default 0)";
		  st.executeUpdate(sql); //sql처리
	  }catch(SQLException e){
		  
	  }
	  try{
		  sql="create table 20162422_tms(id int primary key,member_id varchar(20) not null, so_id int not null,confirm_deposit int default 0, status_shipping int default 0, shipping_date varchar(20), delivery_date varchar(20))";
		  //                배송 관리 테이블(배송 아이디, 유저아이디(상품주문한), 상품주문 아이디, 입금확인(0:미확인, 1:확인), 배송상태(0:상품준비중,1:배송중,2:배송완료), 배송일자, 완료일자);
		  st.executeUpdate(sql); //sql처리
	  }catch(SQLException e){
		  
	  }
	  //테이블 생성 완료
	  
	  //기초 데이터 입력 시작
	  try{
		  sql="insert into 20162422_member (user_id , passwd,passwd_ch, user_name, email, addr, phone, is_admin) values ('admin', '1234','1234','관리자', ' ',' ',' ', 'Y')";
		  st.executeUpdate(sql); //sql처리
	  }catch(SQLException e){
		  
	  }
	  //기초 데이터 입력 완료  
	  conn.close();//Connection 객체해제
	  st.close();//Statement 해제
	  application.setAttribute("tableInit",true);
  }
  
%>
<!DOCTYPE html>
<html lang="ko" >
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="css/wheel.css">
    <link rel="stylesheet" href="css/wheel.css">
    <link href="css/shop.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="js/jquery.bxslider.min.js"></script>
    <script src="js/index.js"></script>
    <script src="js/shop.js"></script>
</head>
<body >
       <div class="slideshow">
        <img src="img/item/macaroon_entire.JPG" width="1500">
        <img src="img/item/ttongcaroon_entire.JPG" width="1500">
        <img src="img/item/daku_entire.JPG" width="1500">
    </div>
    <header>
        <div id="menu">
            <a href="shop_list.jsp" id="shop">SHOP</a>
            <a href="#" id="notice">NOTICE</a>
            <a href="freeboard_list.jsp" id="qna">Q&amp;A</a>
        </div>
<%
	String user_id = null;
	String is_admin = null;
	
	if (session.getAttribute("is_admin") != null){
		is_admin = (String) session.getAttribute("is_admin");
	}

	if (session.getAttribute("user_id") != null){
		user_id = (String) session.getAttribute("user_id");
	}
%>
<%
	if(user_id == null) {
%>
       <div id="logo"><a href="index.jsp"><img src="img/main_logo.png"></a></div>
        <div id="login_cart">
            <a href="agree.jsp" id="join">JOIN</a>
            <a href="loginform.jsp" id="login">LOG-IN</a>
            <a href="#" id="cart">CART</a>
        </div>
<%
	} else if (user_id.equals("admin")) {
%>
	   <div id="logo"><a href="index.jsp"><img src="img/main_logo.png"></a></div>
        <div id="login_cart">
            <a href="logout.jsp">LOG-OUT</a>
            <a href="adminpage.jsp">ADMINPAGE</a>
        </div>
 <%
	} else {
 %>
  <div id="logo"><a href="index.jsp"><img src="img/main_logo.png"></a></div>
        <div id="login_cart">
            <a href="logout.jsp">LOG-OUT</a>
            <a href="mypage.jsp">MYPAGE</a>
        </div>
        <%
	}
        %>
    </header>
   
    
   
</body>
</html>