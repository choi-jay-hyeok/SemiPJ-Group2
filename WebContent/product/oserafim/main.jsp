<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="css/styles.css" rel="stylesheet" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Shopping mall</title>
</head>
<body>
	<div class="navi">
		<a href="#" id="logo">
			<img src="img/title.png" height="50">
		</a>
		<ul id="menu">
			<li><a href="#">Contact</a></li>
			<li><a href="#">Shop</a></li>
			<li><a href="#">Cart</a></li>
			<li><a href="#">Login</a></li>
		</ul>
	</div>
	<div class="header"></div>
	<div class="text">
		<h1>Our New Products</h1>
		<div class="product-list">
		<a href="#" class="product">
			<img src="https://i.postimg.cc/qq2wBG09/sunglasses.jpg" width="225">
			<div class="product-name">Sunglasses</div>
			<div class="product-price">49,000</div>
		</a>

		<a href="#" class="product">
			<img src="https://i.postimg.cc/ZK89HMVG/classic-loafer.jpg" width="225">
			<div class="product-name">Tassel Loafer</div>
			<div class="product-price">89,000</div>
		</a>

		<a href="#" class="product">
			<img src="https://i.postimg.cc/MZRXZL2n/beige-bag.jpg" width="225">
			<div class="product-name">Beige Bag</div>
			<div class="product-price">69,000</div>
		</a>
		<a href="#" class="product">
			<img src="https://i.postimg.cc/q7SM4s1c/sneakers.jpg" width="225">
			<div class="product-name">Sneakers</div>
			<div class="product-price">79,000</div>
		</a>
		<a href="#" class="product">
			<img src="https://i.postimg.cc/QNpxZW15/slippers.jpg" width="225">
			<div class="product-name">Slippers</div>
			<div class="product-price">29,000</div>
		</a>
		<a href="#" class="product">
			<img src="https://i.postimg.cc/Jhfm91hP/wrist-watch.jpg" width="225">
			<div class="product-name">Wrist Watch</div>
			<div class="product-price">99,000</div>
		</a>
		<a href="#" class="product">
			<img src="https://i.postimg.cc/rm2XfQhH/fedora-hat.jpg" width="225">
			<div class="product-name">Fedora Hat</div>
			<div class="product-price">39,000</div>
		</a>
		<a href="#" class="product">
			<img src="https://i.postimg.cc/ZK89HMVG/classic-loafer.jpg" width="225">
			<div class="product-name">Classic Loafer</div>
			<div class="product-price">99,000</div>
		</a>
		<a href="#" class="product">
			<img src="https://i.postimg.cc/4y80R55s/pink-bag.jpg" width="225">
			<div class="product-name">Pink Bag</div>
			<div class="product-price">79,000</div>
		</a>
	</div>
	    <div class="clearfix"></div>
    </div>
    <div class="footer">
    	<a href="https://facebook.com">
    		<img src="https://i.postimg.cc/0r11BZ2j/facebook.png" height="20">
    	</a>
    	<a href="https://instagram.com">
    		<img src="https://i.postimg.cc/9XZmGqf0/instagram.png" height="20">
    	</a>
    	<a href="https://twitter.com">
    		<img src="https://i.postimg.cc/c1RWKyD8/twitter.png" height="20">
    	</a>
    </div>
</body>
</html>