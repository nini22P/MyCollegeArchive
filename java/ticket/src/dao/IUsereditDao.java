package dao;

import java.util.List;

import entity.Useredit;

public interface IUsereditDao {

	int update(Useredit useredit);

	List<Object[]> selectbyphone(String phone);

	List<Object[]> selectbyid(String id);

}
