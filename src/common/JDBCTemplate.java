package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
	// 1. Connection
	public static Connection getConnection() {
		// 1.�뱶�씪�씠踰� 李몄“
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		// 2. 李몄“�떆�궓 �뱶�씪�씠踰꾨�� �씠�슜�븳�떎.
		Properties pro = new Properties();
		pro.put("user", "scott");
		pro.put("password", "TIGER");

		Connection conn = null;
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", pro);
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	// 1-2 DB�� Connect �릺�뿀�뒗吏� �쑀臾대�� 由ы꽩
	public static boolean isConnected(Connection conn) {
		boolean validConnection = true;
		try {
			if (conn == null || conn.isClosed()) {
				validConnection = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return validConnection;
	}

	// 2. close
	public static void Close(Connection conn) {
		if (isConnected(conn)) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// 3. close statement
	public static void Close(Statement stmt) {
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	// 4. close resultSet
	public static void Close(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	// 5. RollBack()
	public static void RollBack(Connection conn) {
		if (isConnected(conn)) {
			try {
				conn.rollback();
				System.out.println("[ JDBCTemplate.RollBack ] : DB Successfully Rollbacked");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	// 6. Commit()
	public static void Commit(Connection conn) {
		if (isConnected(conn)) {
			try {
				conn.commit();
				System.out.println("[ JDBCTemplate.Commit ] : DB Successfully Committed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
