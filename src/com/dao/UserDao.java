package com.dao;
public interface UserDao {
    String checkLoginUser="SELECT userPassword FROM supplementsUser WHERE userID = ?";
    String joinUser="INSERT INTO supplementsUser (userID, userPassword, userName, userGender, userEmail, userBirth) VALUES (?,?,?,?,?,?)";
    String deleteUser="Delete FROM supplementsUser where userID=?";
    String updatePassword="UPDATE supplementsUser set userPassword=? where userID=?";
    String updateEmail="UPDATE supplementsUser set userEmail=? where userID=?";
    String getUser="SELECT * FROM supplementsUser where userID=?";
}