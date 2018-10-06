<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*,java.text.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
	String realFolder = "";
	String saveFolder="upload";
	String encType="utf-8";
	int Maxsize= 5*1024*1024;
	
	ServletContext context = this.getServletContext();
	
	//realFolder=request.getRealPath(saveFolder);
	realFolder="C:/jsp_study/workspace/git/0917/WebContent/upload";
	realFolder="C:/shop/works/git/0917/WebContent/upload";
	MultipartRequest multi = null;
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	multi = new MultipartRequest(request,realFolder,Maxsize,encType,new DefaultFileRenamePolicy());
	
	String wn = multi.getParameter("wname");
	String cat = multi.getParameter("category");
	String pn = multi.getParameter("pname");
	int price = Integer.parseInt(multi.getParameter("price"));
	int dprice = Integer.parseInt(multi.getParameter("dprice"));
	int stock = Integer.parseInt(multi.getParameter("stock"));
	String des = multi.getParameter("description");
	
	long id=0;
	int pos=0;
	
	while ((pos=des.indexOf("\'",pos)) != -1){
		String left=des.substring(0, pos);
		String right=des.substring(pos, des.length());
		des = left + "\'" + right;
		pos += 2;
	}
	
	java.util.Date yymmdd = new java.util.Date();
	SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-d h:mm a");
	
	String ymd=myformat.format(yymmdd);
	
	String sql=null;
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	int cnt=0;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");  
	} catch (java.lang.ClassNotFoundException e){
		out.println(e.getMessage());
	}
	
	try{
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "multi2018");
		 st=con.createStatement();
		 sql ="select max(id) from 20162422_product where category='"+cat+"'";
		 
		 rs =st.executeQuery(sql);
		 rs.next();
		 id = rs.getLong(1);
		 
		 if (id==0)
			 id=Integer.parseInt(cat+"00001");
		 else
			 id = id+1;
		 
		 Enumeration files=multi.getFileNames();
		 String fname1 = (String) files.nextElement();
		 String filename1 = multi.getFilesystemName(fname1);
		 String fname2 = (String) files.nextElement();
		 String filename2 = multi.getFilesystemName(fname2);

		 sql="insert into 20162422_product(id,category,wname,pname,price,downprice";
		 sql = sql+",inputdate,stock,small,description,large) values ("+id+",'";
		 sql = sql+cat+"','"+wn+"','"+pn+"',"+price+","+dprice+",'"+ymd;
		 sql = sql+"',"+stock+",'"+filename1+"','"+des+"','" + filename2 + "')";
		 
		 cnt = st.executeUpdate(sql);
		 
		 if(cnt >0)
			 out.println("<script>alert('상품이 등록되었습니다.목록보러가기.'); location.href='product_list.jsp';</script>");
		 else
			 out.println("<script>alert('상품이 등록에 실패하셨습니다.'); location.href='product_write.jsp';</script>");
		 
		 st.close();
		 con.close();
		 
	} catch(SQLException e){
		out.println(e);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>