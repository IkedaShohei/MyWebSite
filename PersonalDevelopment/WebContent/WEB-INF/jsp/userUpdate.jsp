<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>ユーザー情報更新</title>
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
			<h5 class="text-center col s12 light ">ユーザー情報更新</h5>
		</div>
		<div class="row">
			<div class="section"></div>
			<div class="col-md-6 offset-md-3">
				<div class="card grey">
					<div class="card-body text-center">
						<form action="" method="POST">
								<div class="row">
									<div class="input-field col s10 offset-s1 mb-3">
										<div class="row">
											<p class="col">ログインID</p>
											<p class="col">ike</p>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="input-field col s10 offset-s1 mb-3">
										<div class="row">
											<p class="col">名前</p>
											<input class="col" value="" name="user_address" type="text" placeholder="名前" required>
										</div>
									</div>
								</div>
								<div class="row">
										<div class="input-field col s10 offset-s1 mb-3">
											<div class="row">
											<p class="col">住所</p>
											<input class="col" value="" name="user_address" type="text" placeholder="住所" required>
										</div>
										</div>
								</div>
								<div class="row">
									<div class="input-field col s10 offset-s1 mb-3">
										<div class="row">
											<p class="col">パスワード</p>
											<input class="col" value="" name="user_address" type="text" placeholder="パスワード" required>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="input-field col s10 offset-s1 mb-3">
										<div class="row">
											<p class="col">パスワード（確認）</p>
											<input class="col" value="" name="user_address" type="text" placeholder="パスワード（確認）" required>
										</div>
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


	<footer class="fixed-bottom bg-light">
	    <div class="container text-center">
	      	<p>Made by ikeda</p>
	    </div>
	</footer>

</body>
</html>