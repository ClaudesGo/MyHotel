<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.*,java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="connection.ConexaoFactory"%>
<%@ page import="br.com.start.myhotel.model.Pessoa"%>
<%@ page import="br.com.start.myhotel.model.Cliente"%>
<%@ page import="dao.FuncionarioDao"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<title>MyHotel - Gerenciar Clientes</title>

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
<link
	href="<%=request.getContextPath()%>/resources/css/dataTables.bootstrap.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/dropzone.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/sweetalert.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/resources/css/bootstrap-select.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/style.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/css/themes/all-themes.css"
	rel="stylesheet" />
</head>

<body class="theme-red">
	<!-- Pre-carregameto -->
	<div class="page-loader-wrapper">
		<div class="loader">
			<div class="preloader">
				<div class="spinner-layer pl-red">
					<div class="circle-clipper left">
						<div class="circle"></div>
					</div>
					<div class="circle-clipper right">
						<div class="circle"></div>
					</div>
				</div>
			</div>
			<p>Aguarde...</p>
		</div>
	</div>
	<!-- #FIM# pre-carregamento -->
	<!-- Overlay -->
	<div class="overlay"></div>
	<!-- #FIM# Overlay -->
	<!-- Barra de pesquisa -->
	<div class="search-bar">
		<div class="search-icon">
			<i class="material-icons">search</i>
		</div>
		<input type="text" placeholder="O QUE DESEJA?">
		<div class="close-search">
			<i class="material-icons">close</i>
		</div>
	</div>
	<!-- #FIM# Barra de pesquisa -->
	<!-- Top Bar -->
	<nav class="navbar">
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="javascript:void(0);" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar-collapse"
					aria-expanded="false"></a> <a href="javascript:void(0);"
					class="bars"></a> <a class="navbar-brand" href="index.html">MyHotel
					- Gerencie seu negócio!</a>
			</div>
			<div class="collapse navbar-collapse" id="navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<!-- Busca -->
					<li><a href="javascript:void(0);" class="js-search"
						data-close="true"><i class="material-icons">search</i></a></li>
					<!-- #FIM# Busca -->
				</ul>
			</div>
		</div>
	</nav>
	<!-- #Top Bar -->
	<section>
		<!-- Sidebar esquerda -->
		<aside id="leftsidebar" class="sidebar">
			<!-- User Info -->
			<div class="user-info">
				<div class="image">
					<img src="<%=request.getContextPath()%>/resources/images/user.png"
						width="48" height="48" alt="User" />
				</div>
				<div class="info-container">
					<div class="name" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">Saulo Lessa</div>
					<div class="email">exemplo@exemplo.com</div>
					<div class="btn-group user-helper-dropdown">
						<i class="material-icons" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="true">keyboard_arrow_down</i>
						<ul class="dropdown-menu pull-right">
							<li><a
								href="<%=request.getContextPath()%>/view/funcionario/perfil.jsp"><i
									class="material-icons">person</i>Perfil</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="<%=request.getContextPath()%>/view/index.jsp"><i
									class="material-icons">input</i>Sair</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- #User Info -->
			<!-- Menu -->
			<div class="menu">
				<ul class="list">
					<li class="header">GERENCIAR HOSPEDAGENS</li>
					<li><a href="painelfunc.jsp"> <i class="material-icons">home</i>
							<span>Início</span>
					</a></li>
					<li class="active"><a href="javascript:void(0);"
						class="menu-toggle"> <i class="material-icons">hotel</i> <span>Hospedagem</span>
					</a>
						<ul class="ml-menu">
							<li><a
								href="<%=request.getContextPath()%>/view/funcionario/gerenciarclientes.jsp">
									<span>Clientes</span>
							</a></li>
							<li class="active"><a href="Javascript:void(0);"> <span>Reservas</span>
							</a></li>
						</ul></li>
					<li class="header">GERENCIAR HOSPEDAGENS</li>
				</ul>
			</div>
			<!-- #Menu -->
			<!-- Rodap� -->
			<div class="legal">
				<div class="copyright">
					&copy; 2018 <a href="javascript:void(0);">HyHotel</a>.
				</div>
				<div class="version">
					<b>Versão: </b> 1.0.0
				</div>
			</div>
			<!-- #Rodap� -->
		</aside>

	</section>

	<section class="content">
		<div class="container-fluid">

			<!-- Advanced Select -->

			<!-- #END# Advanced Select -->

			<!-- Tabela de usu�rios -->
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="header">
							<h2>LISTAGEM DE TODAS AS RESERVAS</h2>
							<ul class="header-dropdown">
								<button type="button"
									class="btn btn-primary waves-effect m-r-20" data-toggle="modal"
									data-target="#adicionar">ADICIONAR RESERVA</button>
							</ul>
						</div>
						<div class="body">
							<div class="table-responsive">
								<table
									class="table table-bordered table-striped table-hover js-basic-example dataTable">
									<thead>
										<tr>
											<th>Hóspede</th>
											<th>CPF</th>
											<th>Telefone</th>
											<th>Entrada</th>
											<th>Saída</th>
											<th>Serviço</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>Hóspede</th>
											<th>CPF</th>
											<th>Telefone</th>
											<th>Entrada</th>
											<th>Saída</th>
											<th>Serviço</th>
										</tr>
									</tfoot>
									<tbody>
										<%
											FuncionarioDao dao = new FuncionarioDao();

											List<Cliente> lista = new ArrayList<Cliente>();

											for (Cliente cliente : lista) {
												System.out.println(lista);
										%>



										<tr>
											<td><%=cliente.getNome()%></td>
											<td><%=cliente.getCpf()%></td>
											<td><%=cliente.getEmail()%></td>

										</tr>

										<%
											}
										%>

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- #FIM# Tabela de usu�rios -->
		</div>
	</section>


	<div class="modal fade" id="adicionar" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="defaultModalLabel">NOVA RESERVA:</h4>
				</div>
				<div class="modal-body">

					<form id="form_advanced_validation" method="POST">
						<div class="form-group form-float">
							<div class="form-line">
								<input type="text" class="form-control" name="minmaxlength"
									maxlength="10" minlength="3" required> <label
									class="form-label">Número do quarto</label>
							</div>
							<div class="help-info">Min. 3, Max. 10 characters</div>
						</div>
						<div class="form-group form-float">
							<div class="form-line">
								<input type="text" class="form-control" name="minmaxvalue"
									min="10" max="200" required> <label class="form-label">Min/Max
									Value</label>
							</div>
							<div class="help-info">Min. Value: 10, Max. Value: 200</div>
						</div>
						<div class="form-group form-float">
							<div class="form-line">
								<input type="url" class="form-control" name="url" required>
								<label class="form-label">Url</label>
							</div>
							<div class="help-info">Starts with http://, https://,
								ftp:// etc</div>
						</div>
						<div class="form-group form-float">
							<div class="form-line">
								<input type="text" class="form-control" name="date" required>
								<label class="form-label">Date</label>
							</div>
							<div class="help-info">YYYY-MM-DD format</div>
						</div>
						<div class="form-group form-float">
							<div class="form-line">
								<input type="number" class="form-control" name="number" required>
								<label class="form-label">Number</label>
							</div>
							<div class="help-info">Numbers only</div>
						</div>
						<div class="form-group form-float">
							<div class="form-line">
								<input type="text" class="form-control" name="creditcard"
									pattern="[0-9]{13,16}" required> <label
									class="form-label">Credit Card</label>
							</div>
							<div class="help-info">Ex: 1234-5678-9012-3456</div>
						</div>

						<select class="form-control show-tick" data-live-search="true">
							<option>Hot Dog, Fries and a Soda</option>
							<option>Burger, Shake and a Smile</option>
							<option>Sugar, Spice and all things nice</option>
						</select>

						<div style="margin-top: 20px;"></div>
						<div class="modal-footer">
							<button class="btn btn-primary waves-effect" type="submit">CONFIRMAR</button>
							<button type="button" class="btn btn-default waves-effect"
								data-dismiss="modal">FECHAR</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>


	<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/bootstrap-select.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery.slimscroll.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/waves.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/bootstrap-colorpicker.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/dropzone.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery.steps.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery.validate.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery.inputmask.bundle.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/tabelas/jquery.dataTables.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/tabelas/dataTables.bootstrap.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/sweetalert.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/admin.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery-datatable.js"></script>
	<script 
		src="<%=request.getContextPath()%>/resources/js/modals.js"></script>
	<script 
		src="<%=request.getContextPath()%>/resources/js/dialogs.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/form-validation.js"></script>
	<script 
		src="<%=request.getContextPath()%>/resources/js/form-wizard.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/advanced-form-elements.js"></script>
	<script src="js/demo.js"></script>
</body>

</html>