<%@page import="com.somin.shop.common.DBCon"%>
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %> 
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
   <link href="css/wheel.css" rel="stylesheet" type="text/css">
    <link href="css/shop.css" rel="stylesheet" type="text/css">
    <link href="css/footer.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="js/jquery.mousewheel.min.js"></script>
    <script src="js/mypage.js"></script>
    <script src="js/shop.js"></script>
    <style>
        .page-main > aside {
            margin-top: 110px;
        }
    </style>
    <SCRIPT language="javascript">
 function view(temp) {
  if (temp.length >0) { 
   url = "upload/" + temp;
   window.open(url, "win", "height=350,width=450,toolbar=0,menubar=0,scrollbars=1,resizable=1,status=0");
  }
 }
</SCRIPT>
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
    
        <div id="navi">
        <nav>
            <h2 class="blind">Navigation</h2>
            <ul>
                <li class="on"><A href="shop_list.jsp?cat=11">마카롱</a></li>
                <li><A href="shop_list.jsp?cat=22">뚱카롱</a></li>
                <li><A href="shop_list.jsp?cat=33">다쿠와즈</a></li>
            </ul>
        </nav>
        </div>
    </header>
    <div class="main">
        <main>
            <section> 
                <div id="macaroon_items">
<%
String url = "upload/";
String sql = "select * from 20162422_product  where category=11";
try{
ResultSet rs = DBCon.execSql(sql);
while(rs.next()){
	String fileName = url + rs.getString("small");
	int id = rs.getInt("id");
%>
                    <a href="shop_1.jsp?id=<%=id%>"><img src="<%=fileName%>" style="width:450px;height:450px"></a>
<%
}
}finally{
DBCon.close();
}
%>
                 </div>
            </section>
            <section>
                <div id="ttongcaroon_items">
<%
 sql = "select * from 20162422_product  where category=22";
try{
ResultSet rs = DBCon.execSql(sql);
while(rs.next()){
	String fileName = url + rs.getString("small");
	int id = rs.getInt("id");
%>
                    <a href="shop_1.jsp?id=<%=id%>"><img src="<%=fileName%>" style="width:450px;height:450px"></a>
<%
}
}finally{
DBCon.close();
}
%>
                </div>
            </section>
            <section>
                <div id="daku_items">
<%
 sql = "select * from 20162422_product  where category=33";
try{
ResultSet rs = DBCon.execSql(sql);
while(rs.next()){
	String fileName = url + rs.getString("small");
	int id = rs.getInt("id");
%>
                    <a href="shop_1.jsp?id=<%=id%>"><img src="<%=fileName%>" style="width:450px;height:450px"></a>
<%
}
}finally{
DBCon.close();
}
%>
                </div>
            </section>
           
        </main>
    </div>
    <div class="page-main" role="main">
    <aside>
        <ul>
            <li><a href="#"></a></li>
            <li><a href="#"></a></li>
            <li><a href="#"></a></li>
        </ul>
        
    </aside>
</div>
</body>
</html>