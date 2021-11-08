package com.dao;

public interface BbsCommentDao2 {

	String getAllComments="SELECT * FROM bbsComment where bbsID=? ORDER BY COMMENTID DESC";
	String getCommentsByID="SELECT * FROM bbsComment WHERE commentID=?";
	
	String updateComments="UPDATE bbsComment SET commentText =? WHERE commentID=?";
	
	String deleteComments="delete from bbsComment where commentID=?";
	
	String insertComments="INSERT INTO bbsComment values(?,?,?,?)";
	String getNextCommentsIndex="SELECT commentID FROM bbsComment ORDER BY commentID DESC";
	
}
