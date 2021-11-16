<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<link href='https://fonts.googleapis.com/css?family=Roboto:400,700'
	rel='stylesheet'>

<script>
	$(document).ready(function() {

		(function($) {

			$('#header__icon').click(function(e) {
				e.preventDefault();
				$('body').toggleClass('with--sidebar');
			});

			$('#site-cache').click(function(e) {
				$('body').removeClass('with--sidebar');
			});

		})(jQuery);

	});
</script>
</head>
<body>

	<header class="header">

		<a href="#" class="header__icon" id="header__icon"><img
			src="${contextPath}/resources/image/baroip_main_logo.png"
			alt="바로입 아이콘"></a> <a href="#" class="header__logo">바로입</a>

		<nav class="menu">
			<a href="#">농산물</a> <a href="#">수산물</a> <a href="#">축산물</a>
		</nav>

	</header>

</body>
</html>