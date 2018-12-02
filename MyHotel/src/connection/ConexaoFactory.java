package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoFactory {

	private final static String driver = "com.mysql.jdbc.Driver";
	private final static String url = "jdbc:mysql://localhost:3306/myhotel";
	private final static String user = "root";
	private final static String password = "root";

	public static Connection getConnection() {

		Connection conexao = null;
		try {
			Class.forName(driver);
			conexao = DriverManager.getConnection(url, user, password);

		} catch (SQLException ex) {
			System.out.println("Sua conex�o foi mal sucedida");
		} catch (ClassNotFoundException excecao) {
			System.out.println("Drive n�o encontrado");
		}
		return conexao;
	}

//	Teste de conex�o
//	public static void main(String[] args) throws SQLException {
//		Connection conexao = ConexaoFactory.getConnection();
//		System.out.println("Conexao completa");
//	}

	public void closeConnection(Connection conexao) {
		try {
			if (!conexao.isClosed()) {
				conexao.close();
			}
		} catch (SQLException exe) {
			System.out.println("Conex�o nao foi fechada" + exe.getMessage());
		}
	}

}