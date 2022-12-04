package model;

public class BoardBean {
	private int board_id;
	private String board_title;
	private String board_content;
	private String board_time;
	private String board_user_id;

	public int getBoardID() { return board_id; }
	
	public void setBoardID(int board_id) { this.board_id = board_id; }

	public String getBoardTitle() { return board_title; }

	public void setBoardTitle(String board_title) { this.board_title = board_title; }

	public String getBoardContent() { return board_content; }

	public void setBoardContent(String board_content) { this.board_content = board_content; }

	public String getBoardTime() { return board_time; }

	public void setBoardTime(String board_time) { this.board_time = board_time; }

	public String getUserID() { return board_user_id; }

	public void setUserID(String board_user_id) { this.board_user_id = board_user_id; }

}