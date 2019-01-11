<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>購入画面</title>
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
			<h5 class="text-center col s12 light m-5">カートアイテム</h5>
		</div>

		<table class="table mb-0">
			<thead>
				<tr>
					<th></th>
					<th scope="col">商品名</th>
					<th scope="col">単価</th>
					<th scope="col">小計</th>
					</tr>
			</thead>
			<tbody>
				<tr>
				<th scope="row">1</th>
				<td>テーブルのセル</td>
				<td>テーブルのセル</td>
				<td>テーブルのセル</td>
			    </tr>
			</tbody>
	  	</table>
		<div class="row">
			<div class="col-sm"></div>
			<button class="btn-primary rounded-pill col-sm m-5">購入確認</button>
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