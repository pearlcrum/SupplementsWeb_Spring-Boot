package com.biz;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.dao.BbsDaoImpl;
import com.dao.BbsDaoImpl2;
import com.vo.BbsVo;
import com.vo.BbsVo2;

public class BbsBiz2 {

	public int getNextBbsIndex() {
		Connection conn=getConnection();
		int res= new BbsDaoImpl2(conn).getNextBbsIndex();
		Close(conn);
		return res;
	}
	public int insertBbs(String bbsTitle, String userID, String bbsContent,int Category) {
		Connection conn=getConnection();
		int res= new BbsDaoImpl2(conn).insertBbs(bbsTitle, userID, bbsContent, Category);
		Commit(conn);
		Close(conn);
		return res;
	}
	public ArrayList<BbsVo2> getBBSByPage(int pageNumber){
		Connection conn=getConnection();
		ArrayList<BbsVo2> res=new BbsDaoImpl2(conn).getBBSByPage(pageNumber);
		Close(conn);
		return res;
	}
	public boolean isEmptyNextPageBBS(int pageNumber) {
		Connection conn=getConnection();
		boolean res=new BbsDaoImpl2(conn).isEmptyNextPageBBS(pageNumber);
		Close(conn);
		return res;
	}
	public BbsVo2 getBBSByID(int bbsID) {
		Connection conn=getConnection();
		BbsVo2 res=new BbsDaoImpl2(conn).getBBSByID(bbsID);
		Close(conn);
		return res;
	}
	public int updateBBS(int bbsID, String bbsTitle, String bbsContent) {
		Connection conn=getConnection();
		int res= new BbsDaoImpl2(conn).updateBBS(bbsID, bbsTitle, bbsContent);
		Commit(conn);
		Close(conn);
		return res;
	}
	public int deleteBBS(int bbsID) {
		Connection conn=getConnection();
		int res= new BbsDaoImpl2(conn).deleteBBS(bbsID);
		Commit(conn);
		Close(conn);
		return res;
	}
	public int getBBSView(int bbsID) {
		Connection conn=getConnection();
		int res= new BbsDaoImpl2(conn).getBBSView(bbsID);
		Close(conn);
		return res;
	}
	public int plusBbsView(int bbsID, int bbsView) {
		Connection conn=getConnection();
		
		int res= new BbsDaoImpl2(conn).plusBbsView(bbsID, bbsView);
		Commit(conn);
		Close(conn);
		return res;
	}
	public ArrayList<BbsVo2> searchByBBSTitle(int pageNumber,String text){
		Connection conn=getConnection();
		ArrayList<BbsVo2> res=new BbsDaoImpl2(conn).searchByBBSTitle(text,pageNumber);
		Close(conn);
		return res;
	}
	public ArrayList<BbsVo2> searchByUserID(int pageNumber,String text){
		Connection conn=getConnection();
		ArrayList<BbsVo2> res=new BbsDaoImpl2(conn).searchByUserID(text,pageNumber);
		Close(conn);
		return res;
	}
	public ArrayList<BbsVo2> searchByBBSContent(int pageNumber,String text){
		Connection conn=getConnection();
		ArrayList<BbsVo2> res=new BbsDaoImpl2(conn).searchByBBSContent(text,pageNumber);
		Close(conn);
		return res;
	}
	public int getNewNext2() {
		Connection conn=getConnection();
		int res= new BbsDaoImpl2(conn).getNewNext2();
		Commit(conn);
		Close(conn);
		return res;
	}
}
