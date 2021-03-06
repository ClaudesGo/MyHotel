<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="br.com.start.myhotel.model.*"%>
<%@ page import="dao.*"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<title>MyHotel - Entrar</title>

<link rel="icon" href="favicon.ico" type="image/x-icon">

<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/resources/css/bootstrap.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/waves.css"
	rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/css/animate.css"
	rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/css/style.css"
	rel="stylesheet">
</head>

<body class="login-page">

	<%
		String mensagem = (String) request.getAttribute("mensagem");
	%>
	<div class="login-box">
		<div class="logo">
			<a href="javascript:void(0);">My<b>Hotel</b></a> <small>Start
				2018 - Material Design</small>
		</div>
		<div class="card">
			<div class="body">
				<form action="<%=request.getContextPath()%>/sistemaController"
					id="sign_in" method="POST">
					<div class="msg">Insira suas credenciais para iniciar a
						sessão.</div>
					<div class="input-group">
						<span class="input-group-addon"> <i class="material-icons">person</i>
						</span>
						<div class="form-line">
							<input type="email" class="form-control" name="email"
								placeholder="E-mail" required autofocus>
						</div>
						<%
							if (mensagem != null) {
						%>
						<p style="color: red;">
							<%=mensagem%>
						</p>
						<%
							}
						%>
					</div>
					<div class="input-group">
						<span class="input-group-addon"> <i class="material-icons">lock</i>
						</span>
						<div class="form-line">
							<input type="password" class="form-control" name="senha"
								placeholder="Senha" required>
						</div>
					</div>
					<div class="row">
						<input type="radio" name="tipo" id="op1" value="f"
							class="with-gap" required> <label for="op1">Conta Funcionário</label> <input
							type="radio" name="tipo" id="op2" value="a" class="with-gap" required>
						<label for="op2">Conta Administrador</label>
						<div style="margin-top:20px;"></div>
						<div class="col-xs-12">
							<button class="btn btn-block bg-pink waves-effect" type="submit">ENTRAR</button>
						</div>
					</div>
				</form>



			</div>
		</div>
	</div>


	<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>

	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>

	<script src="<%=request.getContextPath()%>/resources/js/waves.js"></script>

	<script src="<%=request.getContextPath()%>/resources/js/admin.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/login.js"></script>
</body>

</html>