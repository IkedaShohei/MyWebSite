<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>ユーザー情報</title>
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
		<div class="card">
			<div class="row center">
				<h5 class="text-center col s12 light m-5">購入履歴詳細</h5>
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
						<td>${bdb.createDate}</td>
						<td>${bdb.deliveryMethodName}</td>
						<td>${bdb.totalPrice}円</td>
				    </tr>
				</tbody>
		  	</table>

			<table class="table mb-0 text-center">
				<thead>
					<tr>
						<th scope="col">商品名</th>
						<th scope="col">単価</th>
						</tr>
				</thead>
				<tbody>
					<c:forEach var="buyDetailItem" items="${buyDetailItemList}" >
						<tr>
							<td class="center">${buyDetailItem.name}</td>
							<td class="center">${buyDetailItem.price}円</td>
						</tr>
					</c:forEach>
						<tr>
							<td class="center">${bdb.deliveryMethodName}</td>
							<td class="center">${bdb.deliveryMethodPrice}円</td>
						</tr>
				</tbody>
		  	</table>
		  </div>
	</div>

</body>
</html>