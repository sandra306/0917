<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %> 
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="css/wheel.css">
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
   url = "/upload/" + temp;
   window.open(url, "win", "height=350,width=450,toolbar=0,menubar=0,scrollbars=1,resizable=1,status=0");
  }
 }
</SCRIPT>
</head>

<body>

    <header>
    
      <div class="header">
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
        </div>
         <div class="back_header">
        </div>
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
                <div>
        <% 
 String cond="";
 String ca="";
 String pn="";
 
 if (request.getParameter("cat") != null) {
  if( !(request.getParameter("cat").equals("")) ) {
   ca=request.getParameter("cat");
   cond= " where category = '"+ ca+"'";
  }
 }
 
 if (request.getParameter("pname") != null) {
  if ( !(request.getParameter("pname").equals("")) ) {
   pn=request.getParameter("pname");
   cond= " where pname like '%"+ pn+"%'";
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
 
 long id=0;
 
 Connection con= null;
 Statement st =null;
 ResultSet rs =null;
 
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
  String sql = "select * from 20162422_product" ;
  sql = sql+ cond+  " order by id desc";
  rs = st.executeQuery(sql);
 
  if (!(rs.next()))  
   out.println("상품이 없습니다");
  else {
   do {
    keyid.addElement(new Long(rs.getLong("id")));
    pname.addElement(rs.getString("pname"));
    price.addElement(new Integer(rs.getInt("price")));
    dprice.addElement(new Integer(rs.getInt("downprice"))); 
    stock.addElement(new Integer(rs.getInt("stock")));
    description.addElement(rs.getString("description"));
    small.addElement(rs.getString("small"));
    large.addElement(rs.getString("large"));
   }while(rs.next());
      
   totalrows = pname.size();
   totalpages = (totalrows-1)/maxrows +1;
 
   startrow = (where-1) * maxrows;
   endrow = startrow+maxrows-1  ;
 
   if (endrow >= totalrows)
    endrow=totalrows-1;
      
   for(int j=startrow;j<=endrow;j++) { 
    id= ((Long)keyid.elementAt(j)).longValue();
    stocki= ((Integer)stock.elementAt(j)).intValue();
    filename = url+(String)small.elementAt(j);
    pricestr= nf.format(price.elementAt(j)); 
    dpricestr=nf.format(dprice.elementAt(j)); 
 
    out.println("<TR ><TH rowspan=4>");
    out.println("<A href=JavaScript:view(\""+large.elementAt(j)+"\")>"); 
    out.println("<IMG border=0 width=70 height=70 src=\""+filename+"\">");
    out.println("<BR>확대</A></TH>");
    out.println("<TD bgcolor=#DFEDFF>");
    out.println("<FONT face='돋움체' color=black>");
    out.println( pname.elementAt(j)+"(코드:"+id+")");
    out.println("</FONT></TD></TR>");
    out.println("<TR>");
    out.println("<TD   bgcolor=#eeeeee>");
    out.println(description.elementAt(j));
    out.println("</TD></TR>"); 
    out.println("<TR><TD align=right>");
    out.println("시중가: <STRIKE>"+ pricestr+"</STRIKE>원&nbsp;&nbsp;");  
    out.println("판매가: "+ dpricestr+"원");  
    out.println("</TD></TR>"); 
    out.println("<FORM method=post name=search action=\"sale.jsp\">");
	out.println("<TR>");
    out.println("<TD align=right >");

    if (stocki >0) { 
     out.println("주문수량");
     out.println("<INPUT type=text name=quantity size=2 value=1>개");
     out.println("<INPUT type=hidden name=id value="+id+">");
     out.println("<INPUT type=hidden name=go value="+where+">");
     out.println("<INPUT type=hidden name=cat value="+ca+">");
     out.println("<INPUT type=hidden name=pname value="+pn+">");
     out.println("<INPUT type=submit value=\"바구니에 담기\">");
    } else
     out.println("품절");
    out.println("</TD></TR></FORM>"); 
   }
   rs.close();    
  }
  out.println("</TABLE>");
  st.close();
  con.close();
 } catch (SQLException e) {
  out.println(e);
 } 
 
 
%>
           

                 </div>
            </section>
            <section>
                <div>

                </div>
            </section>
            <section>
                <div>

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