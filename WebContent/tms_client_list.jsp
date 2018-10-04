<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %> 
<% request.setCharacterEncoding("utf-8"); %>
<HTML>
<HEAD>
<meta charset="UTF-8">
    <link rel="stylesheet" href="css/wheel.css">
    <link rel="stylesheet" href="css/wheel.css">
    <link href="css/product_list.css" rel="stylesheet" type="text/css">
    <link href="css/footer.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="js/jquery.bxslider.min.js"></script>
    <script src="js/jquery.mousewheel.min.js"></script>
    <script src="js/shop.js"></script>
    <script src="js/index.js"></script>

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
<FORM method=post name=search action="product_list.jsp">
<TABLE border=0 width=95%>
 <TR>
  <TD align=center>
   <FONT size=-1>상품명으로 찾기</FONT>
   <INPUT type=text name=pname>
   <INPUT type=submit value="검색">
  </TD>
 </TR>
 <TR>
  <TH>
   <FONT size=-1>
    <A href="adminpage.jsp">메인으로</A>
    <A href="product_list.jsp">전체</A>
    <A href="product_list.jsp?cat=11">마카롱</A>
    <A href="product_list.jsp?cat=22">뚱카롱</A>
    <A href="product_list.jsp?cat=33">다쿠와즈</A>
    <A href="product_write.jsp">등록하기</A>
   </FONT>
  </TH>
 </TR>
</TABLE>
</FORM>

<CENTER>
<TABLE border=0 width=100% cellpadding=4 cellspacing=4 style="font-size:10pt">
 <TR>
  <TH width=5% bgcolor=#DFEDFF>
   <FONT color=black face=굴림>
    <NOBR>번호</NOBR>
   </FONT>
  </TH>
  <TH width=10% bgcolor=#DFEDFF>
   <FONT color=black face=굴림>
    <NOBR>배송번호</NOBR>
   </FONT>
  </TH>
  <TH width=10% bgcolor=#DFEDFF>
   <FONT color=black face=굴림>
    <NOBR>주문번호</NOBR>
   </FONT>
  </TH>
  <TH width=10% bgcolor=#DFEDFF>
   <FONT color=black face=굴림>
    <NOBR>주문자(이름)</NOBR>
   </FONT>
  </TH>
  <TH width=10% bgcolor=#DFEDFF>
   <FONT color=black face=굴림>
    <NOBR>입금확인</NOBR>
   </FONT>
  </TH>
  <TH width=10% bgcolor=#DFEDFF>
   <FONT color=black face=굴림>
    <NOBR>배송상태</NOBR>
   </FONT>
  </TH>
  <TH width=10% bgcolor=#DFEDFF>
   <FONT color=black face=굴림>
    <NOBR>배송시작일</NOBR>
   </FONT>
  </TH>
  <TH width=20% bgcolor=#DFEDFF>
   <FONT color=black face=굴림>
    <NOBR>배송완료일</NOBR>
   </FONT>
  
 </TR>
<% 

 Vector member_id=new Vector();
 Vector tms_id=new Vector();
 Vector so_id=new Vector();
 Vector confirm_deposit=new Vector();
 Vector status_shipping=new Vector();
 Vector shipping_date=new Vector();
 Vector delivery_date=new Vector();
 Vector userId =new Vector();
 Vector name =new Vector();
 String category=null;
 
 long id=0;
 
 NumberFormat nf = NumberFormat.getInstance();
 String downprice=null; 
 
 int where=1;
 int totalgroup=0;
 int maxpages=2;
 int startpage=1;
 int endpage=startpage+maxpages-1;
 int wheregroup=1;
 if (request.getParameter("go") != null) {
  where = Integer.parseInt(request.getParameter("go"));
  wheregroup = (where-1)/maxpages + 1;
  startpage=(wheregroup-1) * maxpages+1;  
  endpage=startpage+maxpages-1; 
 } else if (request.getParameter("gogroup") != null) {
  wheregroup = Integer.parseInt(request.getParameter("gogroup"));
  startpage=(wheregroup-1) * maxpages+1;  
  where = startpage ; 
  endpage=startpage+maxpages-1; 
 }
 int nextgroup=wheregroup+1;
 int priorgroup= wheregroup-1;
 
 int startrow=0;
 int endrow=0;
 int maxrows=5;
 int totalrows=0;
 int totalpages=0;
 Connection con= null;
 Statement st =null;
 ResultSet rs =null;
 
 String url="upload";
 
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
  st = con.createStatement();
  String sql = "select t.*,m.user_id, s.name from 20162422_tms t, 20162422_saleorder s, 20162422_member m";
  sql += " where t.member_id=m.user_id and s.id=t.so_id";
  sql += " and m.user_id='" +user_id + "'";
  sql += " order by id";
  rs = st.executeQuery(sql);
  if (!(rs.next()))  {
   out.println("상품이 없습니다");
  } else {
   do {
	   tms_id.addElement(rs.getLong("id"));
	   member_id.addElement(rs.getString("member_id"));
	   so_id.addElement(rs.getLong("so_id"));
	   confirm_deposit.addElement(rs.getInt("confirm_deposit"));
	   status_shipping.addElement(rs.getInt("status_shipping"));
	   shipping_date.addElement(rs.getString("shipping_date")==null?"":rs.getString("shipping_date"));
	   delivery_date.addElement(rs.getString("delivery_date")==null?"":rs.getString("delivery_date"));
	   userId.addElement(rs.getString("user_id"));
	   name.addElement(rs.getString("name"));
   }while(rs.next());

   totalrows = tms_id.size();
   totalpages = (totalrows-1)/maxrows +1;
   startrow = (where-1) * maxrows;
   endrow = startrow+maxrows-1  ;
   if (endrow >= totalrows)
    endrow=totalrows-1;
   totalgroup = (totalpages-1)/maxpages +1;
   if (endpage > totalpages) 
    endpage=totalpages;
   for(int j=startrow;j<=endrow;j++) {
    id= ( (Long)tms_id.elementAt(j) ).longValue();  
  
    out.println("<TR>");
    out.println("<TH width=5%  bgcolor=#eeeeee>");
    out.println(j+1+"</TH>");
    out.println("<TD width=5% bgcolor=#eeeeee align=center>");
    out.print("<A href=\"tms_read.jsp?id="+id + "&go=" + where);
    out.print("\">"+tms_id.elementAt(j));  
    out.println("</A></TD>");
    out.println("<TD width=10% bgcolor=#eeeeee align=center>");
    out.println(so_id.elementAt(j)+ "</TD>");
    out.println("<TD width=20% bgcolor=#eeeeee align=center>"); 
    out.println(member_id.elementAt(j)+ "("+name.elementAt(j)+")</TD>");
    out.println("<TD width=10% bgcolor=#eeeeee align=center>");
    out.println("<select name=\"confirm_deposit\" disabled >");
    out.println("<option value=\"0\" "+((int)confirm_deposit.elementAt(j)==0?"selected":"")+">미확인</option>");
    out.println("<option value=\"1\" "+((int)confirm_deposit.elementAt(j)==1?"selected":"")+">확인</option>");
    out.println("</select>"); 
    out.println("</TD>");
    out.println("<TD width=10% bgcolor=#eeeeee align=center>");
    out.println("<select name=\"status_shipping\" disabled >");
    out.println("<option value=\"0\" "+((int)status_shipping.elementAt(j)==0?"selected":"")+">배송준비중</option>");
    out.println("<option value=\"1\" "+((int)status_shipping.elementAt(j)==1?"selected":"")+">배송중</option>");
    out.println("<option value=\"2\" "+((int)status_shipping.elementAt(j)==2?"selected":"")+">배송완료</option>");
    out.println("</select>");
    out.println("</TD>");
    out.println("<TD width=10% bgcolor=#eeeeee align=center>");
    out.println("<input type=\"date\" name=\"shipping_date\" disabled value=\"" + shipping_date.elementAt(j) +"\"></TD>");
    out.println("<TD width=10% bgcolor=#eeeeee>");
    out.println("<input type=\"date\" name=\"delivery_date\" disabled value=\"" + delivery_date.elementAt(j) +"\"></TD>"); 
    out.println("</TR>");
   }
   rs.close();    
  }
  out.println("</TABLE>");
  st.close();
  con.close();
 } catch (SQLException e) {
  out.println(e);
 } 

 if (wheregroup > 1) {
  out.print("[<A href=\"product_list.jsp?gogroup=1"); 
  out.print("\">처음</A>]");
  out.print("[<A href=\"product_list.jsp?gogroup="+priorgroup);
  out.print("\">이전</A>]");
 } else {
  out.println("[처음]") ;
  out.println("[이전]") ;
 }
 
 if (totalrows !=0) {  
  for(int jj=startpage; jj<=endpage; jj++) {
   if (jj==where) 
    out.println("["+jj+"]") ;
   else {
    out.print("[<A href=\"product_list.jsp?go="+jj) ;
    out.print("\">"+jj + "</A>]") ;
   }
  } 
 }
 if (wheregroup < totalgroup) {
  out.print("[<A href=\"product_list.jsp?gogroup="+ nextgroup);
  out.print("\">다음</A>]");
  out.print("[<A href=\"product_list.jsp?gogroup="+ totalgroup);
  out.print("\">마지막</A>]");
 } else {
  out.println("[다음]");
  out.println("[마지막]");
 }
 out.println ("전체상품수 :"+totalrows); 
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
    </div>
    </footer>
</BODY>
</HTML>