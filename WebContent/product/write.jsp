<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이미지 등록</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/imageTest/data/style.css"/>

<script type="text/javascript" src="<%=cp%>/imageTest/data/image.js"></script>
</head>
<body>
<br/>&nbsp;<br/>

<table width="560" border="2" cellspacing="0" cellpadding="0" 
borderColor="#D6D4A6" style="margin: auto;">
<tr height="40"> 
<td style="padding-left:20px;">
<b>이미지 게시판</b>
</td>
</tr>
</table>
<br/>

<form name="myForm" method="post" action="" enctype="multipart/form-data">
  <table width="560" border="0" cellspacing="0" cellpadding="3" style="margin: auto;">
  
  <tr><td colspan="2" height="3"  bgcolor="#DBDBDB" align="center"></td></tr>
  <tr> 
      <td width="20%" height="30" bgcolor="#EEEEEE" style="padding-left:20px;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
      <td width="80%" style="padding-left:10px;"> 
        <input type="text" name="subject" size="60" maxlength="100" class="boxTF"/>
      </td>
  </tr>		
  <tr><td colspan="2" height="1"  bgcolor="#DBDBDB"></td></tr>
  <tr> 
      <td width="20%" height="30" bgcolor="#EEEEEE" style="padding-left:20px;">파&nbsp;&nbsp;&nbsp;&nbsp;일</td>
      <td width="80%" style="padding-left:10px;"> 
       <input type="file" name="upload" size="60" maxlength="100" class="boxTF"/>
      </td>
  </tr>		

  <tr><td colspan="2" height="3" bgcolor="#DBDBDB" align="center"></td></tr>

  </table>
  
  <table width="560" border="0" cellspacing="0" cellpadding="3" style="margin: auto;">
     <tr align="center"> 
      <td height="40">
        <input type="button" value=" 등록하기 " class="btn2"
			onclick="sendIt()"/>
		<input type="reset" value=" 다시입력 " class="btn2"
			onclick="document.myForm.subject.focus();"/>
		<input type="button" value=" 작성취소 " class="btn2"
			onclick="location='<%=cp%>/image/list.do';"/>
      </td>
    </tr>
  </table>
</form>

</body>
</html>