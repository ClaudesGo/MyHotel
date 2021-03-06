package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import br.com.start.myhotel.model.Administrador;
import br.com.start.myhotel.model.Funcionario;
import connection.ConexaoFactory;
import excecoes.ExcecaoBusca;
import excecoes.ExcecaoCadastro;
import excecoes.ExcecaoEdicao;
import excecoes.ExcecaoExclusao;

public class AdministradorDao {

	// 1-M�TODO PARA CRIAR ADMINISTRADOR
	public void criarAdm(Administrador pessoa) throws ExcecaoCadastro {

		StringBuilder sql = new StringBuilder();
		sql.append("insert into administrador ");
		sql.append("(cpf_adm,senha,nome_adm,email) ");
		sql.append("values (?,?,?,?)");

		Connection conexao = ConexaoFactory.getConnection();

		try {
			PreparedStatement comando = conexao.prepareStatement(sql.toString());
			comando.setString(1, pessoa.getCpf());
			comando.setString(2, pessoa.getSenha());
			comando.setString(3, pessoa.getNome());
			comando.setString(4, pessoa.getEmail());

			comando.executeUpdate();

			System.out.println("Administrador criado com sucesso");
		} catch (SQLException excecao) {
			throw new ExcecaoCadastro("Erro ao inserir administrador");
		}

	}

	// 2-M�TODO PARA EXCLUIR ADMINISTRADOR
	public void excluirAdm(Administrador pessoa) throws ExcecaoExclusao {

		StringBuilder sql = new StringBuilder();
		sql.append("delete from administrador ");
		sql.append("where cpf_adm = ?");

		Connection conexao = ConexaoFactory.getConnection();

		try {
			PreparedStatement comando = conexao.prepareStatement(sql.toString());
			comando.setString(1, pessoa.getCpf());

			comando.executeUpdate();

			System.out.println("Administrador deletado com sucesso");
		} catch (SQLException excecao) {
			throw new ExcecaoExclusao("erro ao excluir");
		}

	}

	// 3-FUN��O, ATUALIZAR ADM

	public void editarSenhaAdm(Administrador pessoa) throws ExcecaoEdicao {
		StringBuilder sql = new StringBuilder();
		sql.append("update administrador ");
		sql.append("set senha = ? ");
		sql.append("where nome_adm = ? ");

		Connection conexao = ConexaoFactory.getConnection();

		try {
			PreparedStatement comando = conexao.prepareStatement(sql.toString());
			comando.setString(1, pessoa.getSenha());
			comando.setString(2, pessoa.getNome());

			comando.executeUpdate();

			System.out.println("Administrador alterado");
		} catch (SQLException excecao) {
			throw new ExcecaoEdicao("Administrador n�o alterado");

		}
	}
	
	public void editarPerfilAdm(Administrador adm) throws ExcecaoEdicao {
		StringBuilder sql = new StringBuilder();
		sql.append("update administrador ");
		sql.append("set nome_adm='?', email='?' ");
		sql.append("where cpf = '?' ");

		Connection conexao = ConexaoFactory.getConnection();

		try {
			PreparedStatement comando = conexao.prepareStatement(sql.toString());
			comando.setString(1, adm.getNome());
			comando.setString(2, adm.getEmail());
			comando.setString(3, adm.getCpf());

			comando.executeUpdate();

			System.out.println("Administrador alterado");
		} catch (SQLException excecao) {
			throw new ExcecaoEdicao("Administrador n�o alterado");

		}
	}

	// 4-BUSCAR TODOS ADMS
	public void buscarAdms(Administrador pessoa) throws ExcecaoBusca {
		StringBuilder sql = new StringBuilder();
		sql.append("select cpf_adm, nome_adm ");
		sql.append("from administrador ");
		// sql.append("where tipo_conta = ? ");

		try {
			Connection conexao = ConexaoFactory.getConnection();

			PreparedStatement comando = conexao.prepareStatement(sql.toString());
			comando.setString(1, pessoa.getCpf());

			ResultSet resultado = comando.executeQuery();

		} catch (SQLException e) {
			throw new ExcecaoBusca("Erro ao buscar funcion�rios");
		}
	}

	// 5-BUSCAR UM ADM
	public void buscarAdm(Administrador pessoa) throws ExcecaoBusca {
		StringBuilder sql = new StringBuilder();
		sql.append("select cpf_adm ");
		sql.append("from admninistrador");

		try {
			Connection conexao = ConexaoFactory.getConnection();

			PreparedStatement comando = conexao.prepareStatement(sql.toString());
			comando.setString(1, pessoa.getCpf());

			ResultSet resultado = comando.executeQuery();

		} catch (SQLException excecao) {
			throw new ExcecaoBusca("Erro ao busca administrador");
		}
	}

	// 6-M�TODO PARA CRIAR FUNCION�RIO
	public void criarFuncionario(Funcionario pessoa) throws ExcecaoCadastro {

		StringBuilder sql = new StringBuilder();
		sql.append("insert into funcionario ");
		sql.append("(cpf_func,senha,nome_func,email) ");
		sql.append("values (?,?,?,?)");

		Connection conexao = ConexaoFactory.getConnection();

		try {
			PreparedStatement comando = conexao.prepareStatement(sql.toString());
			comando.setString(1, pessoa.getCpf());
			comando.setString(2, pessoa.getSenha());
			comando.setString(3, pessoa.getNome());
			comando.setString(4, pessoa.getEmail());

			comando.executeUpdate();

			System.out.println("Funcion�rio criado com sucesso");
		} catch (SQLException e) {
			throw new ExcecaoCadastro("Erro ao cadastrar funcionanrio");
		}

	}

	// 7- FUN��O QUE EDITA/ALTERA FUNCIONARIO
	public void editarFuncionario(Funcionario pessoa) throws ExcecaoEdicao {
		StringBuilder sql = new StringBuilder();
		sql.append("update funcionario ");
		sql.append("set senha = ? ");
		sql.append("where nome_func = ? ");

		Connection conexao = ConexaoFactory.getConnection();

		try {
			PreparedStatement comando = conexao.prepareStatement(sql.toString());
			comando.setString(1, pessoa.getSenha());
			comando.setString(2, pessoa.getNome());

			comando.executeUpdate();

			System.out.println("Funcionario alterado alterado");
		} catch (SQLException excecao) {
			throw new ExcecaoEdicao("Erro ao alterar funcionario");
		}

	}

	// 8-FUN��O EXCLUIR FUNCION�RIO
	public void excluirFuncionario(Funcionario pessoa) throws ExcecaoExclusao {
		StringBuilder sql = new StringBuilder();
		sql.append("delete from funcionario ");
		sql.append("where cpf_func = ? ");

		Connection conexao = ConexaoFactory.getConnection();

		try {
			PreparedStatement comando = conexao.prepareStatement(sql.toString());
			comando.setString(1, pessoa.getCpf());

			comando.executeUpdate();

			System.out.println("Funcion�rio deletado");
		} catch (SQLException excecao) {
			throw new ExcecaoExclusao("Funcion�rio n�o foi deletado");
		}

	}

	// 9-BUSCAR TODOS FUNCIONARIOS
	public void buscarFuncionarios(Funcionario pessoa) throws ExcecaoBusca {
		StringBuilder sql = new StringBuilder();
		sql.append("select cpf_func, nome_func ");
		sql.append("from funcionario ");
		// sql.append("where cpf_func = ? ");

		Connection conexao = ConexaoFactory.getConnection();

		try {
			PreparedStatement comando = conexao.prepareStatement(sql.toString());
			comando.setString(1, pessoa.getCpf());
			comando.setString(2, pessoa.getNome());

			ResultSet resultado = comando.executeQuery();
		} catch (SQLException excecao) {
			throw new ExcecaoBusca("Funcion�rios n�o listados");
		}
	}

	// 10-BUSCAR UM FUNCIONARIO
	public void buscarFuncionario(Funcionario f) throws ExcecaoBusca {
		StringBuilder sql = new StringBuilder();
		sql.append("select cpf_func ");
		sql.append("from funcionario ");
		sql.append("where cpf_func = ? ");

		try {
			Connection conexao = ConexaoFactory.getConnection();

			PreparedStatement comando = conexao.prepareStatement(sql.toString());
			comando.setString(1, f.getCpf());

			ResultSet resultado = comando.executeQuery();
		} catch (SQLException excecao) {
			throw new ExcecaoBusca("Funcion�rio n�o encontrado");
		}

	}

	public void gerenciarStatus(Funcionario f) throws ExcecaoEdicao {
		StringBuilder sql = new StringBuilder();
		sql.append("update funcionario ");
		sql.append("set status = ? ");
		sql.append("where cpf = ? ");

		Connection conexao = ConexaoFactory.getConnection();

		try {
			PreparedStatement comando = conexao.prepareStatement(sql.toString());
			comando.setInt(1, f.getStatus());
			comando.setString(2, f.getCpf());

			comando.executeUpdate();

			System.out.println("Funcionario alterado");
		} catch (SQLException excecao) {
			throw new ExcecaoEdicao("Erro ao editar o status do funcionario");
		}
	}

	public ArrayList<Administrador> listarAdm() throws SQLException {
		StringBuilder sql = new StringBuilder();
		sql.append("select cpf_adm,senha, nome_adm, tipo_conta, email, status ");
		sql.append("from administrador");

		Connection conexao = ConexaoFactory.getConnection();
		PreparedStatement comando = null;
		ResultSet resultado = null;

		comando = conexao.prepareStatement(sql.toString());

		resultado = comando.executeQuery();

		ArrayList<Administrador> lista = new ArrayList<Administrador>();

		while (resultado.next()) {
			Administrador f = new Administrador();
			f.setCpf(resultado.getString("cpf_adm"));
			f.setSenha(resultado.getString("senha"));
			f.setNome(resultado.getString("nome_adm"));
			f.setTipoConta(resultado.getString("tipo_conta"));
			f.setEmail(resultado.getString("email"));
			f.setStatus(resultado.getInt("status"));

			lista.add(f);
		}

		try {
			conexao.close();
		} catch (SQLException e) {
		}

		return lista;

	}

	public Administrador buscarPorEmail(String a) throws SQLException {
		StringBuilder sql = new StringBuilder();
		sql.append("select * ");
		sql.append("from administrador ");
		sql.append("where email = ?");

		Connection conexao = ConexaoFactory.getConnection();
		PreparedStatement comando = null;
		ResultSet resultado = null;

		PreparedStatement stmt = conexao.prepareStatement("SELECT * FROM administrador WHERE email = ?");

		// comando = conexao.prepareStatement(sql.toString());
		
		stmt.setString(1, a);
		resultado = stmt.executeQuery();

		Administrador retorno = null;

		if (resultado.next()) {

			retorno = new Administrador();
			retorno.setCpf(resultado.getString("cpf_adm"));
			retorno.setSenha(resultado.getString("senha"));
			retorno.setNome(resultado.getString("nome_adm"));
			retorno.setTipoConta(resultado.getString("tipo_conta"));
			retorno.setEmail(resultado.getString("email"));
			
			//retorno.setStatus(resultado.getInt("status"));

		}

		try {
			conexao.close();
		} catch (SQLException e) {
		}

		return retorno;

	}

}
