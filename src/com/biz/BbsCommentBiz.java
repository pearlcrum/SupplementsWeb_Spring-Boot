package com.biz;


import static common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.dao.BbsCommentDaoImpl;
import com.vo.BbsCommentVo;

public class BbsCommentBiz {

	public ArrayList<BbsCommentVo> getAllComments(int bbsNo){
		Connection conn=getConnection();
		ArrayList<BbsCommentVo> res= new BbsCommentDaoImpl(conn).getAllComments(bbsNo);
		Close(conn);
		return res;
	}
	public int getNextCommentsIndex() {
		Connection conn=getConnection();
		int res= new BbsCommentDaoImpl(conn).getNextCommentsIndex();
		Close(conn);
		return res;
	}
	public int insertComments(int bbsID, String userID, String commentText) {
		Connection conn=getConnection();
		int res= new BbsCommentDaoImpl(conn).insertComments(bbsID, userID, commentText);
		Commit(conn);
		Close(conn);
		return res;
	}
	public BbsCommentVo getCommentsByID(int commentID) {
		Connection conn=getConnection();
		BbsCommentVo res= new BbsCommentDaoImpl(conn).getCommentsByID(commentID);
		Close(conn);
		return res;
	}
	public int updateComments(int commentID, String commentText) {
		Connection conn=getConnection();
		int res= new BbsCommentDaoImpl(conn).updateComments(commentID, commentText);
		Commit(conn);
		Close(conn);
		return res;
	}
	public int deleteComments(int commentID) {
		Connection conn=getConnection();
		int res= new BbsCommentDaoImpl(conn).deleteComments(commentID);
		Commit(conn);
		Close(conn);
		return res;
	}
}
