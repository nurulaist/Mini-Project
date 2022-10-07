<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
<link href="<c:url value="/resources/theme1/css/regis.css" />" rel="stylesheet">
<title>Login</title>
</head>
<body>
	<div class="container">
		<div class="forms">
			<div class="form login">
				<span class="title">Masuk</span>
				<c:if test="${success != null}">
					<div style="color: green; font-size: 20px;" role="alert">
						<c:out value="${success}" />
					</div>
				</c:if>
				<c:if test="${error != null}">
					<div style="color: green; font-size: 20px;" role="alert">
						<c:out value="${error}" />
					</div>
				</c:if>
				<f:form action="login" modelAttribute="person" method="post">
					<div class="input-field">
						<f:input type="text" path="username" placeholder="Masukkan username" required="true"></f:input>
						<i class="uil uil-user-circle"></i>
					</div>
					<div class="input-field">
						<f:input type="password" path="password" class="password" placeholder="Masukkan Password" required="true"></f:input>
							<i class="uil uil-lock icon"></i>
							<i class="uil uil-eye-slash showHidePw"></i>
					</div>

					<div class="input-field button">
                        <input type="submit" value="Masuk">
                    </div>
				</f:form>

				<div class="login-signup">
					<span class="text">Bukan member? 
					<a class="text signup-link" href='<c:url value="/register"></c:url>'>Buat Sekarang</a>
					</span>
				</div>
			</div>
		</div>
	</div>
	<script src="<c:url value="/resources/theme1/js/login.js" />"></script>
</body>
</html>