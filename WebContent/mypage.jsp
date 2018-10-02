<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="css/wheel.css">
    <link rel="stylesheet" href="css/wheel.css">
    <link href="css/mypage.css" rel="stylesheet" type="text/css">
    <link href="css/footer.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="js/jquery.bxslider.min.js"></script>
    <script src="js/mypage.js"></script>
    <script src="js/index.js"></script>
    <script src="js/shop.js"></script>
</head>
<body>

<header>

<%
	String user_name  = request.getParameter("user_name");
	String user_id  = request.getParameter("user_id"); 
		
%>
        <div id="menu">
            <a href="shop.jsp" id="shop">SHOP</a>
            <a href="#" id="notice">NOTICE</a>
            <a href="#" id="qna">Q&amp;A</a>
        </div>
<%
	user_id = null;
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
	} else {
%>
	   <div id="logo"><a href="index.jsp"><img src="img/main_logo.png"></a></div>
        <div id="login_cart">
            <a href="logout.jsp">LOGOUT</a>
            <a href="mypage.jsp">MYPAGE</a>
        </div>
 <%
	}
 %>
    </header>
   
   <div id="wrap">
        <img src="img/mypage.png">
        <div id="my_page">MY PAGE</div>
       <div id="id"><%=session.getAttribute("user_id")%></div>
        <div class="img">
            <a href="mem_updateform.jsp"><img src="img/modify.png"></a>
            <a href="#"><img src="img/letter.png"></a>
            <a href="#"><img src="img/order.png"></a>
            <a href="sale_list.jsp"><img src="img/cart_icon.png"></a>
            <a href="#"><img src="img/address.png"></a>
            <a href="mem_deleteform.jsp"><img src="img/withdrawal.png"></a>
        </div>
    </div>
   <div class="page-main" role="main">
    <aside>
        <ul>
            <li><a href="#"></a></li>
            <li><a href="#"></a></li>
            <li><a href="#"></a></li>
        </ul>
        <button>최<br>근<br><br>본<br><br>내<br>역</button>
    </aside>
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
</body>
</html>