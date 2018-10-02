<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %> 
<% request.setCharacterEncoding("utf-8"); %>  
<%@ include file="sessionCheck.jsp" %>  
<!DOCTYPE html>
<html lang="ko">
<head>
    <link rel="stylesheet" href="css/wheel.css">
    <link rel="stylesheet" href="css/wheel.css">
    <link href="css/shop.css" rel="stylesheet" type="text/css">
    <link href="css/footer.css" rel="stylesheet" type="text/css">
    <link href="css/modify.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="js/jquery.bxslider.min.js"></script>
    <script src="js/index.js";></script>
    <script src="js/shop.js"></script>


<script language="javascript">
function sendit() {   
	if (document.memberform.passwd.value == "" ) {

	    alert("비밀번호를 입력해 주십시오");

	    document.memberform.passwd.focus();

	    return true;

	}

	if (document.memberform.passwd_ch.value == "" ) {

	    alert("비밀번호 확인를 입력해 주십시오");

	    document.memberform.passwd_ch.focus();

	    return true;

	}

	if(document.memberform.passwd.value != document.memberform.passwd_ch.value){

	    alert("비밀번호가 일치하지 않습니다");

	    document.memberform.passwd.focus();

	    return true;

	}

	if (document.memberform.user_name.value == "" ) {

	    alert("사용자명을 입력해 주십시오");

	    document.memberform.user_name.focus();

	    return true;

	}

	if (document.memberform.email.value == "" ) {

	    alert("이메일 입력해 주십시오");

	    document.memberform.email.focus();

	    return true;

	}

	if (document.memberform.addr.value == "" ) {

	    alert("주소를 입력해 주십시오");

	    document.memberform.addr.focus();

	    return true;

	}

	if (document.memberform.phone.value == "" ) {

	    alert("연락처를 입력해 주십시오");

	    document.memberform.phone.focus();

	    return true;

	}

    document.memberform.submit();

    return true;

}
</script>
<%
    String user_id = (String)session.getAttribute("user_id");
    String passwd = (String)session.getAttribute("passwd");
    String user_name = "";
    String email = "";
    String addr = "";
    String phone = "";   

    Connection con = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");       
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "multi2018");

        String query = "select user_name, email, addr, phone FROM 20162422_member " +
                       "where user_id = ? AND passwd = ?";
        PreparedStatement pstmt =
            con.prepareStatement(query);
        pstmt.setString(1, user_id);
        pstmt.setString(2, passwd);
        
        ResultSet result = pstmt.executeQuery();
        if(result.next()) {
            user_name = result.getString("user_name");
            email = result.getString("email");
            addr = result.getString("addr");
            phone = result.getString("phone");           
        }
        result.close();
        pstmt.close();
    }
    catch(SQLException e) {
        out.println(e.getMessage());
        e.printStackTrace();
    }
    catch(ClassNotFoundException e) {
        out.println(e.getMessage());
        e.printStackTrace();
    }
    finally {
        try {
            con.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }
%>
</head>
<body>
<header>


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
<div align="center"><span class="text">

</span></div>
<form name=memberform method=post action="mem_update.jsp">
<table width="500" border="0" cellspacing="1" cellpadding="3" class="text" align=center>
   <div id="join_text_1">MEMBER UPDATE</div>
    <colgroup>
        <col width=120>
        <col width=380>
    </colgroup>
    <tr> 
        <td class="insert_Bg"> 
            아이디
        </td>
     <td class="insert_Fg"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" name="user_id" size="13" maxlength="16" value="<%= user_id %>" readonly>
            (영소문자, 숫자만 가능합니다.)
        </td>
    </tr>
    <tr> 
        <td class="insert_Bg"> 
             비밀번호
        </td>
        <td class="insert_Fg"> 
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="password" name="passwd" size="8" maxlength="8" value="<%= passwd %>">
            (영소문자, 숫자 네자리 이상)
        </td>
    </tr>
    <tr> 
        <td class="insert_Bg"> 
             비밀번호 확인
        </td>
        <td class="insert_Fg"> 
            <input type="password" name="passwd_ch" size="8" maxlength="8" value="<%= passwd %>">
        </td>
    </tr>
    <tr> 
        <td class="insert_Bg"> 
            이름
        </td>
        <td class="insert_Fg"> 
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" name="user_name" size="30" maxlength="30" value="<%= user_name %>">
        </td>
    </tr>
    <tr> 
        <td class="insert_Bg"> 
            메일주소
        </td>
        <td class="insert_Fg"> 
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" name="email" size="15" maxlength="128" value="<%= email %>"> @ <select>
             <option>이메일 선택</option>
              <option value="naver">naver.com</option>
              <option value="daum">daum.net</option>
              <option value="gmail">gmail.com</option>
              <option value="nate">nate.com</option>
              <option value="yahoo">yahoo.com</option>
          </select> 
        </td>
    </tr>   
    <tr> 
        <td class="insert_Bg"> 
           주 소&nbsp;&nbsp;
        </td>
		<td class="insert_Fg">
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <input type="text" size="30" name="addr" id="addr"value="<%= addr %>">&nbsp;&nbsp;
        </td>
    </tr>
     <tr> 
        <td class="insert_Bg"> 
             전화번호
        </td>
        <td class="insert_Fg"> 
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            <input type="text" name="phone" size="15" maxlength="16" value="<%= phone %>">&nbsp; &nbsp; 
        </td>
    </tr>    
    <tr align="center"> 
        <td height="40" colspan=3>	
            <a href="javascript:sendit()">회원정보수정</a>
            <a href="mypage.jsp">메인으로</a>
        </td>
    </tr>
</table>
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