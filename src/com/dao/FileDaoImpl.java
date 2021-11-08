package com.dao;

import static common.JDBCTemplate.Close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FileDaoImpl implements FileDao {

	Connection conn=null;
	
	public FileDaoImpl(Connection conn) {
		this.conn=conn;
	}
	
	public int upload(String fileName, String fileRealName, String userID) {
		PreparedStatement pstmt = null;
		
		try {
			
			pstmt = conn.prepareStatement(Upload);
			pstmt.setString(1, fileName);
			pstmt.setString(2, fileRealName);
			pstmt.setString(3, userID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			
		}finally {
			Close(pstmt);
		}
		return -1;
		
	}
	
}
