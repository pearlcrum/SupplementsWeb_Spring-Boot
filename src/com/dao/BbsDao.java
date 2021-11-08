package com.dao;

public interface BbsDao {

	String getBBSByID="SELECT * FROM bbs WHERE bbsID=?";
	String updateBBS="UPDATE bbs SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";
	String deleteBBS="UPDATE bbs SET bbsAvailable = 0 WHERE bbsID = ?";
	String isEmptyNextPageBBS="SELECT * FROM bbs WHERE bbsID < ? AND bbsAvailable = 1";
	String getBBSByPage="SELECT * FROM (SELECT * FROM bbs WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC) WHERE ROWNUM<=10";
	String insertBBS="INSERT INTO bbs values(?,?,?,?,?,?,?,?)";
	String getNextBbsIndex="SELECT bbsID FROM bbs ORDER BY bbsID DESC";
	String getBbsView="SELECT bbsView FROM BBS WHERE bbsID=?";
	String plusBbsView="UPDATE BBS SET BbsView=? WHERE bbsID=?";
	String searchByBBSTitle="SELECT * FROM (SELECT * FROM bbs WHERE BBSTITLE LIKE '%'||?||'%' AND bbsID < ? AND bbsAvailable = 1 ORDER BY BBSID DESC) WHERE ROWNUM<=10";
	String searchByUserID="SELECT * FROM (SELECT * FROM bbs WHERE USERID LIKE '%'||?||'%' AND bbsID < ? AND bbsAvailable = 1 ORDER BY BBSID DESC) WHERE ROWNUM<=10";
	String searchByBBSContent="SELECT * FROM (SELECT * FROM bbs WHERE BBSCONTENT LIKE '%'||?||'%' AND bbsID < ? AND bbsAvailable = 1 ORDER BY BBSID DESC) WHERE ROWNUM<=10";
	String upload = "SELECT userID FROM BBS ORDER BY userID DESC";
}
