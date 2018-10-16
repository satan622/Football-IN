<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta charset="UTF-8">
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
<style type="text/css">
	.page-bar {
		align-items: center;
		align-content: center;
	}
	.teamcard{
		height:400px;
		text-align:center;
	}
	#teamcreate{
		height:400px;
		text-align:center;
	}
</style>
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
				<li class="nav-item"><a class="nav-link" href="/matches/list">경기</a></li>
				<li class="nav-item"><a class="nav-link" href="/map?type=">경기장</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/sboard/list">게시판</a></li>
			</ul>
			<c:if test="${empty login }">
				<a class="btn btn-secondary" href="/user/login">로그인</a>
			</c:if>
			<c:if test="${not empty login }">
				<h5 style="color:white">User Name: ${login.uname }&nbsp;&nbsp;</h5>
				<a class="btn btn-secondary" href="/user/logout">로그아웃</a>
			</c:if>
		</div>
	</nav>
	
	<!-- header -->
	<div class="jumbotron text-center">
		<h1>Team List</h1>
	</div>
	<!-- body -->
	<div class="container">
		<nav class="navbar navbar-light bg-light">
			<select name="searchType" class="col-sm-2"
					id="exampleSelect1">
					<option value="o"
						<c:out value="${cri.searchType == null ? 'selected':'' }" />>---</option>
					<option value="t"
						<c:out value="${cri.searchType == 't' ? 'selected':'' }" />>Team Name</option>
					<option value="l"
						<c:out value="${cri.searchType == 'l' ? 'selected':'' }" />>Location</option>
					<option value="m"
						<c:out value="${cri.searchType == 'm' ? 'selected':'' }" />>Manager</option>
				</select>
				<input class="col-sm-6 form-inline" type="text" name="keyword" id="keywordInput" value="${cri.keyword }">
				<button class="form-inline btn btn-primary" id="searchBtn">Search</button>
		</nav>
		<div class="row">
			<ul style="margin:10px">
			<c:if test="${not empty login && empty login.teamname }">
				<li class="list-inline-item" style="margin:20px">
					<div id="teamcreate" class="card border-primary mb3">
						<h3 class="card-header" style="text-align:center">팀생성하기</h3>
						<div class="card-body">
							<img style="height: 200px; width: 200px; display: block; border-radius: 50%;" id="emblem"
							src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22318%22%20height%3D%22180%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20318%20180%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_158bd1d28ef%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A16pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_158bd1d28ef%22%3E%3Crect%20width%3D%22318%22%20height%3D%22180%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22129.359375%22%20y%3D%2297.35%22%3EImage%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E">
						</div>
						<div class="card-body">
							<h5 class="card-title">새로운 팀을 생성하세요</h5>
						</div>
					</div>
				</li>
			</c:if>	
			<c:forEach items="${list }" var="teamVO">
				<li class="list-inline-item" style="margin:20px"><a href="/team/readTeam${pageMaker.makeSearch(pageMaker.cri.page) }&teamname=${teamVO.teamname }">
					<div class="card mb3 teamcard">
						<h3 class="card-header">${teamVO.teamname }</h3>
						<div class="card-body">
							<c:if test="${not empty teamVO.emblem }">
								<img style="height: 200px; width: 200px; display: block; border-radius: 50%;" id="emblem" src="/displayFile?fileName=${teamVO.emblem }" alt="Card image">
							</c:if>
							<c:if test="${empty teamVO.emblem }">
								<img style="height: 200px; width: 200px; display: block; border-radius: 50%;" id="emblem" >
							</c:if>
						</div>
						<div class="card-body">
							<h5 class="card-title">지역: ${teamVO.location}</h5>
						</div>
					</div>
					</a>
				</li>
			</c:forEach>
			</ul>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col"></div>
			<ul class="pagination pagination-md">
				<c:if test="${pageMaker.prev }">
					<li class="page-item"><a class="page-link"
						href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
					<li class="page-item ${pageMaker.cri.page == idx ? 'active':'' }">
						<a href="list${pageMaker.makeSearch(idx) }" class="page-link">${idx }</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
					<li class="page-item"><a class="page-link"
						href="list${pageMaker.makeSearch(pageMaker.endPage - 1) } }">&raquo;</a></li>
				</c:if>
			</ul>
			<div class="col"></div>
		</div>
	</div>
	
	<!-- 	footer -->
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>Football IN</p>
	</div>

</body>
</html>


<script type="text/javascript">

	$(document).ready(function(){
		$('#searchBtn').on("click", function(event){
			self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
		});
		
		$('.card').on("mouseenter", function(){
			$(this).attr("class", "card text-white bg-primary mb3");
			$(this).attr("style", "height:400px; text-align:center; cursor:pointer");
		});
		
		$('#teamcreate').on("mouseleave", function(){
			$(this).attr("class", "card border-primary mb3");
		});
		$('.teamcard').on("mouseleave", function(){
			$(this).attr("class", "card mb3");
		});
		
		
		$('#teamcreate').on("click", function(){
			self.location = "/team/create";
		});
	});
	
	
</script>