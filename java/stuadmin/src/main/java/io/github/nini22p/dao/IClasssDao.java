package io.github.nini22p.dao;

import java.util.List;
import io.github.nini22p.entity.Classs;

public interface IClasssDao {

	List<Object[]> select();

	int insert(Classs classs);

	int update(Classs classs);

	int delete(Classs classs);

}
