package com.biz;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.dao.BbsDaoImpl;
import com.vo.BbsVo;

public class BbsBiz {

	public int getNextBbsIndex() {
		Connection conn=getConnection();
		int res= new BbsDaoImpl(conn).getNextBbsIndex();
		Close(conn);
		return res;
	}
	public int insertBbs(String bbsTitle, String userID, String bbsContent,int Category) {
		Connection conn=getConnection();
		int res= new BbsDaoImpl(conn).insertBbs(bbsTitle, userID, bbsContent, Category);
		Commit(conn);
		Close(conn);
		return res;
	}
	public ArrayList<BbsVo> getBBSByPage(int pageNumber){
		Connection conn=getConnection();
		ArrayList<BbsVo> res=new BbsDaoImpl(conn).getBBSByPage(pageNumber);
		Close(conn);
		return res;
	}
	public boolean isEmptyNextPageBBS(int pageNumber) {
		Connection conn=getConnection();
		boolean res=new BbsDaoImpl(conn).isEmptyNextPageBBS(pageNumber);
		Close(conn);
		return res;
	}
	public BbsVo getBBSByID(int bbsID) {
		Connection conn=getConnection();
		BbsVo res=new BbsDaoImpl(conn).getBBSByID(bbsID);
		Close(conn);
		return res;
	}
	public int updateBBS(int bbsID, String bbsTitle, String bbsContent) {
		Connection conn=getConnection();
		int res= new BbsDaoImpl(conn).updateBBS(bbsID, bbsTitle, bbsContent);
		Commit(conn);
		Close(conn);
		return res;
	}
	public int deleteBBS(int bbsID) {
		Connection conn=getConnection();
		int res= new BbsDaoImpl(conn).deleteBBS(bbsID);
		Commit(conn);
		Close(conn);
		return res;
	}
	public int getBBSView(int bbsID) {
		Connection conn=getConnection();
		int res= new BbsDaoImpl(conn).getBBSView(bbsID);
		Close(conn);
		return res;
	}
	public int plusBbsView(int bbsID, int bbsView) {
		Connection conn=getConnection();
		int res= new BbsDaoImpl(conn).plusBbsView(bbsID, bbsView);
		Commit(conn);
		Close(conn);
		return res;
	}
	public ArrayList<BbsVo> searchByBBSTitle(int pageNumber,String text){
		Connection conn=getConnection();
		ArrayList<BbsVo> res=new BbsDaoImpl(conn).searchByBBSTitle(text,pageNumber);
		Close(conn);
		return res;
	}
	public ArrayList<BbsVo> searchByUserID(int pageNumber,String text){
		Connection conn=getConnection();
		ArrayList<BbsVo> res=new BbsDaoImpl(conn).searchByUserID(text,pageNumber);
		Close(conn);
		return res;
	}
	public ArrayList<BbsVo> searchByBBSContent(int pageNumber,String text){
		Connection conn=getConnection();
		ArrayList<BbsVo> res=new BbsDaoImpl(conn).searchByBBSContent(text,pageNumber);
		Close(conn);
		return res;
	}
	public int getNewNext() {
		Connection conn=getConnection();
		int res= new BbsDaoImpl(conn).getNewNext();
		Commit(conn);
		Close(conn);
		return res;
	}
}
