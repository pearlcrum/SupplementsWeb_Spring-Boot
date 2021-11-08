package com.dao;

import static common.JDBCTemplate.Close;

import java.sql.*;
import java.util.ArrayList;

import com.vo.BbsCommentVo;
import com.vo.BbsVo;


public class BbsCommentDaoImpl implements BbsCommentDao{

	Connection conn=null;
	public BbsCommentDaoImpl(Connection conn) {
		this.conn=conn;
	}
	public int getNextCommentsIndex() {
		PreparedStatement psmt=null;
		ResultSet rs=null;
		try {
			psmt = conn.prepareStatement(getNextCommentsIndex);
			rs = psmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //ù��° �Խù��� ���
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			Close(rs);
			Close(psmt);
		}
		return -1; //������ ���̽� ����
	}
	public int insertComments(int bbsID, String userID, String commentText)
	{
		PreparedStatement pstmt=null;
		try {
			pstmt = conn.prepareStatement(insertComments);
			int temp=getNextCommentsIndex();
			System.out.println(temp);
			pstmt.setInt(1, temp);
			pstmt.setInt(2, bbsID);
			pstmt.setString(3, userID);
			pstmt.setString(4, commentText);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			
			e.printStackTrace();
		}finally {
			Close(pstmt);
		}
		return -1;
	}
	public ArrayList<BbsCommentVo> getAllComments(int bbsNo){
		ArrayList<BbsCommentVo> list = new ArrayList<BbsCommentVo>();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt = conn.prepareStatement(getAllComments);
			pstmt.setInt(1, bbsNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BbsCommentVo bbsComment = new BbsCommentVo();
				bbsComment.setCommentID(rs.getInt(1));
				bbsComment.setBbsID(rs.getInt(2));
				bbsComment.setUserID(rs.getString(3));
				bbsComment.setCommentText(rs.getString(4));
				list.add(bbsComment);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			Close(rs);
			Close(pstmt);
		}
		return list; 
	}
	public BbsCommentVo getCommentsByID(int commentID) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt = conn.prepareStatement(getCommentsByID);
			pstmt.setInt(1, commentID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				BbsCommentVo vo = new BbsCommentVo();
				vo.setCommentID(rs.getInt(1));
				vo.setBbsID(rs.getInt(2));
				vo.setUserID(rs.getString(3));
				vo.setCommentText(rs.getString(4));
				return vo;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			Close(rs);
			Close(pstmt);
		}
		return null; 
	}
	public int updateComments(int commentID, String commentText) {
		PreparedStatement pstmt=null;		
		try {
			pstmt = conn.prepareStatement(updateComments);
			pstmt.setString(1, commentText);
			pstmt.setInt(2, commentID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Close(pstmt);
		}
		return -1; //database error
	}
	public int deleteComments(int commentID) {
		PreparedStatement pstmt=null;
		try {
			pstmt = conn.prepareStatement(deleteComments);
			pstmt.setInt(1, commentID);
			return pstmt.executeUpdate(); 
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Close(pstmt);
		}
		return -1; // DB ERROR
	}
}
