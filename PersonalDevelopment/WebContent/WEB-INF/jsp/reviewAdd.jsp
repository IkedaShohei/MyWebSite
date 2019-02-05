<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/baselayout/head.html" />
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
			<h5 class="text-center col s12 light m-5">レビュー記入</h5>
		</div>
		<div class="row">
			<div class="section"></div>
			<div class="col-md-6 offset-md-3">
				<div class="card grey mb-2">
					<div class="card-body">
						<form action="http://localhost:8080/PersonalDevelopment/ReviewAdd" method="POST">
							<div class="row text-center border-bottom border-grey my-2">
								<p class="col">商品名</p>
								<p class="col">${idb.name}</p>
							</div>
							<img src="image/${idb.fileName}" class="rounded mx-auto d-block img-fluid mb-2" alt="">
							<p>全体的な評価</p>
							<div class="evaluation">
								<input id="star1" type="radio" name="rating" value="5" />
							    <label for="star1"><span class="text">最高</span>★</label>
							    <input id="star2" type="radio" name="rating" value="4" />
							    <label for="star2"><span class="text">良い</span>★</label>
							    <input id="star3" type="radio" name="rating" value="3" />
							    <label for="star3"><span class="text">普通</span>★</label>
							    <input id="star4" type="radio" name="rating" value="2" />
							    <label for="star4"><span class="text">悪い</span>★</label>
							    <input id="star5" type="radio" name="rating" value="1" />
							    <label for="star5"><span class="text">最悪</span>★</label>
							</div>
							<div class="cp_form">
								<div class="cp_group">
									<div class="cp_tx">
										<label class="title">レビュータイトル:</label>
										<input class="large" type="text" name="reviewTitle" />
									</div>
									<div class="cp_textarea">
										<label class="title">レビューを記入してください:</label>
										<textarea class="small" name="reviewContent" cols="20" rows="5" ></textarea>
									</div>
								</div>
							</div>
							<input type="hidden" name="itemId" value="${idb.itemId}">
							<input type="hidden" name="reviewerId" value="${udb.userId}">
							<div class="row">
								<div class="col s5">
									<div class="brank"></div>
								</div>
								<div class="col s2">
									<p class="center-align">
										<button class="btn btn-primary rounded-pill btn-sm  col s8 offset-s2" type="submit" name="action">投稿</button>
									</p>
								</div>
								<div class="col s5">
									<div class="brank"></div>
								</div>
							</div>
						</form>
					</div>
				</div>
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