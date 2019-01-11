<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>管理者画面（ユーザー情報）</title>
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
			<h5 class="text-center col s12 light m-5">ユーザー情報（管理者用）</h5>
		</div>

		<div>
			<table class="table">
			  <caption>テーブルの表題</caption>
			  <thead>
			    <tr>
			      <th>ID</th>
			      <th scope="col">名前</th>
			      <th scope="col">住所</th>
			      <th scope="col">ログインID</th>
			      <th scope="col">メニュー</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <th scope="row">1</th>
			      <td>池田</td>
			      <td>東京</td>
			      <td>ikeda</td>
			      <td>
					<button type="button" class="btn btn-primary rounded-pill">詳細</button>
					<button type="button" class="btn btn-success rounded-pill">更新</button>
					<button type="button" class="btn btn-danger rounded-pill">削除</button>
			      </td>
			    </tr>
			  </tbody>
			</table>
		</div>
	</div>

	<footer class="fixed-bottom bg-light">
	    <div class="container text-center">
	      	<p>Made by ikeda</p>
	    </div>
	</footer>

</body>
</html>