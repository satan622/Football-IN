<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>축구인들을 위한 공간 Football IN</title>
<link rel="stylesheet" href="../resources/4/lux/bootstrap.css"
	media="screen">
<link rel="stylesheet" href="../resources/_assets/css/custom.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</head>
<body>
	<!-- navbar -->
	<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary">
		<a class="navbar-brand" href="/">Football In</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor01" aria-controls="navbarColor01"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarColor01">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="/user/list">선수</a></li>
				<li class="nav-item"><a class="nav-link active" href="/team/list">팀</a></li>
				<li class="nav-item"><a class="nav-link" href="#">경기</a></li>
				<li class="nav-item"><a class="nav-link" href="/map?type=">경기장</a></li>
				<li class="nav-item"><a class="nav-link" href="/sboard/list">게시판</a></li>
			</ul>
			<c:if test="${empty login }">
				<a class="btn btn-secondary" href="/user/login">로그인</a>
			</c:if>
			<c:if test="${not empty login }">
				<h5 style="color: white">User Name: ${login.uname }&nbsp;&nbsp;</h5>
				<a class="btn btn-secondary" href="/user/logout">로그아웃</a>
			</c:if>
		</div>
	</nav>

	<!-- header -->
	<div class="jumbotron text-center">
		<h1>Create Team</h1>
	</div>

	<div class="container">
		<form id="target" method="post" role="form">
			<div class="row">
				<div class="col"></div>
				<div class="">
					<div class="card mb-3">
						<h3 class="card-header">Input Team Info</h3>
						<div class="card-body">
							<h2 class="card-title">Team Emblem</h2>
						</div>
						<div class="card-body">
							<img
								style="height: 300px; width: 300px; display: block; border-radius: 50%;"
								id="emblem"
								src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22318%22%20height%3D%22180%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20318%20180%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_158bd1d28ef%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A16pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_158bd1d28ef%22%3E%3Crect%20width%3D%22318%22%20height%3D%22180%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22129.359375%22%20y%3D%2297.35%22%3EImage%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
								alt="Card image">
						</div>
						<div class="card-body">
							<div class="form-group">
								<label for="exampleInputFile">Input Image File</label>
								<input
									type="file" class="form-control-file" id="input_img"
									aria-describedby="fileHelp">
								
								<input type="hidden" id="filename" name="emblem" value="">
							</div>
						</div>
						<div class="card-footer text-muted"></div>
					</div>

				</div>
				<div class="col"></div>
			</div>
			

			<div class="box-body">
				<div class="form-group">
					<label for="exampleInputEmail">Team Name</label> <input type="text"
						id="teamname" name="teamname" class="form-control"
						placeholder="Enter your team name">
				</div>
				<div class="form-group">
					<label for="exampleInputContent">Team Location</label> <input
						id="location" type="text" class="form-control" name="location"
						placeholder="Enter your team location">
				</div>
			</div>
			<div class="form-group">
				<label for="exampleInputWriter">Manager ID</label><input
					type="text" name="mid" class="form-control" value="${login.uid }"
					readonly>
			</div>
			
			<div class="box-footer">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</form>
	</div>

	<!-- 	footer -->
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>Football IN</p>
	</div>

</body>
</html>

<script type="text/javascript">
var sel_file;

$(document).ready(function() {
	$("#input_img").on("change", fileChange);
});

function fileChange(e) {
	e.preventDefault();

	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);

	filesArr.forEach(function(f) {
		if (!f.type.match("image.*")) {
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}

		sel_file = f;

		var reader = new FileReader();
		reader.onload = function(e) {
			$("#emblem").attr("src", e.target.result);
			$("#emblem").css("height", "width");
		}
		reader.readAsDataURL(f);
	});

	var file = files[0];
	console.log(file);
	var formData = new FormData();

	formData.append("file", file);

	$.ajax({
		url : '/uploadAjax',
		data : formData,
		dataType : 'text',
		processData : false,
		contentType : false,
		type : 'POST',
		success : function(data) {
			console.log(data);
			alert("엠블럼 이미지가 변경 되었습니다.");
			$("#filename").attr("value", data);
		}
	})
	
}	
</script>

<script type="text/javascript">
	$("#target").submit(function() {
		var uid = '${login.uid}';	
		var tname = $('#teamname').val();
		var uname = '${login.uname}';
		var location = $('#location').val();
		
		var upw = '${login.upw}';
		
		$.ajax({
			type : 'post',
			url : '/members/join',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				uid : uid,
				tname : tname,
				uname : uname,
				location : location,
				
				upw: upw
			}),
			success : function(result) {
				console.log(result);
				self.location = "/team/list";
			}
		});
	});
</script>