<!DOCTYPE html>
<html>
<head>
<jsp:include page="/baselayout/head.html" />
<title>エラーメッセージ</title>
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />

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