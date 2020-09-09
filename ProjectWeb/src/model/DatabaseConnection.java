package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

//import control.DatabaseConnection;

public class DatabaseConnection {
	String sql;

	public DatabaseConnection() {
		super();
		// this.sql =
		// "jdbc:sqlserver://localhost:1433;databaseName=BAY;user=sa;password=12345";
		// this.sql =
		// "jdbc:sqlserver://satefubuki.database.windows.net:1433;database=BAY;user=satefubuki@satefubuki;password=Darkmagician1;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
	}

	public static Connection connect() throws Exception {
		Connection connection = null;
//		String driver = "com.mysql.jdbc.Driver";
////		String url = "jdbc:sqlserver://satefubuki.database.windows.net:1433;database=BAY";
////		String user ="satefubuki@satefubuki";
////		String pass="Darkmagician1";
////		String url = "jdbc:mysql://localhost:3306/project_thinh?useUnicode=true&characterEncoding=UTF-8";
////		String user ="root";
////		String pass="anh17051998";
//		String url = "jdbc:mysql://ltw-midterm.mysql.database.azure.com:3306/qlgv?useUnicode=true&characterEncoding=UTF-8";
//		String user = "anhnguyenit@ltw-midterm";
//		String pass = "anh@17051998";
		
		String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String url = "jdbc:sqlserver://localhost:1433;databaseName=BAY";
		String user ="sa";
		String pass="12345";
		
		Properties properties = new Properties();
		properties.setProperty("user", user);
		properties.setProperty("password", pass);
		properties.setProperty("useSSL", "true");
		properties.setProperty("verifyServerCertificate", "true");
		properties.setProperty("requireSSL", "false");
		try {
			Class.forName(driver);
//		connection = DriverManager.getConnection(url,user,pass);
			connection = (Connection) DriverManager.getConnection(url, properties);

		} catch (Exception e) {
			// Orther err
			e.printStackTrace();
		}
		return connection;
	}

	public void thucThiCauLenhSQL(String sql) throws Exception {
		Connection connect = connect();
		Statement stmt = connect.createStatement();

		stmt.executeUpdate(sql);
	}

	public ResultSet chonDuLieuTuDTB(String sql) throws Exception {
		Connection connect = connect();
		Statement stmt = connect.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		return rs;
	}

	public static void main(String[] args) throws Exception {
		Connection connection = DatabaseConnection.connect();
		if (connection != null) {
			System.out.println("Kết nối thành công");
		} else {
			System.out.println("Kết nối thất bại");
		}
	}
}
