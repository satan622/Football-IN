<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>축구인들을 위한 공간 Football IN</title>
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
	

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<script src="../resources/moment.js"></script>
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
				<li class="nav-item"><a class="nav-link" href="/team/list">팀</a></li>
				<li class="nav-item"><a class="nav-link" href="/matches/registMatch">경기</a></li>
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
	
	<div class="container">
		<form method="post" role="form" onsubmit="return checks()">
		<label>팀 이름</label>
		<input style="width:30%" class="form-control" type="text" name="home" id="home" value="${login.teamname }" readonly>
		<hr>
		<label>종목</label>		
		<select style="width:30%" class="form-control" name="event" id="event">
			<option value="축구">축구</option>
			<option value="풋살">풋살</option>
		</select>
		<label>경기장</label>
		<input style="width:50%" class="form-control" type="text" name="stadium" id="stadium">
		
		
		<hr>
		<label>경기 날짜</label>
		<input style="width:50%; text-align:right" class="form-control" type="text" id="date" value="" readonly>
		<label>시작 시간</label>
		<input style="width:50%; text-align:right" class="form-control" id="time" type="text" class="timepicker" readonly>
		
		<label>경기 시간</label>
		<select style="width:30%" id="add" class="form-control">
			<option value="1">1시간</option>
			<option value="2">2시간</option>
		</select>
		<hr>
		
		<input type="hidden" name="starttime" id="start">
		<input type="hidden" name="endtime" id="end">
		<button type="submit" id="submit" class="btn btn-primary">Regist</button>
		<button id="goList" class="btn btn-primary">List</button>
	</form>
	
	</div>


	
	
	
</body>
</html>

<script type="text/javascript">
	var date = "";
	var time = "";
	var startTime = "";
	var endTime = "";
	
	$('#date').on('change', function(){
		date = $("#date").datepicker("getDate");
		date = moment(date).format("YYYY-MM-DD");
	});
	
	$('#submit').on('click', function(){
		time = $('#time').timepicker("getTime");
		time = moment(time).format("HH:mm");
		startTime = date + " " + time;
		startTime = moment(startTime).format("YYYY-MM-DD HH:mm");
		endTime = moment(startTime).add($('#add').val(), "hours");
		endTime = moment(endTime).format("YYYY-MM-DD HH:mm");
		
		alert(startTime);
		alert(endTime);
		
		$('#start').attr("value", startTime);
		$('#end').attr("value", endTime);
	});
	
	
	
</script>

<script type="text/javascript">
$('#time').timepicker({
    timeFormat: 'HH:mm',
    interval: 60,
    minTime: '08',
    maxTime: '11:00pm',
    defaultTime: '08',
    startTime: '00:00',
    dynamic: false,
    dropdown: true,
    scrollbar: true
});
</script>

<script type="text/javascript">
$(function() {
    $("#date").datepicker({
         changeMonth: true, 
         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
         minDate: 0, 
         maxDate: "+2M",
         dateFormat: "yy-mm-dd",
  });
});
</script>

<script type="text/javascript">
function checks(){
	if($("#home").val() == ""){
   		alert("팀 입력필요");
   		$("#home").focus();
		return false;
	}
	
	if($("#date").val() == ""){
   		alert("날짜 입력바람");
   		$("#date").focus();
		return false;
	}
	
	if($("#stadium").val() == ""){
   		alert("경기장 선택");
   		$("#stadium").focus();
		return false;
	}
	return true;
}
</script>