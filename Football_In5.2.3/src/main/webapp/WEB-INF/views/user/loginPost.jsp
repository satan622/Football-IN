<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>축구인들을 위한 공간 Football IN</title>
</head>
<body>
	<c:if test="${not empty login }">
	<script type="text/javascript">
		self.location = "/";
	</script>
	</c:if>
	<c:if test="${empty login }">
	<script type="text/javascript">
		alert("회원 정보를 확인하세요")
		history.back();
	</script>
	</c:if>
</body>
</html>