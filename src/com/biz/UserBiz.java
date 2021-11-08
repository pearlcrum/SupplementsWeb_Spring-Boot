package com.biz;
import java.sql.Connection;
import static common.JDBCTemplate.*;
import com.dao.BbsDaoImpl;
import com.dao.UserDaoImpl;
import com.vo.UserVo;
public class UserBiz {
    public UserVo getUser(String userID) {
        Connection conn=getConnection();
        UserVo res=new UserDaoImpl(conn).getUser(userID);
        Close(conn);
        return res;
    }
    public int checkLoginUser(String userID, String userPassword) {
        Connection conn=getConnection();
        int res=new UserDaoImpl(conn).checkLoginUser(userID, userPassword);
        Close(conn);
        return res;
    }
    public int joinUser(UserVo vo) {
        Connection conn=getConnection();
        int res=new UserDaoImpl(conn).joinUser(vo);
        Close(conn);
        return res;
    }
    public int deleteUser(String userID) {
        Connection conn=getConnection();
        int res=new UserDaoImpl(conn).deleteUser(userID);
        Close(conn);
        return res;
    }
    public int updatePassword(String userID, String userPassword) {
        Connection conn=getConnection();
        int res= new UserDaoImpl(conn).updatePassword(userID, userPassword);
        Commit(conn);
        Close(conn);
        return res;
    }
    public int updateEmail(String userID, String userEmail) {
        Connection conn=getConnection();
        int res= new UserDaoImpl(conn).updateEmail(userID, userEmail);
        Commit(conn);
        Close(conn);
        return res;
    }
}