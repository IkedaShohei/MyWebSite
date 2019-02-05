<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/baselayout/head.html" />
<title>新規登録</title>
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
			<h5 class="text-center col s12 light ">新規登録</h5>
		</div>
		<c:if test="${errMsg != null}">
			<div class="row center">
				<h5 class="text-center col s12 light text-danger">${errMsg}</h5>
			</div>
		</c:if>
		<div class="row">
			<div class="section"></div>
			<div class="col-md-6 offset-md-3">
				<div class="card grey">
					<div class="card-body text-center">
						<form action="http://localhost:8080/PersonalDevelopment/Regist" method="POST">
							<div class="row">
								<div class="input-field col s10 offset-s1 mb-3">
									<input value="${loginID}" name="loginID" type="text" placeholder="ログインID" required>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s10 offset-s1 mb-3">
									<input value="${userName}" name="user_name" type="text" placeholder="名前" required>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s10 offset-s1 mb-3">
									<input value="${userAddress}" name="user_address" type="text" placeholder="住所" required>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s10 offset-s1 mb-3">
									<input name="password" type="password" placeholder="パスワード" required>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s10 offset-s1 mb-3">
									<input name="confirm_password" type="password" placeholder="パスワード（確認用）" required>
								</div>
							</div>
							<div class="row">
								<div class="col s5">
									<div class="brank"></div>
								</div>
								<div class="col s2">
									<p class="center-align">
										<button class="btn btn-primary rounded-pill btn-sm  col s8 offset-s2" type="submit" name="action">確認</button>
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


	<footer class="fixed-bottom bg-light">
	    <div class="container text-center">
	      	<p>Made by ikeda</p>
	    </div>
	</footer>

</body>
</html>