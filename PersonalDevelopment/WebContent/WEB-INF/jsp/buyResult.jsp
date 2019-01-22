<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>購入確認画面</title>
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


 	<div class="container">
		<div class="row center">
			<h5 class="text-center col s12 light m-5">購入が完了しました</h5>
		</div>

		<div class="row mb-5">
			<div class="col-sm"></div>
			<button class="btn-primary rounded-pill col-sm">引き続き買い物</button>
			<div class="col-sm"></div>
			<div class="col-sm"></div>
			<button class="btn-primary rounded-pill col-sm">ユーザー情報へ</button>
			<div class="col-sm"></div>
		</div>

		<div class="card">
			<div class="row center">
				<h5 class="text-center col s12 light m-5">購入詳細</h5>
			</div>

			<table class="table mb-5">
				<thead>
					<tr>
						<th></th>
						<th scope="col">購入日時</th>
						<th scope="col">配送方法</th>
						<th scope="col">合計金額</th>
						</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row"></th>
						<td>購入日時のセル</td>
						<td>配送方法のセル</td>
						<td>合計金額のセル</td>
				    </tr>
				    <tr>
						<th scope="row"></th>
						<td>配送方法</td>
						<td></td>
						<td>配送料金</td>
				    </tr>
				</tbody>
		  	</table>

			<table class="table mb-0">
				<thead>
					<tr>
						<th></th>
						<th scope="col">商品名</th>
						<th scope="col">単価</th>
						</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>商品名のセル</td>
						<td>単価のセル</td>
				    </tr>
				    <tr>
						<th scope="row"></th>
						<td>配送方法</td>
						<td>配送料金</td>
				    </tr>
				</tbody>
		  	</table>
		  </div>
	</div>



	<footer class="fixed-bottom bg-light">
	    <div class="container text-center">
	      	<p>Made by ikeda</p>
	    </div>
	</footer>

</body>
</html>