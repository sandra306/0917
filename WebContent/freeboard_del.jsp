<%@ page contentType="text/html; charset=utf-8" %>
<%@ page language="java" import="java.io.*,java.sql.*,java.util.*" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/wheel.css">
    <link rel="stylesheet" href="css/wheel.css">
    <link href="css/free_1.css" rel="stylesheet" type="text/css">
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
    <CENTER> 
<FORM name="msgdel" method=post action=freeboard_deldb.jsp>
 <input type="hidden" name="id" value="<%=request.getParameter("id")%>"  >
 <input type="hidden" name="page" value="<%=request.getParameter("page")%>"  >
 <table width="70%" cellspacing="0" cellpadding="2">         
  <tr>                                                              
   <td colspan="2" bgcolor="#fff" height="1"></td>                      
  </tr>                                                             
  <tr>                                                               
   <td colspan="2" bgcolor="#f0616e" height="20" class="notice"><b>글 삭제하기</b></td>                                                                  
  </tr>                                                             
  <tr>                                                              
   <td colspan="2" bgcolor="#fff" height="1"></td>             
  </tr>                                                            
  <tr>                                                               
   <td width="124" height="30" bgcolor="#f0616e" align='center' class='style2'>비밀번호</td>  
   <td width="494">&nbsp;&nbsp;<input type="password" name=password class='input_style1'></td>                                                            
  </tr>                                                             
  <tr>                                                               
   <td colspan="2" height="1" class='button'></td>          
  </tr>                                                            
  <tr>                                                            
   <td colspan="2" height="1" bgcolor="#1F4F8F"></td>                              
  </tr>                                                            
  <tr>                                                               
   <td colspan="2" height="10"></td>                                               
  </tr>                                                             
  <tr>                                                              
   <td colspan="2" align="right">                                     
    <table width="100%" border="0" cellpadding="4" cellspacing="4">        
     <tr>                                                          
         <td width="84%">&nbsp;</td>            <div id="click">                       
      <td width="8%"><a href="freeboard_list.jsp?go=<%=request.getParameter("page")%> ">목록</a></td>
      <td width="8%"><a href="#" onClick="check();">삭제</a></td>
         </div> 
	 </tr>                                                      
    </table>                                                      
   </td>                                                          
  </tr>                                                            
 </table>   
</form>
</center>
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