<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/wheel.css">
    <link rel="stylesheet" href="css/wheel.css">
    <link href="css/join.css" rel="stylesheet" type="text/css">
    <link href="css/footer.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="js/jquery.bxslider.min.js"></script>
    <script src="js/mypage.js"></script>
    <script src="js/index.js"></script>
    <script src="js/shop.js"></script>
    <title></title>
 <script>  

var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
 window.onload =function(){
	 document.querySelector('#user_id').onkeyup = function(event){
	 	if(check.test(this.value)){
	 		alert('한글은 아이디로 사용할 수없습니다.');
	 		this.value="";
	 		return false;
	 	}
	}
 } 
 
 function fn_press_han(obj)
 {
     //좌우 방향키, 백스페이스, 딜리트, 탭키에 대한 예외
     if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39
     || event.keyCode == 46 ) return;
     //obj.value = obj.value.replace(/[\a-zㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
     obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
 }

  function selmail(){
	  var mail = document.aform.femail3.value;
	  document.aform.femail2.value = mail;
	 }
  function checkid() {
  	var user_id = document.aform.user_id.value 
    window.open("check_id.jsp?user_id="+user_id,"","width=255,height=145,scrollbars=no,resizable=yes");
 }
  
  function checkForm() {  
    if(document.aform.user_id.value == ""){
      alert("아이디를 입력하세요!!");
      document.aform.user_id.focus();
      return true;
    }
    if(document.aform.passwd.value == ""){
      alert("비밀번호를 입력하세요!!");
      document.aform.passwd.focus();
      return true;
    }        
   if(document.aform.passwd_ch.value == ""){
      alert("비밀번호 확인을 입력하세요!!");
      document.aform.passwd_ch.focus();
      return true;
    }
   if(document.aform.passwd.value != document.aform.passwd_ch.value){
      alert("비밀번호와 비밀번호 확인의 입력값이 틀립니다. 다시 입력하세요.");      
      document.aform.passwd.value=""
	  document.aform.passwd_ch.value=""
	  document.aform.passwd.focus();
      return true;
    }
   if(document.aform.passwd.value.length < 4 || document.aform.passwd.value.length > 10){
	      alert("4자리 이상 10자리 이하로 입력해주세요"); 
	      return true;
	    }
	if(document.aform.user_name.value == ""){
      alert("이름 입력하세요!!");
      document.aform.user_name.focus();
      return true;
    }
	if(document.aform.email.value == ""){
      alert("이메일을 입력하세요!!");
      document.aform.email.focus();
      return true;
    }	
	if(document.aform.addr.value == ""){
      alert("주소를 입력하세요!!");
      document.aform.addr.focus();
      return true;
    }	
	if(document.aform.phone.value == ""){
	  alert("연락처를 입력하세요!!");
	  document.aform.phone.focus();
	  return true;
	}	
    document.aform.submit();
    return true;
  }
  
 </script>
</head>
<body>
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
	} else if (is_admin.equals("Y")) {
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
<form name="aform" method="post" action="joinus_insert.jsp">
<table width="678" border="0" align="center">
 <div id="join_text_1">MEMBER JOIN</div>
  <tr>
    <td width="116" height="30">
      <b>아이디</b>
    </td>
    <td width="552">
		<input type="text" name="user_id" size="12" maxlength="12" id="user_id">	
		<input name=idcheck type="button" onClick="checkid()" value="ID중복확인" class="login_b">
		(영소문자, 숫자만 가능)
	</td>
  </tr>
  <tr>
    <td width="116" height="30">
       <b>비밀번호</b>
    </td>
    <td width="552">
		<input type="password" size="25" maxlength="12" name="passwd"> 
		(네 자리 이상, 열 자리 이하)
    </td>
  </tr>
  <tr>
    <td width="170" height="30">
       <b>비밀번호 확인</b>
    </td>
    <td width="552"> 
		 <input type="password" size="25" maxlength="12" name="passwd_ch">		
    </td>
  </tr>
  <tr>
    <td width="116" height="30">
        <b>이&nbsp;&nbsp;&nbsp;&nbsp;름</b>
      </td>
    <td width="552">
		<input type="text" size="8" maxlength="8" name="user_name"> 		
	</td>
  </tr> 
  <tr>
    <td width="116" height="30">
        <b>메&nbsp;&nbsp;&nbsp;&nbsp;일</b>
    </td>
    <td width="552">
     	  <input type="text" size="20" name="email">
                 
     </td>
  </tr> 
  <tr>
    <td width="116" height="30">
     <b>주소</b>
    </td>
    <td width="552">
		<input type="text" size="30" name="addr">
    </td>
  </tr> 
  <tr>
    <td width="116" height="30">
      <b>연락처</b>
    <td width="552">
    
		<input type="text" name="phone" size="10" maxlength="20"> 
		
	</td>
  </tr>
<center>
</center>
</table>
<!--<div id="check">
<a href="checkForm()"><div id="submit">회원가입</div></a>
<a href="index.jsp"><div id="reset">취소</div></a>
</div>-->
<div id="check">
    <input style="width:70;" type=submit value="회원가입" onClick="checkForm()">
    <input style="width:70;" type=reset value="취소" onClick="location='index.jsp'">
</div>
</form>
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