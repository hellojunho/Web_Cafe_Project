package manager;

import java.util.List;

import dao.BoardDao;
import model.BoardBean;

public class BoardManager {
private BoardManager() {}
	
	private static class InnerInstanceClazz {
		private static final BoardManager instance = new BoardManager();
	}
	public static BoardManager getInstance() {
		return InnerInstanceClazz.instance;
	}
	
	public boolean register(String title, String content, String user_id) {
		BoardDao da = new BoardDao();
		return da.register(title, content, user_id);
	}
	
	public List<BoardBean> getBoards(String title, String author) {
		BoardDao da = new BoardDao();
		return da.getBoards(title, author);
	}
	
	public BoardBean getBoard(int boardIdx) {
		BoardDao da = new BoardDao();
		return da.getBoard(boardIdx);
	}
	
	public boolean update(String board_id, String title, String content, String user_id) {
		BoardDao dao = new BoardDao();
		return dao.update(board_id, title, content, user_id);
	}
	
	public boolean delete(String title) {
		BoardDao dao = new BoardDao();
		return dao.delete(title);
	}
}