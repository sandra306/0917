<%@page import="com.somin.shop.common.DBCon"%>
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %> 
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="css/wheel.css">
    <link href="css/details.css" rel="stylesheet" type="text/css">
    <link href="css/footer.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/jquery.bxslider.min.js"></script>
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="js/jquery.mousewheel.min.js"></script>
    <script src="js/modernizr.custom.min.js"></script>
    <script src="js/mypage.js"></script>
    <script src="js/index.js"></script>
    <script src="js/shop.js"></script>
    <script src="js/top.js"></script>
    <script src="js/details.js"></script>
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
     <form name="sale" method="post" action="sale.jsp">
    <%
    
 String cond="";
 String ca="";
 String pn="";
 String TT="";
 
 TT="select where ='id' from 20162422_product ";
 if (request.getParameter("cat") != null) {
  if( !(request.getParameter("cat").equals("")) ) {
   ca=request.getParameter("cat");
   cond= " where category = '"+ ca+"'";
  }
 }
 
 if (request.getParameter("pname") != null) {
  if ( !(request.getParameter("pname").equals("")) ) {
   pn=request.getParameter("pname");
   cond= " where pname like "+ pn+"";
  }
 }

 Vector pname=new Vector();
 Vector keyid=new Vector();
 Vector price=new Vector();
 Vector dprice=new Vector();
 Vector stock=new Vector();
 Vector small=new Vector();
 Vector large=new Vector();
 Vector description=new Vector();
 
 Vector userid=new Vector();
 
 String url = "/upload/";
 
 NumberFormat nf= NumberFormat.getNumberInstance();
 
 int stocki;
 String pricestr=null;
 String dpricestr=null;
 String filename="";
 
 int where=1;
 
 if (request.getParameter("go") != null) 
  where = Integer.parseInt(request.getParameter("go"));
 
 int nextpage=where+1;
 int priorpage = where-1;
 int startrow=0;
 int endrow=0;
 int maxrows=3;
 int totalrows=0;
 int totalpages=0;
 

String sql = "select * from 20162422_product  where id=" + request.getParameter("id");
        System.out.println(sql);
 %>
  <div id="container">
        <% 
long dPrice = 0;
String pName  = "";
String descript = "";

try{
	ResultSet rs = DBCon.execSql(sql);
  if (!(rs.next()))  
   	out.println("상품이 없습니다");
  else {
	
	stocki = rs.getInt("stock");
	String fileName1 = url + rs.getString("small");
	String fileName2 = url + rs.getString("large");
	dPrice = rs.getLong("downprice");
	pName = rs.getString("pname");
	descript = rs.getString("description");
%>

       <div id="main_img">
            <%  out.println("<IMG border=0 width=600 height=600 src=\""+fileName1+"\">");%>
       </div>
       <div id="img">
           <div id="img_1"><a href="#"><IMG border=0 width=600 height=600 src="<%=fileName2%>"></a></div>
           <div id="img_2"><a href="#"></a></div>
           <div id="img_3"><a href="#"></a></div>
       </div>
<%
    if (stocki >0) { 
     
   
    	
     //out.println("<INPUT type=hidden name=id value="+id+">");
     out.println("<INPUT type=hidden name=go value="+where+">");
     out.println("<INPUT type=hidden name=cat value="+ca+">");
     out.println("<INPUT type=hidden name=pname value="+pn+">");
     
    } else
     out.println("품절");
    out.println("</TD></TR></FORM>"); 
   }  
  out.println("</TABLE>");
 } catch (SQLException e) {
  out.println(e);
 } finally{
	 DBCon.close();
 }
 
 
%>
 
      <div id="item_write">
           <div class="name"><%=pName%></div>
           <div class="details">1. 본 상품은 매주 목요일에 발송. <br>&nbsp;&nbsp;&nbsp;&nbsp;금요일에 수령 가능합니다. <br><br>
            2. 한박스에 4개가 들어갑니다.<br>
            &nbsp;&nbsp;&nbsp;&nbsp;<br>
            3. 아이스보냉백은 선택 사항입니다.</div>
            <div id="price"><%=dPrice%> </div>
            <div id="express_dt">
            적립금 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2%<br><br>
            배송비 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2,000원
            </div>
            <div id="iceBag">
            아이스보냉백&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <select>
              <option value="select">선택하세요</option>
              <option value="select">추가</option>
              <option value="select">미추가</option>
          </select>
            </div>
            <div id="amount">
            <%out.println("주문수량");%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
             <%out.println("<INPUT type=text name=quantity size=2 value=1>개"); %>
             <%out.println("<INPUT type=submit value=\"바구니에 담기\">"); %>
              
          
            </div>
            <div id="check">
                <div id="buy"><a href="#">BUY</a></div>
                <div id="cart"><a href="sale_list.jsp">CART</a></div>
            </div>
       </div>
           
            </div>
            <div class="text">
            <%=descript%>
       </div>
       
   
   
    <a href="#" class="top-button"><img src="img/top.png"></a>
    <div class="page-main" role="main">
    <aside>
        <ul>
            <li><a href="#"> </a></li>
            <li><a href="#"></a></li>
            <li><a href="#"></a></li>
        </ul>
        
    </aside>
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