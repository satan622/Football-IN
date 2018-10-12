<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<h2>Ajax Test Page</h2>
	
	<div>
		<div>
			REPLYER<input type="text" name="replyer" id="newReplyWriter">
		</div>
		<div>
			REPLY TEXT<input type="text" name="replytext" id="newReplyText">
		</div>
		<button id="replyAddBtn">ADD REPLY</button>
	</div>
	
	<ul id="replies"></ul>
	
	<ul class="pagination"></ul>
	
</body>
</html>

<script type="text/javascript">
	var bno = 62;
	
	getPageList(1);
	
	function getAllList(){
		$.getJSON("/replies/all/" + bno, function(data){
			var str = "";
			
			console.log(data.length);
			
			$(data).each(function(){
				str += "<li data-rno='" + this.rno + "' class='replyLi'>" + this.rno + ":" + this.replytext 
					+ "  <button>수정</button>" + "  <button>삭제</button></li>";
			});
			
			$("#replies").html(str);
		});
	}
	
	$("#replyAddBtn").on("click", function(){
		var replyer = $("#newReplyWriter").val();
		var replytext = $("#newReplyText").val();
		
		$.ajax({
			type: 'post',
			url: '/replies',
			headers: {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType: 'text',
			data: JSON.stringify({
				bno : bno,
				replyer : replyer,
				replytext : replytext
			}),	
			success: function(result){
				
				if(result == 'success'){
					alert("등록 되었습니다.")
					
					getPageList(1);
				}
			}
		});
	});
	
	function getPageList(page){ //함수 번호 입력받아 getJSON을 이용해서 가져온 데이터 처리
		$.getJSON("/replies/" + bno + "/" + page, function(data){
			
			console.log(data.list.length);
			
			var str = "";
			
			$(data.list).each(function(){
				str += "<li data-rno'" + this.rno + "' class='replyLi'>" + this.rno + ":" + this.replytext
					+ "  <button>수정</button>" + "  <button>삭제</button></li>";
			});
			
			$("#replies").html(str);
			printPaging(data.pageMaker);
		});
	}
	
	function printPaging(pageMaker){
		var str = "";
		
		if(pageMaker.prev){
			str += "<li><a href='" + (pageMaker.startPage - 1) + "'> << </a></li>";
		}
		
		for(var i=pageMaker.startPage, len=pageMaker.endPage; i<=len; i++){
			var strClass = pageMaker.cri.page == i ? 'class=active':'';
			str += "<li " + strClass + "><a href='" + i + "'>" + i + "</a></li>";
		}
		
		if(pageMaker.next){
			str += "<li><a href='" + (pageMaker.endPage + 1) + "'> >> </a></li>";
		}
		
		$(".pagination").html(str);
	}
	
	var replyPage = 1;
	
	$(".pagination").on("click", "li a", function(event){
		event.preventDefault();
		
		replyPage = $(this).attr("href");
		getPageList(replyPage);
	});
	
</script>