package io.github.nini22p.dao;

import java.util.List;

import io.github.nini22p.entity.Teacher;

public interface ITeacherDao {

	List<Object[]> select();

	int insert(Teacher teacher);

	int update(Teacher teacher);

}
