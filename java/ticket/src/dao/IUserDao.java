package dao;

import entity.User;

public interface IUserDao {

	int insert(User user);

	Object login(User user);

}
