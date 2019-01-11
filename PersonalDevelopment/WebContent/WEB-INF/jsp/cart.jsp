<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>カート画面</title>
</head>
<body>


	<nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
		<div class="container">
			<div class="collapse navbar-collapse" id="navbarNav">
				<div class="mr-auto">
					<a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
				</div>
				<ul class="navbar-nav">
		      		<li class="nav-item">
		        		<a class="nav-link" href="http://localhost:8080/PersonalDevelopment">新規登録</a>
		      		</li>
		      		<li class="nav-item">
		        		<a class="nav-link" href="http://localhost:8080/PersonalDevelopment/Cart">カート</a>
		      		</li>
		      		<li class="nav-item">
		        		<a class="nav-link" href="#">ログイン</a>
		      		</li>
		    	</ul>
		    </div>
		</div>
 	</nav>

 		<div class="container">
			<div class="row center">
				<h5 class="text-center col s12 light m-5">買い物かご</h5>
			</div>

			<div class="row mb-5">
				<div class="col-md-1"></div>
				<button class="btn-primary rounded-pill col-md-4">削除</button>
				<div class="col-md-1"></div>
				<div class="col-md-1"></div>
				<button class="btn-primary rounded-pill col-md-4">レジに進む</button>
				<div class="col-md-1"></div>
			</div>

			<div class="row">
				<div class="card w-25 col">
				  <img class="card-img-top" src="..." alt="カードの画像">
				  <div class="card-body">
				    <p class="card-text">カードのタイトルに基づいて、カードのコンテンツの大部分を占める簡単なサンプルテキスト。</p>
				  </div>
				</div>
				<div class="card w-25 col">
				  <img class="card-img-top" src="..." alt="カードの画像">
				  <div class="card-body">
				    <p class="card-text">カードのタイトルに基づいて、カードのコンテンツの大部分を占める簡単なサンプルテキスト。</p>
				  </div>
				</div>
				<div class="card w-25 col">
				  <img class="card-img-top" src="..." alt="カードの画像">
				  <div class="card-body">
				    <p class="card-text">カードのタイトルに基づいて、カードのコンテンツの大部分を占める簡単なサンプルテキスト。</p>
				  </div>
				</div>
				<div class="card w-25 col">
				  <img class="card-img-top" src="..." alt="カードの画像">
				  <div class="card-body">
				    <p class="card-text">カードのタイトルに基づいて、カードのコンテンツの大部分を占める簡単なサンプルテキスト。</p>
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