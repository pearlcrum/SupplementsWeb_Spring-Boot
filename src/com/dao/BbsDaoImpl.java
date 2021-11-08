package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.vo.BbsVo;

import static common.JDBCTemplate.Close;

public class BbsDaoImpl implements BbsDao{

	Connection conn=null;
	
	public BbsDaoImpl(Connection conn) {
		this.conn=conn;
	}
	public int getNextBbsIndex() {
		PreparedStatement psmt=null;
		ResultSet rs=null;
		try {
			psmt = conn.prepareStatement(getNextBbsIndex);
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
	public int insertBbs(String bbsTitle, String userID, String bbsContent,int Category) {
		PreparedStatement pstmt=null;
		try {
			pstmt = conn.prepareStatement(insertBBS);
			pstmt.setInt(1, getNextBbsIndex());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			String s=new TimeDaoImpl(conn).getTime();
			System.out.println(s);
			pstmt.setString(4, new TimeDaoImpl(conn).getTime());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			pstmt.setInt(7,1); // 수정 가능
			pstmt.setInt(8, 0); //bbsView
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			Close(pstmt);
		}
		return -1;
	}
	public ArrayList<BbsVo> getBBSByPage(int pageNumber){
		ArrayList<BbsVo> list = new ArrayList<BbsVo>();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt = conn.prepareStatement(getBBSByPage);
			pstmt.setInt(1, getNextBbsIndex() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BbsVo bbs = new BbsVo();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				bbs.setBbsCategory(rs.getInt(7));
				bbs.setBbsView(rs.getInt(8));
				list.add(bbs);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			Close(rs);
			Close(pstmt);
		}
		return list; 
	}
	public boolean isEmptyNextPageBBS(int pageNumber) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt = conn.prepareStatement(isEmptyNextPageBBS);
			pstmt.setInt(1, getNextBbsIndex() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			Close(rs);
			Close(pstmt);
		}
		return false; 
	}
	public BbsVo getBBSByID(int bbsID) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt = conn.prepareStatement(getBBSByID);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				BbsVo bbs = new BbsVo();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				bbs.setBbsCategory(rs.getInt(7));
				bbs.setBbsView(rs.getInt(8));
				return bbs;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			Close(rs);
			Close(pstmt);
		}
		return null; 
	}
	public int updateBBS(int bbsID, String bbsTitle, String bbsContent) {
		PreparedStatement pstmt=null;		
		try {
			pstmt = conn.prepareStatement(updateBBS);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsID);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Close(pstmt);
		}
		return -1; //database error
	}
	public int deleteBBS(int bbsID) {
		PreparedStatement pstmt=null;
		try {
			pstmt = conn.prepareStatement(deleteBBS);
			pstmt.setInt(1, bbsID);
			return pstmt.executeUpdate(); 
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Close(pstmt);
		}
		return -1; // DB ERROR
	}
	public int getBBSView(int bbsID) {
		PreparedStatement psmt=null;
		ResultSet rs=null;
		try {
			psmt = conn.prepareStatement(getBbsView);
			psmt.setInt(1, bbsID);
			rs = psmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			Close(rs);
			Close(psmt);
		}
		return -1;
	}
	public int plusBbsView(int bbsID, int bbsView) {
		PreparedStatement pstmt=null;
		try {
			pstmt = conn.prepareStatement(plusBbsView);
			pstmt.setInt(1,bbsView+1);
			pstmt.setInt(2, bbsID);
			return pstmt.executeUpdate(); 
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			Close(pstmt);
		}
		return -1; // DB ERROR
	}
	public ArrayList<BbsVo> searchByBBSTitle(String searchText, int pageNumber){
		ArrayList<BbsVo> list = new ArrayList<BbsVo>();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt = conn.prepareStatement(searchByBBSTitle);
			pstmt.setString(1, searchText);
			pstmt.setInt(2,getNextBbsIndex());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BbsVo bbs = new BbsVo();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				bbs.setBbsCategory(rs.getInt(7));
				bbs.setBbsView(rs.getInt(8));
				list.add(bbs);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			Close(rs);
			Close(pstmt);
		}
		return list; 
	}
	public ArrayList<BbsVo> searchByUserID(String searchText, int pageNumber){
		ArrayList<BbsVo> list = new ArrayList<BbsVo>();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt = conn.prepareStatement(searchByUserID);
			pstmt.setString(1, searchText);
			pstmt.setInt(2,getNextBbsIndex());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BbsVo bbs = new BbsVo();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				bbs.setBbsCategory(rs.getInt(7));
				bbs.setBbsView(rs.getInt(8));
				list.add(bbs);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			Close(rs);
			Close(pstmt);
		}
		return list; 
	}
	public ArrayList<BbsVo> searchByBBSContent(String searchText, int pageNumber){
		ArrayList<BbsVo> list = new ArrayList<BbsVo>();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt = conn.prepareStatement(searchByBBSContent);
			pstmt.setString(1, searchText);
			pstmt.setInt(2,getNextBbsIndex());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BbsVo bbs = new BbsVo();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				bbs.setBbsCategory(rs.getInt(7));
				bbs.setBbsView(rs.getInt(8));
				list.add(bbs);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			Close(rs);
			Close(pstmt);
		}
		return list; 
	}
	
	public int getNewNext() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(upload);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
