package manager;

import dao.UserDao;
import model.UserBean;

public class UserBeanManager {
	/**
	 * 싱글톤 기법
	 */
	private UserBeanManager() {}
	
	private static class InnerInstanceClazz {
		private static final UserBeanManager instance = new UserBeanManager();
	}
	public static UserBeanManager getInstance() {
		return InnerInstanceClazz.instance;
	}
	
	public boolean signUp(String id, String pw, String name) {
		UserDao da = new UserDao();
		return da.signUp(id, pw, name);
	}
	
	public boolean signIn(String id, String pw) {
		UserDao da = new UserDao();
		return da.signIn(id, pw);
	}
	
	public UserBean getUser(String id) {
		UserDao da = new UserDao();
		return da.getUser(id);
	}
}