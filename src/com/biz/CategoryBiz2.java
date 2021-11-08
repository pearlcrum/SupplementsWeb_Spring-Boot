package com.biz;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import com.dao.CategoryDaoImpl;
import com.vo.CategoryVo;
public class CategoryBiz2 {

	public String getCategory(int categoryNum){
		Connection conn=getConnection();
		String res= new CategoryDaoImpl(conn).getCategory(categoryNum);
		Close(conn);
		return res;
	}
}
