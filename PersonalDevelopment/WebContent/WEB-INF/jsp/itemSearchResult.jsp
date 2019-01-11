<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>検索画面＆検索結果</title>
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
		        		<a class="nav-link" href="#">新規登録</a>
		      		</li>
		      		<li class="nav-item">
		        		<a class="nav-link" href="#">カート</a>
		      		</li>
		      		<li class="nav-item">
		        		<a class="nav-link" href="#">ログイン</a>
		      		</li>
		    	</ul>
		    </div>
		</div>
 	</nav>

 	<div class="container">
 		<form action="" method="get">
 			<div class="form-group">
	   			<label for="exampleInputRetrieval">検索</label>
	    		<input type="email" class="form-control" id="exampleInputRetrieval" placeholder="検索">
	    		<small class="text-muted">欲しい商品を検索してください。</small>
	  		</div>
 		</form>
		<div class="center">
			<h5 class="text-center">検索結果</h5>
			<p class="text-center">
				検索結果${itemCount}件
			</p>
		</div>

		<div class="items">
			<p class="text-center m-xl-5">ここに検索結果を表示</p>
		</div>
	</div>


	<footer class="fixed-bottom bg-light">
	    <div class="container text-center">
	      	<p>Made by ikeda</p>
	    </div>
	</footer>

</body>
</html>