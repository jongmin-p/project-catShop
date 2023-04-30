<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="bootstrap/assets/css/bootstrap.min.css">
<style>
	.btn{
		float:right;
	}
</style>
</head>
<body>
	<!-- Section-->
	<tiles:insertAttribute name="body">
	</tiles:insertAttribute>
</body>
</html>