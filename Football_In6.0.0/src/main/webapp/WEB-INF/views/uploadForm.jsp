<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
img {
	width: 100px;
	height: 100px;
	background-color: gray;
}
</style>
</head>
<body>
	<img id="profileImg" src="">
	<form method="post" enctype="multipart/form-data">
		<input type="file" name="file" id="input_img"> <input
			type="submit">
	</form>

</body>
</html>

<script>
	// 	$(document).ready(function() {
	// 		$("#profileImg").click(function() {
	// 			$("#input_img").click();
	// 		})
	// 	})
</script>

<script>
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
				$("#profileImg").attr("src", e.target.result);
				$("#profileImg").css("height", "width")
			}
			reader.readAsDataURL(f);
		});

		var file = files[0]
		console.log(file)

		var formData = new FormData();

		formData.append("file", file);
		
		if(file.type.match("image.*")){
			$.ajax({
				url : '/uploadAjax',
				data : formData,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					alert("프로필 이미지가 변경 되었습니다.");
				}
			})
		}
		
	}
</script>
