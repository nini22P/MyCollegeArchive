package io.github.nini22p.dao;

import java.util.List;

import io.github.nini22p.entity.Students;

public interface IStudentsDao {

	List<Object[]> select();

	int insert(Students students);

	int update(Students students);

	int delete(Students students);

}
