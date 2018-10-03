<%@ page contentType="text/html; charset=utf-8" %> 
<%@ page language="java" import="java.sql.*,java.util.*" %> 
<!DOCTYPE html>
<HTML>
<HEAD><TITLE>글 읽기</TITLE>

<link href="filegb.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY>
<%
String userId = (String)session.getAttribute("user_id");
System.out.println(userId);
 String sql=null;
 Connection con= null;
 PreparedStatement st =null;
 ResultSet rs =null;

 int id = Integer.parseInt(request.getParameter("id"));
 
 try {
  Class.forName("com.mysql.jdbc.Driver"); 
 } catch (ClassNotFoundException e ) {
 out.println(e);
 }

 try{
  con =DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "root", "multi2018");
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
   String em=rs.getString("email");
   if ((em != null) && (!(em.equals(""))) ) 
    em = "<A href=mailto:" +em + ">" + rs.getString("name")+"</A>";
   else
    em = rs.getString("name");
   out.println("<table width='600' cellspacing='0' cellpadding='2'>");
   out.println("<tr>");
   out.println("<td height='22'>&nbsp;</td></tr>");
   out.println("<tr align='center'>");
   out.println("<td height='1' bgcolor='#1F4F8F'></td>");
   out.println("</tr>");
   out.println("<tr align='center' bgcolor='#DFEDFF'>");
   out.println("<td class='button' bgcolor='#DFEDFF'>"); 
   out.println("<div align='left'><font size='2'>"+rs.getString("subject") + "</div> </td>");
   out.println("</tr>");
   out.println("<tr align='center' bgcolor='#FFFFFF'>");
   out.println("<td align='center' bgcolor='#F4F4F4'>"); 
   out.println("<table width='100%' border='0' cellpadding='0' cellspacing='4' height='1'>");
   out.println("<tr bgcolor='#F4F4F4'>");
   out.println("<td width='13%' height='7'></td>");
   out.println("<td width='51%' height='7'>글쓴이 : "+ em +"</td>");
   out.println("<td width='25%' height='7'></td>");
   out.println("<td width='11%' height='7'></td>");
   out.println("</tr>");
   out.println("<tr bgcolor='#F4F4F4'>");
   out.println("<td width='13%'></td>");
   out.println("<td width='51%'>작성일 : " + rs.getString("inputdate") + "</td>");
   out.println("<td width='11%'></td>");
   out.println("</tr>");
   out.println("</table>");
   out.println("</td>");
   out.println("</tr>");
   out.println("<tr align='center'>");
   out.println("<td bgcolor='#1F4F8F' height='1'></td>");
   out.println("</tr>");
   out.println("<tr align='center'>");
   out.println("<td style='padding:10 0 0 0'>");
   out.println("<div align='left'><br>");
   out.println("<font size='3' color='#333333'><PRE>"+rs.getString("content") + "</PRE></div>");
   out.println("<br>");
   out.println("</td>");
   out.println("</tr>");
   out.println("<tr align='center'>");
   out.println("<td class='button' height='1'></td>");
   out.println("</tr>");
   out.println("<tr align='center'>");
   out.println("<td bgcolor='#1F4F8F' height='1'></td>");
   out.println("</tr>");
   out.println("</table>");
  %>
  <table width="600" border="0" cellpadding="0" cellspacing="5">
   <tr> 
    <td align="right" width="450"><A href="freeboard_list.jsp?go=<%=request.getParameter("page") %>"> 
     <img src="img/list.jpg" border=0></a></td>
 <%
 if(userId!=null && userId.equals("admin")){ 
 %>
	<td width="70" align="right"><A href="freeboard_rwrite.jsp?id=<%= request.getParameter("id")%>&page=<%=request.getParameter("page")%>"> <img src="img/reply.jpg" border=0></A></td>
<%
 }
%>
	<td width="70" align="right"><A href="freeboard_upd.jsp?id=<%=id%>&page=1"><img src="img/edit.jpg" border=0></A></td>
	<td width="70" align="right"><A href="freeboard_del.jsp?id=<%=id%>&page=1"><img src="img/del.jpg"  border=0></A></td>
   </tr>
  </table>
  <%    
  
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