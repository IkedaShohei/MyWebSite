<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>ホーム</title>
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
		      		<c:choose>
		      			<c:when test="${udb == null}">
		      				<li class="nav-item">
				        		<a class="nav-link" href="http://localhost:8080/PersonalDevelopment/Login">ログイン</a>
				      		</li>
		      			</c:when>
		      			<c:when test="${udb != null}">
				      		<li class="nav-item">
				      			<a class="nav-link" href="http://localhost:8080/PersonalDevelopment/Logout">ログアウト</a>
				      		</li>
				      	</c:when>
				    </c:choose>
		    	</ul>
		    </div>
		</div>
 	</nav>

	<header class="container my-auto text-center">
		<div class="row">
			<div class="col-lg-10 mx-auto my-5">
				<h1>CD売り買い</h1>
				<h3>〜自身で売り買いできるサービス〜</h3>
			</div>
			<br>
			<br>
			<div class="col-lg-8 mx-auto mb-5">
				<div class="row">
					<p class="col-sm-2"></p>
					<a class="col-sm-3 btn btn-outline-primary" href="http://localhost:8080/PersonalDevelopment/itemSearchResult" role="button">商品を探す</a>
					<p class="col-sm-2"></p>
					<a class="col-sm-3 btn btn-outline-primary" href="http://localhost:8080/PersonalDevelopment//ItemAdd" role="button">商品を出品する</a>
					<p class="col-sm-2"></p>
				</div>
			</div>
			<div class="col-lg-8 mx-auto mb-5">
				<c:if test="${udb.userId == 1}">
					<div class="row">
						<span class="col-sm-4"></span>
						<a class="col-sm-4 btn btn-outline-danger" href="http://localhost:8080/PersonalDevelopment/ManagerPage" role="button">管理者ページへ</a>
						<span class="col-sm-4"></span>
					</div>
				</c:if>
			</div>
		</div>
	</header>

	<footer class="fixed-bottom bg-light">
	    <div class="container text-center">
	      	<p>Made by ikeda</p>
	    </div>
	</footer>

</body>
</html>