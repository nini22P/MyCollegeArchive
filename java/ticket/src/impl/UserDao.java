package impl;

import dao.IUserDao;
import entity.User;
import utils.DBHelper;

public class UserDao implements IUserDao {

	@Override
	public int insert(User user) {
		String Id = user.getId();
		String Password = user.getPassword();
		String Name = user.getName();
		String Id1 = user.getId1();
		String Phone = user.getPhone();
		String sql = "insert into user values('" + Id + "','" + Password + "','" + Name + "','" + Phone + "','" + Id1
				+ "')";
		return DBHelper.execSql(sql);
	}

	@Override
	public Object login(User user) {
		String Id = user.getId();
		String Password = user.getPassword();
		String sql = "select * from user where Id='" + Id + "' and Password='" + Password + "'";
		return DBHelper.execScalar(sql);
	}

}
