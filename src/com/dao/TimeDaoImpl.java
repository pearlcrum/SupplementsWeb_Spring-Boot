package com.dao;

import static common.JDBCTemplate.Close;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TimeDaoImpl implements TimeDao{

	Connection conn=null;
	
	public TimeDaoImpl(Connection conn) {
		this.conn=conn;
	}
	
	public String getTime() {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt = conn.prepareStatement(getTime);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			Close(rs);
			Close(pstmt);
		}
		return "";
	}
}
