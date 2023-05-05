package io.github.nini22p.impl;

import java.util.List;

import io.github.nini22p.dao.IClasssDao;
import io.github.nini22p.entity.Classs;
import io.github.nini22p.utils.DBHelper;

public class ClasssDao implements IClasssDao {

	@Override
	public List<Object[]> select() {
		String sql = "select * from classs";
		return DBHelper.executeQuery(sql);
	}

	@Override
	public int insert(Classs classs) {
		Classs classss = new Classs();
		String name = classss.getName();
		String years = classss.getYears();
		String teacher = classss.getTeacher();
		String classroom = classss.getClassroom();
		String professional = classs.getProfessional();
		String institute = classss.getInstitute();
		String sql = "insert into classs values('" + name + "','" + years + "','" + teacher + "','" + classroom + "','"
				+ professional + "','" + institute + "')";
		return DBHelper.execSql(sql);
	}

	@Override
	public int update(Classs classs) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Classs classs) {
		String name = classs.getName();
		String sql = "delete from classs where name = '" + name + "' ";
		return DBHelper.execSql(sql);
	}

}
