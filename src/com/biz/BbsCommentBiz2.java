package com.biz;


import static common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.dao.BbsCommentDaoImpl2;
import com.vo.*;

public class BbsCommentBiz2 {

	public ArrayList<BbsCommentVo2> getAllComments(int bbsNo){
		Connection conn=getConnection();
		ArrayList<BbsCommentVo2> res= new BbsCommentDaoImpl2(conn).getAllComments(bbsNo);
		Close(conn);
		return res;
	}
	public int getNextCommentsIndex() {
		Connection conn=getConnection();
		int res= new BbsCommentDaoImpl2(conn).getNextCommentsIndex();
		Close(conn);
		return res;
	}
	public int insertComments(int bbsID, String userID, String commentText) {
		Connection conn=getConnection();
		int res= new BbsCommentDaoImpl2(conn).insertComments(bbsID, userID, commentText);
		Commit(conn);
		Close(conn);
		return res;
	}
	public BbsCommentVo2 getCommentsByID(int commentID) {
		Connection conn=getConnection();
		BbsCommentVo2 res= new BbsCommentDaoImpl2(conn).getCommentsByID(commentID);
		Close(conn);
		return res;
	}
	public int updateComments(int commentID, String commentText) {
		Connection conn=getConnection();
		int res= new BbsCommentDaoImpl2(conn).updateComments(commentID, commentText);
		Commit(conn);
		Close(conn);
		return res;
	}
	public int deleteComments(int commentID) {
		Connection conn=getConnection();
		int res= new BbsCommentDaoImpl2(conn).deleteComments(commentID);
		Commit(conn);
		Close(conn);
		return res;
	}
}
