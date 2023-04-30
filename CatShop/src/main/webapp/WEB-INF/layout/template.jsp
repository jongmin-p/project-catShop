<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
<!-- 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">	 -->
    <title>CATSHOP</title>


    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="bootstrap/assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="bootstrap/assets/css/font-awesome.css">

    <link rel="stylesheet" href="bootstrap/assets/css/templatemo-hexashop.css">

    <link rel="stylesheet" href="bootstrap/assets/css/owl-carousel.css">

    <link rel="stylesheet" href="bootstrap/assets/css/lightbox.css">
    
    <link rel="stylesheet" href="bootstrap/assets/css/productDetailQnA.css">
    


<!--

TemplateMo 571 Hexashop

https://templatemo.com/tm-571-hexashop

-->

    </head>
<body>
	<!-- Navigation-->
	<tiles:insertAttribute name="menu">
	</tiles:insertAttribute>

	<!-- Header-->
	<tiles:insertAttribute name="header">
	</tiles:insertAttribute>

	<!-- Section-->
	<tiles:insertAttribute name="body">
	</tiles:insertAttribute>

	<!-- Footer-->
	<tiles:insertAttribute name="footer">
	</tiles:insertAttribute>
	
	<!-- jQuery -->
    <script src="bootstrap/assets/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="bootstrap/assets/js/popper.js"></script>
    <script src="bootstrap/assets/js/bootstrap.min.js"></script>
<!--     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    <!-- Plugins -->
    <script src="bootstrap/assets/js/owl-carousel.js"></script>
    <script src="bootstrap/assets/js/accordions.js"></script>
    <script src="bootstrap/assets/js/datepicker.js"></script>
    <script src="bootstrap/assets/js/scrollreveal.min.js"></script>
    <script src="bootstrap/assets/js/waypoints.min.js"></script>
    <script src="bootstrap/assets/js/jquery.counterup.min.js"></script>
    <script src="bootstrap/assets/js/imgfix.min.js"></script> 
    <script src="bootstrap/assets/js/slick.js"></script> 
    <script src="bootstrap/assets/js/lightbox.js"></script> 
    <script src="bootstrap/assets/js/isotope.js"></script>
    <script src="bootstrap/assets/js/quantity.js"></script>
    
    <!-- Global Init -->
    <script src="bootstrap/assets/js/custom.js"></script>

    <script>

        $(function() {
            var selectedClass = "";
            $("p").click(function(){
            selectedClass = $(this).attr("data-rel");
            $("#portfolio").fadeTo(50, 0.1);
                $("#portfolio div").not("."+selectedClass).fadeOut();
            setTimeout(function() {
              $("."+selectedClass).fadeIn();
              $("#portfolio").fadeTo(50, 1);
            }, 500);
                
            });
        });

    </script>
    
    <!--  리뷰 부트스트랩 -->
    
   
</body>
</html>
