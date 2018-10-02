<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page language="java" import="java.sql.*,java.text.*, java.lang.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<h2>수정 정보를 입력하세요</h2>
<p><hr>

<form method=post action="product_update.jsp">
	<table>
		<tr><td>상품 이름 : </td>
			<td><input type=text name=pname size=10></td>
		</tr>
		<tr><td>판매가 : </td>
			<td><input type=text name=dprice size=10></td>
		</tr>
		<tr><td>상품내용 : </td>
			<td><input type=text name=description size=10></td>
		</tr>
		<tr><td colspan=2>
			<input type=submit value=확인>
			<input type=reset value=취소></td>
			</tr>
	</table>
</form>
<p><hr>

</body>
</html>