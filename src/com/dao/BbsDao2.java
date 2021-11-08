package com.dao;

public interface BbsDao2 {

	String getBBSByID="SELECT * FROM bbs2 WHERE bbsID=?";
	String updateBBS="UPDATE bbs2 SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";
	String deleteBBS="UPDATE bbs2 SET bbsAvailable = 0 WHERE bbsID = ?";
	String isEmptyNextPageBBS="SELECT * FROM bbs2 WHERE bbsID < ? AND bbsAvailable = 1";
	String getBBSByPage="SELECT * FROM (SELECT * FROM bbs2 WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC) WHERE ROWNUM<=10";
	String insertBBS="INSERT INTO bbs2 values(?,?,?,?,?,?,?,?)";
	String getNextBbsIndex="SELECT bbsID FROM bbs2 ORDER BY bbsID DESC";
	String getBbsView="SELECT bbsView FROM BBS2 WHERE bbsID=?";
	String plusBbsView="UPDATE BBS2 SET BbsView=? WHERE bbsID=?";
	String searchByBBSTitle="SELECT * FROM (SELECT * FROM bbs2 WHERE BBSTITLE LIKE '%'||?||'%' AND bbsID < ? AND bbsAvailable = 1 ORDER BY BBSID DESC) WHERE ROWNUM<=10";
	String searchByUserID="SELECT * FROM (SELECT * FROM bbs2 WHERE USERID LIKE '%'||?||'%' AND bbsID < ? AND bbsAvailable = 1 ORDER BY BBSID DESC) WHERE ROWNUM<=10";
	String searchByBBSContent="SELECT * FROM (SELECT * FROM bbs2 WHERE BBSCONTENT LIKE '%'||?||'%' AND bbsID < ? AND bbsAvailable = 1 ORDER BY BBSID DESC) WHERE ROWNUM<=10";
	String upload = "SELECT userID FROM BBS2 ORDER BY userID DESC";
}
