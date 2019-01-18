<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>商品詳細</title>
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
		<div class="container">
			<div class="collapse navbar-collapse" id="navbarNav">
				<div class="mr-auto">
					<a class="nav-link" href="http://localhost:8080/PersonalDevelopment/index">Home </a>
				</div>
				<ul class="navbar-nav">
					<c:choose>
						<c:when test="${udb == null}">
							<li class="nav-item">
				        		<a class="nav-link" href="http://localhost:8080/PersonalDevelopment/Regist">新規登録</a>
				      		</li>
				      	</c:when>
				      	<c:when test="${udb != null}">
				      		<li class="nav-item">
				        		<a class="nav-link" href="http://localhost:8080/PersonalDevelopment/UserData?userId=${udb.userId}">${udb.name}さん</a>
				      		</li>
				      	</c:when>
					</c:choose>
		      		<li class="nav-item">
		        		<a class="nav-link" href="http://localhost:8080/PersonalDevelopment/Cart">カート</a>
		      		</li>
		      		<li class="nav-item">
		        		<a class="nav-link" href="http://localhost:8080/PersonalDevelopment/Login">ログイン</a>
		      		</li>
		    	</ul>
		    </div>
		</div>
 	</nav>

 	<div class="container">
		<div class="row center">
			<h5 class="text-center col s12 light m-5">商品詳細</h5>
		</div>
		<form action="http://localhost:8080/PersonalDevelopment/ItemAddInCart" method="post">
			<div class="row center mb-4">
				<div class="col-10"></div>
				<input type="hidden" name="itemId" value="${idb.itemId}">
				<button type="submit" class="btn btn-outline-danger col-2">かごに追加</button>
			</div>
		</form>

		<div class="container">
			<div class="row">
				<div class="col text-center">
					<img src="https://4.bp.blogspot.com/-ODfTFPfRXNM/UnXnMw0HYHI/AAAAAAAAaJ0/U6fP0-cHeOA/s400/kaden_CD_DVD.png" class="rounded mx-auto d-block" alt="">
				</div>
				<div class="col">
					<div class="row">
						<h3 class="col">商品名</h3>
						<h3 class="col">${idb.name}</h3>
					</div>
					<div class="row">
						<h5 class="col mx-auto mt-4">値段</h5>
						<h5 class="col mx-auto mt-4">${idb.price}円</h5>
						<h5 class="col mx-auto mt-4">出品者名</h5>
						<h5 class="col mx-auto mt-4">ここはテーブルをくっつけて出品者名を表示</h5>
						<!-- Itemサーブレットでuser,itemテーブルをジョインしてセットする -->
					</div>
					<h4>商品詳細</h4>
					<h6>${idb.detail}</h6>
				</div>
			</div>
		</div>
	</div>


	<footer class="fixed-bottom bg-light">
	    <div class="container text-center">
	      	<p>Made by ikeda</p>
	    </div>
	</footer>

</body>
</html>