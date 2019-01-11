<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>商品の追加確認</title>
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
			<h5 class="text-center col s12 light m-5">商品の追加</h5>
		</div>
		<div class="row">
			<div class="section"></div>
			<div class="col-md-6 offset-md-3">
				<div class="card grey">
					<div class="card-body text-center">
						<form action="" method="POST">
								<div class="row">
									<div class="input-field col s10 offset-s1 mb-3">
										<input class="w-100" value="" name="user_name" type="text" placeholder="商品名" required>
									</div>
								</div>
								<div class="row">
									<div class="input-field col s10 offset-s1 mb-3">
										<textarea class="w-100" name="user_address" placeholder="商品詳細" required></textarea>
									</div>
								</div>
								<div class="row">
									<div class="input-field col s10 offset-s1 mb-3">
										<input value="${item.price}" name="price" type="text" placeholder="価格" required>
									</div>
								</div>
								<div class="row">
									<div class="input-field col s10 offset-s1 mb-3">
										<div class="custom-file">
	   										<input type="file" id="inputGroupFile01" class="custom-file-input" aria-describedby="inputGroupFileAddon01">
	   										<label class="custom-file-label" for="inputGroupFile01">ファイル選択...</label>
   										</div>
									</div>
								</div>
								<p class="">上記内容で追加してよろしいでしょうか?</p>
								<div class="row">
									<div class="col s2">
										<div class="brank"></div>
									</div>
									<div class="col s3">
										<p class="center-align">
											<button class="btn btn-primary rounded-pill btn-sm  col s8 offset-s2" type="submit" name="action">修正</button>
										</p>
									</div>
									<div class="col s2">
										<div class="brank"></div>
									</div>
									<div class="col s3">
										<p class="center-align">
											<button class="btn btn-primary rounded-pill btn-sm  col s8 offset-s2" type="submit" name="action">追加</button>
										</p>
									</div>
									<div class="col s2">
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