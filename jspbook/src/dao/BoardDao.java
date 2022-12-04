package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.BoardBean;

public class BoardDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs;

	// DB연결
	private void connect() {

		String jdbc_driver = "com.mysql.cj.jdbc.Driver";
		//String jdbc_url = "jdbc:mysql://localhost/web_project?allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=UTC";
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
	 * 글 등록
	 */
	public boolean register(String title, String content, String user_id) {
		connect();
		String sql = "Insert into board (title, content, user_id) values(?,?,?);";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, user_id);
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
	 * 글 수정
	 */
	public boolean update(String board_id, String title, String content, String user_id) {
		connect();
		String sql = "update board set title=?, content=? where idx=?;";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board_id);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setString(4, user_id);
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
	 * 글 삭제
	 */
	public boolean delete(String title) {
		connect();
		String sql = "delete from board where title=?;";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}
	
	public List<BoardBean> getBoards(String title, String author) {
		connect();
		String sql = "select * from board";
		List<BoardBean> boards = new ArrayList<BoardBean>();
		
		try {
			if(title != "")
				sql += " where title = ?;";
			else if(author != "")
				sql += " where author = ?;";
			else sql += ";";
			
			pstmt = conn.prepareStatement(sql);
			
			if (title != "") pstmt.setString(1, title);
			else if (author != "") pstmt.setString(2, author);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardBean board = new BoardBean();
				
				board.setBoardID(rs.getInt(1));
				board.setBoardTitle(rs.getString(2));
				board.setBoardContent(rs.getString(3));
				board.setUserID(rs.getString(4));
				board.setBoardTime(rs.getString(5));
				boards.add(board);
			}			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			disconnect();
		}		
		return boards;
	}
	
	public BoardBean getBoard(int boardIdx) {
		connect();
		BoardBean board = null;
		String sql = "select * from board where idx = ?;";
		
		try {
			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1, boardIdx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new BoardBean();
				
				board.setBoardID(rs.getInt(1));
				board.setBoardTitle(rs.getString(2));
				board.setBoardContent(rs.getString(3));
				board.setUserID(rs.getString(4));
				board.setBoardTime(rs.getString(5));
			}			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			disconnect();
		}	
		return board;
	}
}