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

<script src="../resources/moment.js"></script>
	
 <style>
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
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
				<li class="nav-item"><a class="nav-link"
					href="/team/list">팀</a></li>
				<li class="nav-item"><a class="nav-link active" href="/matches/list">경기</a></li>
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

	<!-- 	header -->
	<div class="jumbotron text-center">
		<h1>Match</h1>
	</div>
	<!-- 	body -->
	<div class="container">
		<div class="row">
			<div class="" style="margin: 10px">
				<h2 style="text-align:center">Home</h2>
				<div class="card mb-3" style="text-align: center">
					<h3 class="card-header">${home.teamname }</h3>
					<div class="card-body">
						<c:if test="${not empty home.emblem }">
							<img
								style="height: 300px; width: 300px; display: block; border-radius: 50%;"
								id="emblem" src="/displayFile?fileName=${home.emblem }"
								alt="Card image">
						</c:if>
						<c:if test="${empty home.emblem }">
							<img
								style="height: 300px; width: 300px; display: block; border-radius: 50%;"
								id="emblem">
						</c:if>
					</div>
					<div class="card-body">
						<h5 class="card-title">지역: ${home.location}</h5>
						<h5 class="card-title">인원: ${home.people}</h5>
						<h5 class="card-title">
							창단일:
							<fmt:formatDate pattern="yyyy.MM.dd" value="${home.regdate }" />
						</h5>
						<h5 class="card-title">관리자: ${home.mid }</h5>
					</div>
				</div>
			</div>
			
			
			
			<div class="col">
				<div style="margin-top:35%; text-align:center" >
					<div>
						<c:if test="${matchVO.hscore != -1 }"><h1>${matchVO.hscore } : ${matchVO.ascore }</h1></c:if>
					</div>
					<div id="end"></div>
					<div id="continue"></div>
				</div>
			</div>
			
			
			<div class="" style="margin: 10px">
				<h2 style="text-align:center">Away</h2>
				<div class="card mb-3" style="text-align: center">
					
					<h3 class="card-header">${away.teamname }<c:if test="${empty away }">Empty</c:if></h3>
					<div class="card-body">
						<c:if test="${not empty away.emblem }">
							<img
								style="height: 300px; width: 300px; display: block; border-radius: 50%;"
								id="emblem" src="/displayFile?fileName=${away.emblem }"
								alt="Card image">
						</c:if>
						<c:if test="${empty away.emblem }">
							<img
								style="height: 300px; width: 300px; display: block; border-radius: 50%;"
								id="emblem">
						</c:if>
						<c:if test="${not empty login && empty away && login.uid != matchVO.writer && login.manager == true}">
							<div>
								<form method="post" role="form">
									<input type="hidden" name="teamname" value="${login.teamname }">
									<input type="hidden" name="mno" value="${matchVO.mno }">
									<button type="submit" class="btn btn-primary btn-lg" id="match">경기 신청</button>
								</form>
							</div>
						</c:if>
					</div>
					
					<c:if test="${not empty away }">
					<div class="card-body">
						<h5 class="card-title">지역: ${away.location}</h5>
						<h5 class="card-title">인원: ${away.people}</h5>
						<h5 class="card-title">
							창단일:
							<fmt:formatDate pattern="yyyy.MM.dd" value="${away.regdate }" />
						</h5>
						<h5 class="card-title">관리자: ${away.mid }</h5>
						</div>
					</c:if>
				</div>
			</div>
		</div>
		
		<hr>
		<div style="text-align: center" >
			<h2>Match Info</h2>
			<hr>
			<h4><fmt:formatDate pattern="yyyy-MM-dd" value="${matchVO.starttime }"/></h4>
			<h4><fmt:formatDate pattern="HH:mm" value="${matchVO.starttime }"/>~<fmt:formatDate pattern="HH:mm" value="${matchVO.endtime }"/></h4>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col">
				<div><h3>${matchVO.stadium }</h3></div>
				<div class="map_wrap" style="width:100%">
					<div id="map" style="width:;height:300px;margin:10px"></div>
					<div class="hAddr">
        				<span class="title">지도중심기준 행정동 주소</span>
        				<span id="centerAddr"></span>
    				</div>
				</div>
			</div>
		</div>
		
		<c:if test="${matchVO.writer == login.uid && matchVO.hscore == -1 && not empty away}">
			<div id="input" style="text-align:center">
			</div>
		</c:if>
		
		
		
		<hr>
		<div style="text-align:center"><button type="submit" class="btn btn-outline-secondary goListBtn" style="margin:50px">List</button></div> 
	</div>	
	
	
	<!-- 	footer -->
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>Football IN</p>
	</div>

</body>
</html>


<!-- modal -->
<div id="scoreModal" class="modal fade" role="dialog">
	<div class="modal-dialog" role="document">
		<!-- modal content -->
		<div class="modal-content">
			<div class="modal-header">
				<h5>Input Score</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
			</div>
			<div class="modal-body" id="data" style="text-align:center" data-mno>
				<small>Home</small>
				<input type="text" name="hscore" id="hscore" style="width:10%; text-align:center"> : <input type="text" name="ascore" id="ascore" style="width:10%; text-align:center">
				<small>Away</small>
			</div>
			<div class="modal-footer">
        		<button type="submit" id="saveScore" class="btn btn-primary">Save</button>
       			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      		</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	var mno = '${matchVO.mno}';
	
	$("#saveScore").on("click", function(){
		
		if($("#hscore").val() < 0 || $("#hscore").val() == ""){
			alert('잘못된 입력 값');
			$("#hscore").focus();
			return false;
		}
		if($("#ascore").val() < 0 || $("#ascore").val() == ""){
			alert('잘못된 입력 값');
			$("#ascore").focus();
			return false;
		}
		
		
		var hscore = $("#hscore").val();
		var ascore = $("#ascore").val();
		
		
		$.ajax({
			type: 'put',
			url: '/matches/score/' + mno,
			headers: {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data: JSON.stringify({
				hscore: hscore,
				ascore: ascore
			}),
			dataType: 'text',
			success: function(result){
				console.log("result; " + result);
				if(result == 'success'){
					alert("스코어가 입력되었습니다.");
					location.reload();
				}
			}
		});
	});
	
	
</script>



<script type="text/javascript">
		var startgame = moment('${matchVO.starttime}').isBefore(new Date());
		var endgame = moment('${matchVO.endtime}').isBefore(new Date());
		
		
		var end = "";
		var con = "";
		
		var input = "";
		
		if(!startgame){
			end = "";
			con = '<div class="btn btn-success btn-lg disabled" style="margin:10px">진행중</div>';
		}
		else if(endgame){
			end = '<div class="btn btn-danger btn-lg disabled" style="margin:10px">경기 종료</div>';
			input = '<button id="inputScore" class="btn btn-info btn-lg" data-toggle="modal" data-target="#scoreModal">Input Score</button>' 
			$('#match').remove();
			con = "";
		}
		
		$('#input').html(input);
		$('#end').html(end);
		$('#continue').html(con);
		
	
</script>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=76ec245ae78ba3c1aed7f49eae8eadc0&libraries=services"></script>

<script>    
//마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places(); 


//현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
searchAddrFromCoords(map.getCenter(), displayCenterInfo);

// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
daum.maps.event.addListener(map, 'idle', function() {
	searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});

function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
    if (status === daum.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');
        
        for(var i = 0; i < result.length; i++) {
	    	// 행정동의 region_type 값은 'H' 이므로
	        if (result[i].region_type === 'H') {
	        	infoDiv.innerHTML = result[i].address_name;
	            break;
	        }
	    }
	}    
}


// 키워드로 장소를 검색합니다
ps.keywordSearch('${matchVO.stadium}', placesSearchCB); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new daum.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new daum.maps.Marker({
        map: map,
        position: new daum.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}
</script>

<script type="text/javascript">
$(document).ready(function() {
	$(".goListBtn").on("click", function() {
		self.location = "/matches/list";
	});
});


</script>




