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


<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<script src="../resources/moment.js"></script>


<style>
.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

.title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
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
				<li class="nav-item"><a class="nav-link" href="/team/list">팀</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/matches/registMatch">경기</a></li>
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

	<div class="container">
		<form method="post" role="form" onsubmit="return checks()">
			<label>팀 이름</label> <input style="width: 30%" class="form-control"
				type="text" name="home" id="home" value="${login.teamname }"
				readonly>
			<label>작성자</label> <input style="width: 30%" class="form-control"
				type="text" name="writer" id="writer" value="${login.uid }"
				readonly>
			<hr>
			<label>종목</label>
			<input style="width: 30%" class="form-control"
				name="event" id="event" value="풋살" readonly>
			<label>경기장</label> <input style="width: 50%" class="form-control"
				type="text" name="stadium" id="stadium">

			<!-- 		dd -->
			<div class="container">
				<div class="row">
					<div class="col"></div>
					<div class="container">
						<div class="map_wrap" style="width: 100%">
							<div id="map" style="width:; height: 300px; margin: 10px"></div>
							<div class="hAddr">
								<span class="title">지도중심기준 행정동 주소</span> <span id="centerAddr"></span>
							</div>
						</div>
					</div>
					<div class="col"></div>
				</div>
			</div>
			<!-- 		dd -->

			<hr>
			<label>경기 날짜</label> <input style="width: 50%; text-align: right"
				class="form-control" type="text" id="date" value="" readonly>
			<label>시작 시간</label> <input style="width: 50%; text-align: right"
				class="form-control" id="time" type="text" class="timepicker"
				> <label>경기 시간</label> <select style="width: 30%"
				id="add" class="form-control">
				<option value="1">1시간</option>
				<option value="2">2시간</option>
			</select>
			<hr>

			<input type="hidden" name="starttime" id="start"> <input
				type="hidden" name="endtime" id="end">
			<button type="submit" id="submit" class="btn btn-primary">Regist</button>
			<!-- 		<button id="goList" class="btn btn-primary">List</button> -->
		</form>
	</div>

	<!-- 	footer -->
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<p>Football IN</p>
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
		startTime = moment(startTime).format("YYYY-MM-DD HH:mm:ss");
		endTime = moment(startTime).add($('#add').val(), "hours");
		endTime = moment(endTime).format("YYYY-MM-DD HH:mm:ss");
		
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

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=76ec245ae78ba3c1aed7f49eae8eadc0&libraries=services"></script>
<script>
		var mapContainer = document.getElementById('map');
		var mapOptions = {
			center: new daum.maps.LatLng(37.5642135,  127.0016985),
			level:9
		};

		var map = new daum.maps.Map(mapContainer, mapOptions); //지도 생성
		
		//지도 줌 컨트롤러 표시
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();

		var marker = new daum.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		    infowindow = new daum.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
		
		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);

		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		daum.maps.event.addListener(map, 'idle', function() {
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});

		function searchAddrFromCoords(coords, callback) {
		    // 좌표로 행정동 주소 정보를 요청합니다
		    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
		}
		
		function searchDetailAddrFromCoords(coords, callback) {
		    // 좌표로 법정동 상세 주소 정보를 요청합니다
		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
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
		
		// 장소 검색 객체를 생성합니다
		var ps = new daum.maps.services.Places(); 
		
		$('document').ready(function(){
			
			// 키워드로 장소를 검색합니다
			ps.keywordSearch('풋살장', placesSearchCB);
			ps.keywordSearch('풋살', placesSearchCB);
			ps.keywordSearch('실내 풋살', placesSearchCB); 
			ps.keywordSearch('실내 축구', placesSearchCB); 
			ps.keywordSearch('실내 구장', placesSearchCB); 
			ps.keywordSearch('공원 풋살', placesSearchCB); 
			ps.keywordSearch('풋살 구장', placesSearchCB); 
			ps.keywordSearch('풋살 경기', placesSearchCB); 

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
			    	
			    	searchDetailAddrFromCoords(marker.getPosition(), function(result, status) {
		 		        if (status === daum.maps.services.Status.OK) {
		 		            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
		 		            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
				            
		 		            var content = '<div class="bAddr">' +
		 		                            '<span class="title">' + place.place_name + '</span>' + 
		 		                            detailAddr + 
		 		                        '</div>';
							
		 		            $('#stadium').attr("value", place.place_name);
		 		                        
		 		            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
		 		            infowindow.setContent(content);
		 		            infowindow.open(map, marker);
		 		        }   
		 		    });
			    });
			}
		});
	</script>