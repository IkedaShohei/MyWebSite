<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>削除確認</title>
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
			<h5 class="text-center col s12 light m-5">ユーザー削除確認</h5>
		</div>

		<div class="container text-center mb-5">
			<p>ログインID：（ike）を</p>
			<p>本当に削除してよろしいですか。</p>
		</div>


		<div class="row">
			<div class="col s2">
				<div class="brank"></div>
			</div>
			<div class="col s3">
				<p class="center-align">
					<button class="btn btn-primary rounded-pill btn-sm  col s8 offset-s2" type="submit" name="action">ユーザー詳細</button>
				</p>
			</div>
			<div class="col s2">
				<div class="brank"></div>
			</div>
			<div class="col s3">
				<p class="center-align">
				<button class="btn btn-primary rounded-pill btn-sm  col s8 offset-s2" type="submit" name="action">商品詳細</button>
				</p>
			</div>
			<div class="col s2">
				<div class="brank"></div>
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