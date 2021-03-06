<!DOCTYPE html>
<html>
<head>
<jsp:include page="/baselayout/head.html" /><title>ユーザー情報更新</title>
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />

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