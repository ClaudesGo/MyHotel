<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.io.*,java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="connection.ConexaoFactory"%>
<%@ page import="br.com.start.myhotel.model.Pessoa"%>
<%@ page import="br.com.start.myhotel.model.Funcionario"%>
<%@ page import="dao.FuncionarioDao"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<title>MyHotel - Gerenciar Usu�rios</title>

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
<link href="<%=request.getContextPath()%>/resources/css/sweetalert.css"
	rel="stylesheet" />
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
					- Gerencie seu neg�cio!</a>
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
							<li><a href="perfil.html"><i class="material-icons">person</i>Perfil</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="login.html"><i class="material-icons">input</i>Sair</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- #User Info -->
			<!-- Menu -->
			<div class="menu">
				<ul class="list">
					<li class="header">GERENCIAR HOTEL</li>
					<li><a href="index.html"> <i class="material-icons">home</i>
							<span>In�cio</span>
					</a></li>
					<li><a href="javascript:void(0);" class="menu-toggle"> <i
							class="material-icons">hotel</i> <span>Hospedagem</span>
					</a>
						<ul class="ml-menu">
							<li><a href="javascript:void(0);"> <span>Quartos</span>
							</a></li>
							<li><a href="javascript:void(0);"> <span>Servi�os</span>
							</a></li>
						</ul></li>
					<li class="active"><a href="javascript:void(0);"> <i
							class="material-icons">person</i> <span>Usu�rios</span>
					</a></li>
					<li><a href="index.html"> <i class="material-icons">attach_money</i>
							<span>Faturamento</span>
					</a></li>
					<li class="header">GERENCIAR CLIENTES</li>
					<li><a href="javascript:void(0);" class="menu-toggle"> <i
							class="material-icons">people</i> <span>Clientes</span>
					</a>
						<ul class="ml-menu">
							<li><a href="pages/ui/alerts.html">Hospedados</a></li>
							<li><a href="pages/ui/animations.html">Hist�rico</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- #Menu -->
			<!-- Rodap� -->
			<div class="legal">
				<div class="copyright">
					&copy; 2018 <a href="javascript:void(0);">HyHotel</a>.
				</div>
				<div class="version">
					<b>Vers�o: </b> 1.0.0
				</div>
			</div>
			<!-- #Rodap� -->
		</aside>

	</section>

	<section class="content">
		<div class="container-fluid">

			<!-- Tabela de usu�rios -->
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="header">
							<h2>LISTAGEM DE USU�RIOS CADASTRADOS</h2>
							<ul class="header-dropdown">
								<button type="button"
									class="btn btn-primary waves-effect m-r-20" data-toggle="modal"
									data-target="#adicionar">ADICIONAR</button>
								<button type="button"
									class="btn btn-default waves-effect m-r-20" data-toggle="modal"
									data-target="#gerenciar">GERENCIAR</button>
							</ul>
						</div>
						<div class="body">
							<div class="table-responsive">
								<table
									class="table table-bordered table-striped table-hover js-basic-example dataTable">
									<thead>
										<tr>
											<th>Nome Completo</th>
											<th>CPF</th>
											<th>E-mail</th>
											<th>Cargo</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>Nome Completo</th>
											<th>CPF</th>
											<th>E-mail</th>
											<th>Cargo</th>
										</tr>
									</tfoot>
									<tbody>
										<%
											FuncionarioDao dao = new FuncionarioDao();

											List<Funcionario> listaFuncionario = new ArrayList<Funcionario>();

											listaFuncionario = dao.listar();
											for (Funcionario f : listaFuncionario) {
										%>
										
										

										<tr>
											<td><%=f.getNome()%></td>
											<td><%=f.getCpf()%></td>
											<td><%=f.getSenha() %></td>
											<td><%=f.getTipoConta() %></td>
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
		</div>
	</section>


	<div class="modal fade" id="adicionar" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">


				<div class="card">
					<div class="header">
						<h2>ADICIONAR NOVO USU�RIO AO SISTEMA</h2>
						<ul class="header-dropdown">

							<a style="margin-right: 5px;" data-dismiss="modal" role="button"
								aria-haspopup="true" aria-expanded="false"> <i
								class="material-icons">close</i>
							</a>

						</ul>
					</div>
					<div class="body">
						<form id="wizard_with_validation" method="POST">
							<h3>Informa��es de login</h3>
							<fieldset>
								<div class="form-group form-float">
									<div class="form-line">
										<input type="email" class="form-control" name="email" required>
										<label class="form-label">E-mail*</label>
									</div>
								</div>
								<div class="form-group form-float">
									<div class="form-line">
										<input type="password" minlength="6" class="form-control"
											name="password" id="password" required> <label
											class="form-label">Senha*</label>
									</div>
								</div>
								<div class="form-group form-float">
									<div class="form-line">
										<input type="password" minlength="6" class="form-control"
											name="confirm" required> <label class="form-label">Confirmar
											Senha*</label>
									</div>
								</div>
							</fieldset>

							<h3>Informa��es de perfil</h3>
							<fieldset>
								<div class="form-group form-float">
									<div class="form-line">
										<input type="text" name="nome" class="form-control" required>
										<label class="form-label">Nome*</label>
									</div>
								</div>
								<div class="form-group form-float">
									<div class="form-line">
										<input minlength="11" type="number" maxlength="11" name="cpf"
											class="form-control" required> <label
											class="form-label">CPF*</label>
									</div>
									<div class="help-info">Digite apenas os n�meros do seu
										CPF.</div>
								</div>
								<div class="form-group form-float">
									<div class="form-line">
										<input min="18" type="number" name="age" class="form-control"
											required> <label class="form-label">Idade*</label>
									</div>
									<div class="help-info">Note que o usu�rio deve ser maior
										de idade.</div>
								</div>
							</fieldset>

							<h3>Termos & Tipo da Conta</h3>
							<fieldset>
								<div class="form-group">
									<input type="radio" name="tipoDaConta" id="ContaAdm"
										class="with-gap"> <label for="ContaAdm">Esse
										usu�rio ter� permiss�es administrativas.</label> <input type="radio"
										name="tipoDaConta" id="ContaFunc" class="with-gap"> <label
										for="ContaFunc" class="m-l-20">Esse usu�rio N�O ter�
										permiss�es administrativas.</label>
								</div>
								<input id="acceptTerms-2" name="acceptTerms" type="checkbox"
									required> <label for="acceptTerms-2">Estou
									ciente que n�o poderei excluir o usu�rio criado caso ele
									realize ao menos uma altera��o dentro do sistema.</label>
							</fieldset>
						</form>
					</div>
				</div>


			</div>
		</div>
	</div>
	<div class="modal fade" id="gerenciar" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="defaultModalLabel">Gerenciar
						contas de usu�rios:</h4>
				</div>
				<div class="modal-body">
					<div class="body">
						<form id="form_validation" method="POST">
							<div class="form-group form-float">
								<div class="form-line">
									<input type="email" class="form-control" name="emailDesativar"
										required> <label class="form-label">Email</label>
								</div>
							</div>
							<div class="form-group">
								<input type="radio" name="escolhaConta" id="desativarConta"
									class="with-gap" required> <label for="desativarConta">Desejo
									desativar a conta vinculada ao e-mail acima.</label> <input
									type="radio" name="escolhaConta" id="reativarConta"
									class="with-gap" required> <label for="reativarConta">Desejo
									reativar a conta vinculada ao e-mail acima.</label>
							</div>
							<div class="form-group">
								<input type="checkbox" id="checkbox" name="checkbox"> <label
									for="checkbox">Estou ciente que a conta poder� ser
									desativada/reativada a qualquer momento.</label>
							</div>
							<div class="modal-footer">
								<button class="btn btn-primary waves-effect"
									type="submit button">CONFIRMAR</button>
								<button type="button" class="btn btn-default waves-effect"
									data-dismiss="modal">FECHAR</button>
							</div>
						</form>
					</div>
				</div>
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
		src="<%=request.getContextPath()%>/resources/js/jquery.steps.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery.validate.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/tabelas/jquery.dataTables.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/tabelas/dataTables.bootstrap.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/sweetalert.min.js"></script>

	<script src="<%=request.getContextPath()%>/resources/js/admin.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/jquery-datatable.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/modals.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/dialogs.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/js/form-validation.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/form-wizard.js"></script>

	<script src="js/demo.js"></script>
</body>

</html>