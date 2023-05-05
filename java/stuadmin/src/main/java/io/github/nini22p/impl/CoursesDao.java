package io.github.nini22p.impl;

import java.util.List;

import io.github.nini22p.dao.ICoursesDao;
import io.github.nini22p.entity.Courses;
import io.github.nini22p.utils.DBHelper;

public class CoursesDao implements ICoursesDao {

	@Override
	public List<Object[]> select() {
		String sql = "select * from courses";
		return DBHelper.executeQuery(sql);
	}

	@Override
	public int insert(Courses courses) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Courses courses) {
		// TODO Auto-generated method stub
		return 0;
	}

}
