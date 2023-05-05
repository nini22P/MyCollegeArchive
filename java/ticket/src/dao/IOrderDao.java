package dao;

import java.util.List;
import entity.Order;

public interface IOrderDao {

	List<Object[]> select();

	List<Object[]> select0();

	List<Object[]> select1();

	List<Object[]> select2(Order order);

	List<Object[]> select3(Order order);

	int insert(Order order);

	int update(Order order);

}
