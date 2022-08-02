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
<title>이미지 게시판</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/imageTest/data/style.css"/>

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

<table width="560" border="0" cellspacing="0" cellpadding="3" style="margin: auto;">

<tr>
	<td colspan="2">
	Total ${dataCount } articles, ${totalPage } pages / Now page is ${currentPage }</td>
	<td align="right" colspan="4">
	<input type="button" value=" 게시물등록 " class="btn2"
		onclick="location='<%=cp%>/image/write.do';"/>
	</td>
</tr>

<tr><td colspan="3" height="3" bgcolor="#DBDBDB" align="center"></td></tr>

<c:set var="i" value="0" />
<c:set var="j" value="3" />

<c:forEach var="dto" items="${lists }">
  <c:if test="{i%j == 0}">
 		 <tr>
  </c:if>
	<td align="center" width="250">
	<img src="${imagePath }/${dto.saveFileName }" width="180" height="180"/>
	${dto.num }&nbsp;<a href="${deletePath }?num=${dto.num }">삭제</a>
	
	</td>
	<c:if test="${i%j == j-1 }">
		</tr>	
	</c:if>
<c:set var="i" value="${i+1 }"/>
</c:forEach>

	
<tr align="center"><td colspan="3"> ${pageIndexList } </td></tr>
<tr><td colspan="3" height="3" bgcolor="#DBDBDB" align="center"></td></tr>

</table>
</body>
</html>