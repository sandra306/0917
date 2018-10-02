<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/wheel.css">
    <link rel="stylesheet" href="css/wheel.css">
    <link href="css/login.css" rel="stylesheet" type="text/css">
    <link href="css/footer.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="js/jquery.bxslider.min.js"></script>
    <script src="js/jquery.mousewheel.min.js"></script>
    <script src="js/shop.js"></script>
    <script src="js/index.js"></script>
    <title></title>
</head>
<body>
    
    <header>
        <div id="menu">
            <a href="shop.jsp" id="shop">SHOP</a>
            <a href="#" id="notice">NOTICE</a>
            <a href="#" id="qna">Q&amp;A</a>
        </div>
        <div id="logo"><a href="index.jsp"><img src="img/main_logo.png"></a></div>
        <div id="login_cart">
            <a href="agree.jsp" id="join">JOIN</a>
            <a href="loginform.jsp" id="login">LOG-IN</a>
            <a href="#" id="cart">CART</a>
        </div>
    </header>
    <form name=MyForm method="post" action="login.jsp">
    <div id="container">
        <div id="loginForm">
               <div id="m_l">MEMBER LOGIN</div>
            <div id="login_1">
                <div id="id_text">ID</div>
                <input type=text name=user_id size=15 maxlength=10 style="font-size: 15px; background-color:transparent;border:0 solid black;text-align:left;">

            </div>
            <div id="pwd">
                <div id="pwd_text">password</div>
                <input type=password name=passwd size=15 maxlength=10 style="font-size: 15px; background-color:transparent;border:0 solid black;text-align:left;">
            </div>
            <div id="check">
            <input style="width:70;" type=submit value="LOG-IN">
            <input style="width:70;" type=reset value="JOIN" onclick="javascript:window.location='agree.jsp'">
            </div>
            <div id="find">
                <a href="idfindform.jsp">아이디 찾기</a>
                <a href="passfindform.jsp">비밀번호 찾기</a>
            </div>
        </div>
    </div>
    </form>
    <div class="page-main" role="main">
    <aside>
        <ul>
            <li><a href="#"></a></li>
            <li><a href="#"></a></li>
            <li><a href="#"></a></li>
        </ul>
       
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