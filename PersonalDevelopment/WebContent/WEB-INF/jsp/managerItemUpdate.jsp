<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>商品情報更新</title>
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
			<h5 class="text-center col s12 light m-5">商品情報更新</h5>
		</div>
		<div class="row">
			<div class="section"></div>
			<div class="col-md-6 offset-md-3">
				<div class="card grey">
					<div class="card-body text-center">
						<form enctype="multipart/form-data" action="http://localhost:8080/PersonalDevelopment/ItemAdd" method="POST">
								<div class="row">
									<div class="input-field col s10 offset-s1 mb-3">
										<input class="w-100" value="${idb.name}" name="itemName" type="text" placeholder="商品名" required>
									</div>
								</div>
								<div class="row">
									<div class="input-field col s10 offset-s1 mb-3">
										<textarea class="w-100" value="${idb.detail}" name="itemDetail" placeholder="商品詳細" required></textarea>
									</div>
								</div>
								<div class="row">
									<div class="input-field col s10 offset-s1 mb-3">
										<input value="${idb.price}" name="itemPrice" type="text" placeholder="価格" required>
									</div>
								</div>
								<div class="row">
									<div class="input-field col s10 offset-s1 mb-3">
										<div class="custom-file">
	   										<input type="file" value="${idb.fileName}" name="fileName" class="custom-file-input" aria-describedby="inputGroupFileAddon01">
	   										<label class="custom-file-label" for="inputGroupFile01">商品の画像ファイルを選択してください</label>
   										</div>
									</div>
								</div>
											<input type="hidden" value="${udb.userId}" name="userId">
											<input type="hidden" value="${idb.itemId}" name="itemId">
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


	<footer class="fixed-bottom bg-light">
	    <div class="container text-center">
	      	<p>Made by ikeda</p>
	    </div>
	</footer>

</body>
</html>