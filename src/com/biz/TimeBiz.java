package com.biz;


import java.sql.Connection;

import com.dao.TimeDaoImpl;

import static common.JDBCTemplate.*;

public class TimeBiz {
	public String getTime() {
		Connection conn=getConnection();
		String res= new TimeDaoImpl(conn).getTime();
		Close(conn);
		return res;
	}
}
