package io.github.nini22p.impl;

import java.util.List;

import io.github.nini22p.dao.ITeacherDao;
import io.github.nini22p.entity.Teacher;
import io.github.nini22p.utils.DBHelper;

public class TeacherDao implements ITeacherDao {

	@Override
	public List<Object[]> select() {
		String sql = "select * from teacher";
		return DBHelper.executeQuery(sql);
	}

	@Override
	public int insert(Teacher teacher) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Teacher teacher) {
		// TODO Auto-generated method stub
		return 0;
	}

}
