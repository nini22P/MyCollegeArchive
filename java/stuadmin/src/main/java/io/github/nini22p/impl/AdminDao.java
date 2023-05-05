package io.github.nini22p.impl;

import io.github.nini22p.dao.IAdminDao;
import io.github.nini22p.entity.Admin;
import io.github.nini22p.utils.DBHelper;

public class AdminDao implements IAdminDao {

	public Object select(Admin admin) {
		// TODO Auto-generated method stub
		String user = admin.getUsername();
		String pass = admin.getPassword();
		String sql = "select count(*) from admin where username='" + user + "' and password='" + pass + "'";
		return DBHelper.execScalar(sql);
	}

}
