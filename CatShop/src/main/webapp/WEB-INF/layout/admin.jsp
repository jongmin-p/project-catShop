<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>종합관리자페이지</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="adminBootstrap/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
    <!-- Navigation-->
    <!-- Header-->
	<tiles:insertAttribute name="adminheader">
	</tiles:insertAttribute>
	
	<tiles:insertAttribute name="adminmenu">
	</tiles:insertAttribute>

	<!-- Section-->
	<tiles:insertAttribute name="adminbody">
	</tiles:insertAttribute>

	<!-- Footer-->
	<tiles:insertAttribute name="adminfooter">
	</tiles:insertAttribute>
 
                
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="adminBootstrap/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<!--         <script src="adminBootstrap/js/datatables-simple-demo.js"></script> -->
    </body>
</html>
