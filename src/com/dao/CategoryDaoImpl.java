package com.dao;

import static common.JDBCTemplate.Close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.vo.CategoryVo;

public class CategoryDaoImpl implements CategoryDao{

	Connection conn=null;
	
	public CategoryDaoImpl(Connection conn) {
		this.conn=conn;
	}
	
	public String getCategory(int categoryNum){
		PreparedStatement psmt=null;
		ResultSet rs=null;
		String ans=null;
		try {
			psmt=conn.prepareStatement(getCategory);
			psmt.setInt(1, categoryNum);
			rs=psmt.executeQuery();
			if(rs.next()){
				ans=rs.getString(1);
			}
			return ans;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			Close(rs);
			Close(psmt);
		}
		return ans;
	}
}
