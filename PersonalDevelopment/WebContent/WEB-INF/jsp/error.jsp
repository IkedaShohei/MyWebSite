<!DOCTYPE html>
<html>
<head>
<jsp:include page="/baselayout/head.html" />
<title>エラーメッセージ</title>
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

 	<div class="container center m-auto">
	 		<h4 class="red-text text-center mt-5">システムエラーが発生しました</h4>
	 		<h5 class="red-text text-center">${errorMessage}</h5>
 		<div class="row m-5">
 			<div class="col-sm"></div>
	 		<button class="btn-primary rounded-pill text-center col-sm">TOPページへ</button>
	 		<div class="col-sm"></div>
	 	</div>
 	</div>


	<footer class="fixed-bottom bg-light">
	    <div class="container text-center">
	      	<p>Made by ikeda</p>
	    </div>
	</footer>

</body>
</html>