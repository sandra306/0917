<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language="java" import="java.sql.*,java.text.*, java.lang.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <link rel="stylesheet" href="css/wheel.css">
    <link rel="stylesheet" href="css/wheel.css">
    <link href="css/product_write.css" rel="stylesheet" type="text/css">
    <link href="css/footer.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="js/jquery.bxslider.min.js"></script>
    <script src="js/jquery.mousewheel.min.js"></script>
    <script src="js/shop.js"></script>
    <script src="js/index.js"></script>
<title>Insert title here</title>
<script language="javascript">
	function check(f) {
		blank=false;
		for (i=0; i<f.elements.length; i++) {
			if(f.elements[i].value == "")
				if(f.elements[i].name != "large")
					blank = true;
		}
		if (blank==true)
			alert("모든 항목을 입력하셔야 합니다.");
		else
			f.submit();
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
  <div id="logo"><a href="index.jsp"><img src="img/main_logo.png"></a></div>
        <div id="login_cart">
            <a href="logout.jsp">LOG-OUT</a>
            <a href="mypage.jsp">MYPAGE</a>
        </div>
        <%
	}
        %>
    </header>
    <div id="wrap">
<a href="main.jsp">메인으로</a>

<form method="post" action="product_save.jsp" enctype="multipart/form-data">
<table boarder=0 width=300>
	<tr>
		<th bgcolor="#f0616e" colspan=2>
		<font size=+1 color="white">상품 올리기</font></th>
	<tr>
		<th width=20% bgcolor="#fffff5">
		<font size=-1 color="gray">작성자</font></th>
		<td bgcolor="#fffff5"><input type="text" name="wname" size="20"></td>
	</tr>
	<tr>
		<th width="20%" bgcolor="#f0616e">
		<font size="-1" color="white">상품 분류</font></th>
		<td bgcolor="#fffff5">
		<font size="-1" color="#fffff5">
		<select name="category" size="1">
            <option value=11>마카롱</option>
            <option value=22>뚱카롱</option>
            <option value=33>다쿠와즈</option>
		</select>
		</font>
		</td>
	</tr>
	<tr>
		<th width="20%" bgcolor="#fffff5">
		<font size="-1" color=gray>상품명</font></th>
		<td bgcolor="#fffff5">
			<input type="text" name="pname" size="30">
		</td>
	</tr>
	<tr>
		<th width="20%" bgcolor="#f0616e">
		<font size="-1" color=white>시중가</font></th>
		<td bgcolor="#fffff5">
			<input type="text" name="price" size="10">
		</td>
	</tr>
	<tr>
		<th width="20%" bgcolor="#fffff5">
		<font size="-1" color=gray>판매가</font></th>
		<td bgcolor="#fffff5">
			<input type="text" name="dprice" size="10">
		</td>
	</tr>
	<tr>
		<th width="20%" bgcolor="#f0616e">
		<font size="-1" color=white>입고 수량</font></th>
		<td bgcolor="#fffff5">
			<input type="text" name="stock" size="10">
		</td>
	</tr>
	<tr>
		<th width="20%" bgcolor="#fffff5">
		<font size="-1" color=gray>작은이미지</font></th>
		<td bgcolor="#fffff5">
			<input type="file" name="small" size="30">
		</td>
	</tr>
	<tr>
		<th width="20%" bgcolor="#f0616e">
		<font size="-1" color=white>큰 이미지</font></th>
		<td bgcolor="#fffff5">
			<input type="file" name="large" size="30">
		</td>
	</tr>
	<tr>
		<th width="20%" bgcolor="#fffff5">
		<font size="-1" color=gray>상품 내용</font></th>
		<td bgcolor="#fffff5"></td>
	</tr>
	<tr>
		<td colspan="2">
			<textarea name="description" cols="140" rows="5"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" value="저장" onclick="check(this.form)">
			<input type=reset value="다시쓰기">
		</td>
	</tr>	
</table>
</form>
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