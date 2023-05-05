package impl;

import utils.DBHelper;
import entity.Admin;
import dao.IAdminDao;

public class AdminDao implements IAdminDao {

	@Override
	public Object select(Admin admin) {
		String Id = admin.getId();
		String Password = admin.getPassword();
		System.out.println(Password);
		System.out.println(Id);
		String sql = "select * from admin where Id='" + Id + "' and Password='" + Password + "'";
		return DBHelper.execScalar(sql);
	}

}
