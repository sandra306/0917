<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<HTML>                                         
<HEAD>                                       
<SCRIPT language="javascript">                              
function check(){                                         
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
  <meta charset="UTF-8">
    <link rel="stylesheet" href="css/wheel.css">
    <link rel="stylesheet" href="css/wheel.css">
    <link href="css/freeboard_write.css" rel="stylesheet" type="text/css">
    <link href="css/footer.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="js/jquery.bxslider.min.js"></script>
    <script src="js/index.js"></script>
    <script src="js/shop.js"></script>
    <title></title>
</head>
<body>
    <header>
        <div id="menu">
            <a href="shop_list.jsp" id="shop">SHOP</a>
            <a href="#" id="notice">NOTICE</a>
            <a href="#" id="qna">Q&amp;A</a>
        </div>
        <div id="logo"><a href="index.jsp"><img src="img/main_logo.png"></a></div>
        <div id="login_cart">
            <a href="#" id="join">JOIN</a>
            <a href="#" id="login">LOG-IN</a>
            <a href="#" id="cart">CART</a>
        </div>
    </header>
    <div id="qna_logo"><img src="img/letter.png"></div>
<P align=center><STRONG>Q&amp;A</STRONG></P> 
<FORM name="msgwrite" method="post" action="freeboard_save.jsp">   
<CENTER>                                      
<table width="1000"cellspacing="0" cellpadding="2">          
 <tr><!--1-->                                         
  <td colspan="2" bgcolor="#f0616e" height="1"></td>  
 </tr>                                        
 <tr> <!--2-->                                        
  <td colspan="2" bgcolor="#fffff5" height="50" class="notice">&nbsp;&nbsp;<font size="2">글쓰기</font></td> 
 </tr>                                       
 <tr><!--3-->                                        
  <td colspan="2" bgcolor="#f0616e" height="1"></td>   
 </tr>                                     
 <tr> <!--4-->                                        
  <td width="124" height="30" align="center" bgcolor="#f0616e">이름</td>   
  <td width="494"><div class="input"><input type=text name=name class="input_style1"></div></td>      
 </tr>                                      
 <tr> <!--5-->                                         
  <td width="124" align="center"  bgcolor="#fffff5">E-mail</td>  
  <td width="494" style="padding:0 0 0 10" height="25"><div class="input"><input type=text name=email class="input_style1"></div></td>               
 </tr>                                       
 <tr> <!--6-->                                        
  <td width="124" align="center"  bgcolor="#f0616e">제 목</td>   
  <td width="494" style="padding:0 0 0 10" height="25"><div class="input"><input type=text name=subject size="60" maxlength="60" class="input_style2"></div></td>                                      
 </tr>                                        
 <tr> <!--7-->                             
  <td width="124" height="162" align="center" valign="top" bgcolor="#fffff5" style="padding-top:7px;">내 용</td>
  <td width="494" valign="top"  style="padding:5 0 5 10">    
   <div class="input"><textarea cols="65" rows="10" name=content maxlength="2000" class="textarea_style1"></textarea>     
  </div></td>                                     
 </tr>                                         
 <tr>   <!--8-->                                      
  <td width="124" align="center"  bgcolor="#f0616e">암 호</td>  
  <td width="494" style="padding:0 0 0 10" height="25">                   
   <div class="input"><input type=password name=password class="style1">
  </div></td>                                       
 </tr>                                       
 <tr>   <!--9-->                                     
  <td colspan="2" height="1" class='button'></td>                                  
 </tr>                                       
 <tr>  <!--10-->             
  <td colspan="2" height="1"></td>     
 </tr>                                      
 <tr> <!--11-->                                         
  <td colspan="2" height="10"></td>                                    
 </tr>                                          
 <tr>   <!--12-->                                        
  <td colspan="2" align="right">                    
   <table width="100%" border="0" cellpadding="0" cellspacing="0">                      
    <tr>  <!--13-->                    
     <td width="28%">&nbsp;</td>               
     <td width="51%">&nbsp;</td>                
        <td width="12%"><a href="#" onClick="history.go(-1)">취소</a></td>
     <td width="9%"><a href="#" onClick="check();">확인</a></td>
    </tr>
   </table>
  </td>
 </tr>
</table>                                       
    </CENTER>                                            
</FORM>
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