package impl;

import java.util.List;

import dao.IUsereditDao;
import entity.Useredit;
import utils.DBHelper;

public class UsereditDao implements IUsereditDao {

	@Override
	public int update(Useredit useredit) {
		String Old = useredit.getOld();
		String Phone = useredit.getPhone();
		String Name = useredit.getName();
		String Password = useredit.getPassword();
		String sql = "update user set Phone = '" + Phone + "',Name = '" + Name + "',Password = '" + Password
				+ "' where Id = '" + Old + "'";
		return DBHelper.execSql(sql);
	}

	@Override
	public List<Object[]> selectbyphone(String phone) {
		String sql = ("select * from user where Phone='" + phone + "'");
		return DBHelper.executeQuery(sql);
	}

	@Override
	public List<Object[]> selectbyid(String id) {
		String sql = ("select * from user where Id='" + id + "'");
		return DBHelper.executeQuery(sql);
	}

}
