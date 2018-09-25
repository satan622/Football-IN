<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Board</title>
<link rel="stylesheet" href="../resources/4/lux/bootstrap.css"
	media="screen">
<link rel="stylesheet" href="../resources/_assets/css/custom.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- handlebars -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary">
		<a class="navbar-brand" href="/">Football In</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor01" aria-controls="navbarColor01"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarColor01">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="#">선수</a></li>
				<li class="nav-item"><a class="nav-link" href="#">팀</a></li>
				<li class="nav-item"><a class="nav-link" href="#">경기</a></li>
				<li class="nav-item"><a class="nav-link" href="#">경기장</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="/sboard/list">게시판</a></li>
			</ul>
		</div>
	</nav>
	<!-- 	header -->
	<div class="jumbotron text-center">
		<h1>board</h1>
	</div>
	<!-- 	body -->
	<div class="container">
		<form role="form" method="post">
			<input type="hidden" name="bno" value="${boardVO.bno }">
			<!-- 페이지 정보 유지로 추가 된 부분  -->
			<input type="hidden" name="page" value="${cri.page }"> <input
				type="hidden" name="perPageNum" value="${cri.perPageNum }">
			<!-- 검색 정보 유지로 추가 된 부분 -->
			<input type="hidden" name="searchType" value="${cri.searchType }">
			<input type="hidden" name="keyword" value="${cri.keyword }">
		</form>

		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputEmail">Bno</label> <input type="text"
					name="bno" class="form-control" value="${boardVO.bno }"
					readonly="readonly">
			</div>
			<div class="form-group">
				<label for="exampleInputEmail">Title</label> <input type="text"
					name="title" class="form-control" value="${boardVO.title }"
					readonly="readonly">
			</div>
			<div class="form-group">
				<label for="exampleInputWriter">Writer</label> <input type="text"
					name="writer" class="form-control" value="${boardVO.writer }"
					readonly="readonly">
			</div>
			<div class="form-group">
				<label for="exampleInputContent">Content</label>
				<textarea class="form-control" name="content" rows="5"
					readonly="readonly">${boardVO.content }</textarea>
			</div>
		</div>
		<div class="div-footer">
			<button type="submit" class="btn btn-success modifyBtn">Modify</button>
			<button type="submit" class="btn btn-danger removeBtn">Remove</button>
			<button type="submit" class="btn btn-warning goListBtn">List</button>
		</div>
		<hr>
		<!-- 	reply -->
		<div class="row">
			<div class="container">
				<div class="box box-success">
					<div class="box-header">
						<h3 class="box-title">NEW REPLY</h3>
					</div>

					<div class="box-body">
						<label for="newReplyWriter">Replyer</label> <input
							class="form-control" type="text" placeholder="NAME"
							id="newReplyWriter"> <label for="newReplyText">Text</label>
						<input class="form-control" type="text"
							placeholder="ENTER COMMENT" id="newReplyText">
					</div>

					<div class="box-footer">
						<div class="container">
							<button type="submit" class="btn btn-primary btn-right-bottom"
								id="replyAddBtn">ADD REPLY</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr>
		
		<!-- timeline -->
		<ul class="timeline list-group">
			<!-- timeline time label	 -->
			<li class="time-label list-group-item d-flex justify-content-between" id="repliesDiv">Replies List</li>
		</ul>
		
		<!-- 댓글 페이지 -->
		<div class="container">
			<div class="row">
				<div class="col"></div>
				
				<ul class="pagination pagination-sm" style="align: center">
				
				</ul>
				<div class="col"></div>
			</div>
		</div>
		
	</div>


	<!-- 	footer -->
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>Football IN</p>
	</div>

</body>
</html>

<!-- modal -->
<div id="modifyModal" class="modal fade" role="dialog">
	<div class="modal-dialog" role="document">
		<!-- modal content -->
		<div class="modal-content">
			<div class="modal-header">
				<h5>Modify reply</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
			</div>
			<div class="modal-body" data-rno>
				<p><input type="text" id="replytext" class="form-control"></p>
			</div>
			<div class="modal-footer">
        		<button type="button" id="replyModBtn" class="btn btn-primary">Save changes</button>
       			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      		</div>
		</div>
	</div>
</div>



<script id="template" type="text/x-handlebars-template">
	{{#each .}}
		<li class="replyLi list-group-item d-flex justify-content-between" data-rno={{rno}}>
			<div>{{prettifyDate regdate}}</div> {{replyer}} : {{replytext}}
			<div></div>
			<div class="timeline-footer">
				<a class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#modifyModal">Modify</a>
				<a class="btn btn-outline-secondary btn-sm" data-toggle="modal">Remove</a>
			</div>
		</li>
	{{/each}}
</script>

<!-- modal 처리 -->
<script type="text/javascript">
	var rno;
	
	$(".timeline").on("click", ".replyLi", function(event){
		var reply = $(this);
				
		$("#replytext").val(reply.find('.timeline-body').text());
		rno = reply.attr("data-rno");
	});
	
	$("#replyModBtn").on("click", function(){
		var replytext = $("#replytext").val();
		
		$.ajax({
			type: 'put',
			url: '/replies/' + rno,
			headers: {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data: JSON.stringify({
				replytext: replytext
			}),
			dataType: 'text',
			success: function(result){
				console.log("result; " + result);
				if(result == 'success'){
					alert('댓글이 수정되었습니다.');
					getPage("/replies/" + bno + "/" + replyPage);
				}
			}
		});
	});
	
</script>

<!-- 댓글 -->
<script type="text/javascript">
	Handlebars.registerHelper("prettifyDate", function(timeValue){
		var dateObj =  new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year +"/" + month + "/" + date;
	});
	
	//댓글 출력 함수
	var printData = function(replyArr, target, templateObject){
		var template = Handlebars.compile(templateObject.html());
		
		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);
	}
	
	var bno = ${boardVO.bno};
	var replyPage = 1;
	
	function getPage(pageInfo){
		$.getJSON(pageInfo, function(data){
			printData(data.list, $("#repliesDiv"), $('#template'));
			printPaging(data.pageMaker, $(".pagination"));
			
			$("#modifyModal").modal('hide');
		});
	}
	
	//페이지 그리기 함수
	var printPaging = function(pageMaker, target){
		var str = "";
		
		if(pageMaker.prev){
			str += "<li class='page-item disabled'><a class='page-link' href='" + (pageMaker.startPage - 1) + "'> << </a></li>";
		}
		
		for(var i=pageMaker.startPage, len=pageMaker.endPage; i<=len; i++){
			var strClass = pageMaker.cri.page == i ? 'class=active':'';
			str += "<li " + strClass + "><a class='page-link' href='" + i + "'>" + i + "</a></li>";
		}
		
		if(pageMaker.next){
			str += "<li class='page-item'><a class='page-link' href='" + (pageMaker.endPage + 1) + "'> >> </a></li>";
		}
		
		target.html(str);
	}
	
	//댓글 목록 보이기
	$(document).ready(function(){
		if ($(".timeline li").length > 1) {
			return;
		}
		getPage("/replies/" + bno + "/1");
	});
	
	//페이지 클릭 이벤트
	$(".pagination").on("click", "li a", function(event){
		event.preventDefault();
		replyPage = $(this).attr("href");
		getPage("/replies/" + bno + "/" + replyPage);
	});
	
	
	//댓글 등록
	$("#replyAddBtn").on("click", function(){
		var replyerObj = $("#newReplyWriter");
		var replytextObj = $("#newReplyText");
		var replyer = replyerObj.val();
		var replytext = replytextObj.val();
		
		$.ajax({
			type: 'post',
			url: '/replies/',
			headers: {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType: 'text',
			data: JSON.stringify({
				bno: bno,
				replyer: replyer,
				replytext: replytext
			}),
			success: function(result){
				console.log("result: " + result);
				
				if(result == 'success'){
					alert("등록되었습니다.");
					replyPage = 1;
					getPage("/replies/" + bno + "/" + replyPage);
					replyerObj.val("");
					replytextObj.val("");
				}
			}
		});
	});
	
	
	
</script>


<!-- 게시글 수정, 삭제, 게시글 목록 버튼 처리 -->
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[role='form']");

		$(".modifyBtn").on("click", function() {
			formObj.attr("action", "/sboard/modifyPage");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$(".removeBtn").on("click", function() {
			formObj.attr("action", "/sboard/removePage");
			formObj.submit();
		});

		$(".goListBtn").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/sboard/list");
			formObj.submit();
		});
	});
</script>