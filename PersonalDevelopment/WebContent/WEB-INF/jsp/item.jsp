<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
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
					<img src="image/${idb.fileName}" class="rounded mx-auto d-block img-fluid" alt="">
				</div>
				<div class="col">
					<div class="row">
						<h4 class="col">商品名</h4>
						<h4 class="col">${idb.name}</h4>
					</div>
					<div class="row">
						<h5 class="col mt-4">値段</h5>
						<h5 class="col mt-4">${idb.price}円</h5>
						<h5 class="col mt-4">出品者名</h5>
						<h5 class="col mt-4">${idb.addUserName}</h5>
					</div>
						<h4 class="col mt-4">商品詳細</h4>
						<h6>${idb.detail}</h6>
					<div class="row">
						<h6 class="col mx-auto mt-5 ">商品追加日</h6>
						<h6 class="col mx-auto mt-5 "><fmt:formatDate value="${idb.addDate}" pattern="yyyy年MM月dd日" /></h6>
					</div>
					<div class="row my-4">
						<span class="col-3 mx-auto"></span>
						<a class="btn btn-primary col-6 mx-auto" href="http://localhost:8080/PersonalDevelopment/ReviewAdd?itemId=${idb.itemId}" role="button">カスタマーレビューを書く</a>
						<span class="col-3 mx-auto"></span>
					</div>
				</div>
			</div>
		</div>
	</div>

		<div class="container mb-5">
			<div class="row center">
				<h5 class="text-center col s12 light m-5 border-bottom py-3">カスタマーレビュー</h5>
			</div>
			<div class="row center">
				<div class="container col-2"></div>
				<div class="container col-8">
					<c:forEach var="rdb" items="${reviewDataBeansList}">
						<P class=""><i class="far fa-user"></i>${rdb.reviewerName}</P>
						<div class="row mb-3">
							<!-- 評価１の時 -->
							<c:if test="${rdb.rating == 1}">
								<span class="col-2 text-warning">★☆☆☆☆</span>
								<span class="col-6">${rdb.reviewTitle}</span>
								<span class="col-3"></span>
							</c:if>
							<!-- 評価２の時 -->
							<c:if test="${rdb.rating == 2}">
								<span class="col-2 text-warning">★★☆☆☆</span>
								<span class="col-6">${rdb.reviewTitle}</span>
								<span class="col-3"></span>
							</c:if>
							<!-- 評価３の時 -->
							<c:if test="${rdb.rating == 3}">
								<span class="col-2 text-warning">★★★☆☆</span>
								<span class="col-6">${rdb.reviewTitle}</span>
								<span class="col-3"></span>
							</c:if>
							<!-- 評価４の時 -->
							<c:if test="${rdb.rating == 4}">
								<span class="col-2 text-warning">★★★★☆</span>
								<span class="col-6">${rdb.reviewTitle}</span>
								<span class="col-3"></span>
							</c:if>
							<!-- 評価５の時 -->
							<c:if test="${rdb.rating == 5}">
								<span class="col-2 text-warning">★★★★★</span>
								<span class="col-6">${rdb.reviewTitle}</span>
								<span class="col-3"></span>
							</c:if>
						</div>
						<div class="mb-3">
							<span><fmt:formatDate value="${rdb.createDate}" pattern="yyyy年MM月dd日" /></span>
						</div>
						<div class="mb-3">
							<span>${rdb.reviewContent}</span>
						</div>
						<br>
					</c:forEach>
				<div class="container col-2"></div>
			</div>
		</div>



	</div>


	<footer class="bg-light">
	    <div class="container text-center">
	      	<p>Made by ikeda</p>
	    </div>
	</footer>

</body>
</html>