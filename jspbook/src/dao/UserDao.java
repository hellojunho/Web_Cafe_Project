package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.UserBean;

public class UserDao {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs;

	// DB연결
	private void connect() {

		String jdbc_driver = "com.mysql.cj.jdbc.Driver";
//		String jdbc_url = "jdbc:mysql://localhost/web_project?allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=UTC";
		String jdbc_url = "jdbc:mysql://localhost:3306/web_project?allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=UTC";
		
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "root", "whwnsgh99*");
			System.out.println("DB 연결");
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	// DB연결 해제
	private void disconnect() {
		try {
			pstmt.close();
			conn.close();
			System.out.println("DB 연결 해제");
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	/**
	 * 회원가입
	 */
	public boolean signUp(String userid, String passwd, String username) {
		connect();
		String sql = "Insert into _user values(?,?,?);";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, passwd);
			pstmt.setString(3, username);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}

		return true;
	}

	/**
	 * 로그인
	 */
	public boolean signIn(String userid, String passwd) {
		connect();
		String sql = "select * from _user where userid = ? and passwd = ?;";
		boolean result = false;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();
			
			// sql 조회 시, 결과 값이 나온다면
			if (rs.next()) {
				result = true;	// 로그인 성공
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return result;
	}

	/**
	 * 회원정보 조회
	 */
	public UserBean getUser(String userid) {
		connect();
		String sql = "select * from _user where userid = ?;";
		UserBean user = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();			

			if (rs.next()) {
				user = new UserBean();
				user.setUserid(rs.getString(1));
				user.setPasswd(rs.getString(2));
				user.setUsername(rs.getString(3));
			}
		} catch (Exception e) {
			System.out.println("예외가 발생했습니다.");
			e.printStackTrace();
			return null;
		} finally {
			disconnect();
		}
		return user;
	}

}