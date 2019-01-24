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
		<div class="row center">
			<h5 class="text-center col s12 light m-5">ユーザー情報</h5>
		</div>
		<c:if test="${errMsg != null}" >
			<div class="row center">
				<h5 class="text-center text-danger col s12 light m-5">${errMsg}</h5>
			</div>
		</c:if>
		<div class="row">
			<div class="section"></div>
			<div class="col-md-6 offset-md-3">
				<div class="card grey">
					<div class="card-body text-center">
						<form action="http://localhost:8080/PersonalDevelopment/UserData" method="POST">
							<div class="row">
								<div class="input-field col s10 offset-s1 mb-3">
									<div class="row">
										<div class="col"></div>
										<span class="col">ログインID</span>
										<span class="col">${udbAll.loginId}</span>
										<input type="hidden" value="${udbAll.loginId}" name="loginId">
										<div class="col"></div>
									</div>
								</div>
							</div>

							<input type="hidden" value="${udb.userId}" name="userId">

							<div class="row">
								<div class="input-field col s10 offset-s1 mb-3">
									<input value="${udbAll.name}" name="user_name" type="text" placeholder="名前" required>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s10 offset-s1 mb-3">
									<input value="${udbAll.adress}" name="adress" type="text" placeholder="住所" required>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s10 offset-s1 mb-3">
									<input value="" name="password" type="password" placeholder="パスワード" required>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s10 offset-s1 mb-3">
									<input value="" name="passwordConfirmation" type="password" placeholder="パスワード（確認用）" required>
								</div>
							</div>
							<div class="row">
								<div class="col s5">
									<div class="brank"></div>
								</div>
								<div class="col s2">
									<p class="center-align">
										<button class="btn btn-primary rounded-pill btn-sm  col s8 offset-s2" type="submit" name="action">更新</button>
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

	<div class="container mt-5">
		<div class="row">
		    <div class="col">
		    	<p class="text-center">出品情報</p>
		    	<div class="card">
		      		<div class="card-header text-center bg-primary text-white">出品情報</div>
		      			<table class="table text-center">
  							<thead>
								<tr>
							      <th></th>
							      <th scope="col">出品日時</th>
							      <th scope="col">出品状態</th>
							    </tr>
							</thead>
							<tbody>
								<c:forEach var="itemDataBeans" items="${itemDataBeansList}">
								    <tr>
								      <th scope="row">
								      <a href="http://localhost:8080/PersonalDevelopment/Item?item_id=${itemDataBeans.itemId}" class="btn btn-primary rounded-circle p-0">▽</a>
								      </th>
								      <td>${itemDataBeans.addDate}</td>
								      <td>出品中</td>
								    </tr>
								</c:forEach>
							  </tbody>
							</table>
				</div>
		    </div>
		    <div class="col">
		      <p class="text-center">購入情報</p>
		      	<div class="card">
		      		<div class="card-header text-center bg-primary text-white">購入情報</div>
		      			<table class="table text-center">
  							<thead>
								<tr>
							      <th></th>
							      <th scope="col">購入日時</th>
							      <th scope="col">配送方法</th>
							      <th scope="col">購入金額</th>
							    </tr>
							</thead>
							<tbody>
								<c:forEach var="buyDataBeans" items="${buyDataBeansList}">
								    <tr>
								      <th scope="row">
								      <a href="http://localhost:8080/PersonalDevelopment/UserBuyHistoryDetail?buyId=${buyDataBeans.buyId}" class="btn btn-primary rounded-circle p-0">▽</a>
								      </th>
								      <td>${buyDataBeans.createDate}</td>
								      <td>${buyDataBeans.deliveryMethodName}</td>
								      <td>${buyDataBeans.totalPrice}円</td>
								    </tr>
								</c:forEach>
							  </tbody>
							</table>
				</div>






		      	<!-- <div class="row">
					<div class="card w-50 col">
					  <img class="card-img-top" src="..." alt="カードの画像">
					  <div class="card-body">
					    <p class="card-text">カードのタイトルに基づいて、カードのコンテンツの大部分を占める簡単なサンプルテキスト。</p>
					  </div>
					</div>
					<div class="card w-50 col">
					  <img class="card-img-top" src="..." alt="カードの画像">
					  <div class="card-body">
					    <p class="card-text">カードのタイトルに基づいて、カードのコンテンツの大部分を占める簡単なサンプルテキスト。</p>
					  </div>
					</div>
				</div> -->
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