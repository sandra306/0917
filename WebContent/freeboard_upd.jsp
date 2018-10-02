<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page language="java" import="java.sql.*" %> 
<!DOCTYPE html>
<HTML>
<HEAD>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/wheel.css">
    <link rel="stylesheet" href="css/wheel.css">
    <link href="css/free_3.css" rel="stylesheet" type="text/css">
    <link href="css/footer.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="js/jquery.bxslider.min.js"></script>
    <script src="js/jquery.mousewheel.min.js"></script>
    <script src="js/shop.js"></script>
    <script src="js/index.js"></script>
    <title></title>
<SCRIPT language="javascript">
function check() {
 with(document.msgwrite){
  if(subject.value.length == 0){
   alert("제목을 입력해 주세요!!");
   subject.focus();
   return false;
  }
  if(name.value.length == 0){
   alert("이름을 입력해 주세요!!");
   name.focus();
   return false;
  }
  if(password.value.length == 0){
   alert("비밀번호를 입력해 주세요!!");
   password.focus();
   return false;
  }
  if(content.value.length == 0){
   alert("내용을 입력해주세요!!");
   content.focus();
   return false;
  }
  document.msgwrite.submit();
 }
}
</SCRIPT> 
<link href="filegb.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY>
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
<P>
<%
 String sql=null;
 Connection con= null;
 PreparedStatement st =null;
 ResultSet rs =null;
 int cnt=0;
 
 int id = Integer.parseInt(request.getParameter("id"));
 String p= request.getParameter("page");
 
 
 try {
  Class.forName("com.mysql.jdbc.Driver");
 } catch (ClassNotFoundException e ) {
  out.println(e);
 }
 
 try{
  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "multi2018");
 } catch (SQLException e) {
  out.println(e);
 }
 
 try {
  sql = "select * from 20162422_board where id=? ";
  st = con.prepareStatement(sql);
  st.setInt(1, id);
  rs = st.executeQuery();
  if (!(rs.next()))  {
   out.println("해당 내용이 없습니다");
  } else {
%>
  <FORM name="msgwrite" method=POST action="freeboard_upddb.jsp?id=<%=id%>&page=<%=p%>">
 <table width="1000" cellspacing="0" cellpadding="2">
  <tr> <!--1-->
   <td colspan="2" bgcolor="#fff" height="1"></td>
  </tr>
  <tr> <!--2-->
   <td colspan="2" bgcolor="#f0616e" height="20" class="notice">&nbsp;&nbsp;<font size="2">글 수정하기</font></td>
  </tr>
  <tr> <!--3-->
   <td colspan="2" bgcolor="#fff" height="1"></td>
  </tr>
  <tr> <!--4-->
   <td width="124" height="30" align="center" bgcolor="#fffff5">이 름</td>
   <td width="494"  style="padding:0 0 0 10"> 
    <input type=text name=name value="<%=rs.getString("name")%>" class="input_style1">
   </td>
  </tr>
  <tr> <!--5-->
   <td width="124" align="center"  bgcolor="#f0616e">E-mail</td>
   <td width="494" style="padding:0 0 0 10" height="25"> 
    <input type=text name=email value="<%=rs.getString("email")%>" class="input_style1">
   </td>
  </tr>
  <tr> <!--6-->
   <td width="124" align="center"  bgcolor="#fffff5">제 목</td>
   <td width="494" style="padding:0 0 0 10" height="25"> 
    <input type=text name=subject size="60" value="<%=rs.getString("subject")%>" class="input_style2">
   </td>
  </tr>
  <tr> <!--7-->
   <td width="124" height="160" align="center" valign="top" bgcolor="#f0616e" style="padding-top:7;">내 용</td>
   <td width="494" valign="top"  style="padding:5 0 5 10"> 
    <textarea name=content cols="65" rows="10" class="textarea_style1"><%=rs.getString("content")%> </textarea>
   </td>
  </tr>
  <tr> 
   <td width="124" align="center"  bgcolor="#fffff5">암 호</td>
   <td width="494" style="padding:0 0 0 10" height="25"> 
    <input type='password' name='password'  class="input_style1"><br>
   </td>
  </tr>
  <tr> 
   <td colspan="2" height="1" class='button'></td>
  </tr>
  <tr> 
  </tr>
  <tr> 
   <td colspan="2" height="10"></td>
  </tr>
  <tr> 
   <td colspan="2" align="right"> 
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table2">
     <tr> 
      <td width="64%">&nbsp;</td>
      <td width="12%"><a href="#" onClick="check();">확인</a></td>
      <td width="12%"><a href="#" onClick="history.go(-1)">취소</td>
      <td width="12%"><A href="freeboard_list.jsp?go=<%=request.getParameter("page") %>"> 목록</a></td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
</FORM>

<%
  }
  rs.close();
  st.close();
  con.close();
 } catch (SQLException e) {
  out.println(e);
 } 
%>
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