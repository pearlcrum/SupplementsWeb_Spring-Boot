package com.biz;

import static common.JDBCTemplate.Close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.dao.FileDaoImpl;

public class FileBiz {

	public int InsertFile(String fileName, String fileRealName, String UserID){
		Connection conn=getConnection();
		int res= new FileDaoImpl(conn).upload(fileName, fileRealName, UserID);
		Close(conn);
		return res;
	}
}

