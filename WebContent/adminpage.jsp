<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="css/wheel.css">
    <link rel="stylesheet" href="css/wheel.css">
    <link href="css/adminPage.css" rel="stylesheet" type="text/css">
    <link href="css/footer.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="js/jquery.bxslider.min.js"></script>
    <script src="js/admin.js"></script>
    <script src="js/shop.js"></script>
</head>
<body>
    <header>
      
<%
	
	String user_id  = request.getParameter("user_id"); 
	String is_admin = null;
		
%>
        <div id="menu">
            <a href="shop.jsp" id="shop">SHOP</a>
            <a href="#" id="notice">NOTICE</a>
            <a href="freeboard_list.jsp" id="qna">Q&amp;A</a>
        </div>
<%
	user_id = null;
	if (session.getAttribute("user_id") != null){
		user_id = (String) session.getAttribute("user_id");
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
            <a href="mypage.jsp" id="cart">MYPAGE</a>
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
  <div id="logo"><a href="index.jsp"><img src="#"></a></div>
        <div id="login_cart">
            <a href="logout.jsp">LOG-OUT</a>
            <a href="mypage.jsp">MYPAGE</a>
        </div>
        <%
	}
        %>
    </header>
    <div id="wrap">
        <img src="img/admin.png">
        <div id="admin_page">ADMIN PAGE</div>
        <div class="img">
            <a href="product_list.jsp"><img src="img/admin_item.png"></a>
            <a href="#"><img src="img/admin_express.png"></a>
            <a href="all.jsp"><img src="img/admin_member.png"></a>
            <a href="#"><img src="img/admin_qna.png"></a>
            <a href="#"><img src="img/admin_notice.png"></a>
            <a href="logout.jsp"><img src="img/withdrawal.png"></a>
        </div>
    </div>
    <footer>
    <div id="footer_text">이용약관 &nbsp;&nbsp;&nbsp;개인정보처리방침 &nbsp;&nbsp;&nbsp;사업자정보확인</div>
    <div id="footer_head">
        <a href="#">상호명:SUCRE</a> 
        <a href="#">대표: 이은석,이소민 </a>
        <a href="#">개인정보관리책임자: 이은석,이소민</a>
        <a href="#">Tel: 010-2568-2552,010-5504-7092</a>
        <a href="#">이메일: leedh2552@naver.com</a>
        </div>
    <div id="footer_center">
        <a href="#">주소: 경기도 화성시 봉담읍 삼천병마로 1182 </a>
        <a href="#">사업자 등록번호: 000000000</a>
        <a href="http://naver.com" alt="네이버" target="_blank" title="네이버 바로가기">©NAVER Corp.</a></div>
    <div id="footer_bottom">
        ©All Rights Reserved.
    </div>
    </footer>
</body>
</html>