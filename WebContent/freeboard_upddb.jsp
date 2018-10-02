<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page language="java" import="java.sql.*" %> 
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<HTML>
<HEAD><TITLE>글 수정하기</TITLE></HEAD>
<BODY>
[<A href="freeboard_list.jsp?go=<%=request.getParameter("page")%>">게시판 목록으로 </A>]

<%
 String sql=null;
 Connection con= null;
 PreparedStatement st =null;
 ResultSet rs =null;
 int cnt=0;
 int pos=0;
 String cont=request.getParameter("content");

 if (cont.length()==1) 
  cont = cont+" " ;
  while ((pos=cont.indexOf("\'", pos)) != -1) {
   String left=cont.substring(0, pos);
   String right=cont.substring(pos, cont.length());
   cont = left + "\'" + right;
   pos += 2;
  }  

  int id = Integer.parseInt(request.getParameter("id"));

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
   String pwd= rs.getString("password"); 
   if (pwd.equals(request.getParameter("password"))) {
    sql = "update 20162422_board set name= ? ,email=?,";
    sql = sql + "subject=?,content=? where id=? " ;
    st = con.prepareStatement(sql);
    st.setString(1, request.getParameter("name"));
    st.setString(2, request.getParameter("email"));
    st.setString(3, request.getParameter("subject"));
    st.setString(4, cont);
    st.setInt(5, id);
    cnt = st.executeUpdate(); 
    if (cnt >0) 
    	out.println("<script>alert('정상적으로 수정되었습니다.');location.href='freeboard_list.jsp'; </script>");
   
    else
     out.println("수정되지 않았습니다.");
   } else 
    out.println("비밀번호가 틀립니다.");
  } 
  rs.close();
  st.close();
  con.close();
 } catch (SQLException e) {
  out.println(e);
 } 
%>
</BODY>
</HTML> 