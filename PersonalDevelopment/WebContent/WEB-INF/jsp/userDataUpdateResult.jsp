<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
		<div class="row center">
			<h5 class="text-center col s12 light m-5">ユーザー情報更新完了</h5>
		</div>

		<div class="row">
			<div class="col s3">
				<div class="brank"></div>
			</div>
			<div class="col s6">
				<p class="center-align">
				<a class="btn btn-primary rounded-pill btn-sm  col s8 offset-s2" href="http://localhost:8080/PersonalDevelopment/UserData?userId=${udb.userId}" type="submit" name="action">ユーザー情報へ</a>
				</p>
			</div>
			<div class="col s3">
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