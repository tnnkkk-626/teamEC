<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="robots" content="noindex, nofollow" />
<link rel="stylesheet" href="./css/i1810a.css">
<script>
	setTimeout("location.href='HomeAction'",1000*3);
</script>
<title>決済完了画面</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="main-contents">
		<div id="page-name">
			<h1>決済完了画面</h1>
		</div>
		<div class="success">
			<div class="center"><h3>決済が完了しました</h3></div>
		</div>
	</div>
	<s:include value="footer.jsp" />
</body>
</html>