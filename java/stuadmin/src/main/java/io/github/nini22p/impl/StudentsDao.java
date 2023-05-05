package io.github.nini22p.impl;

import java.util.List;

import io.github.nini22p.dao.IStudentsDao;
import io.github.nini22p.entity.Students;
import io.github.nini22p.utils.DBHelper;

public class StudentsDao implements IStudentsDao {

	public List<Object[]> select() {
		String sql = "select * from students";
		return DBHelper.executeQuery(sql);
	}

	public int insert(Students students) {
		String id = students.getId();
		String username = students.getUsername();
		String sex = students.getSex();
		String classs = students.getClasss();
		String professional = students.getProfessional();
		String institute = students.getInstitute();
		String sql = "insert into students values('" + id + "','" + username + "','" + sex + "','" + classs + "','"
				+ professional + "','" + institute + "')";
		return DBHelper.execSql(sql);

	}

	public int update(Students students) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Students students) {
		String id = students.getId();
		String sql = "delete from students where id = '" + id + "' ";
		return DBHelper.execSql(sql);
	}

}
