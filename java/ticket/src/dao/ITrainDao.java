package dao;

import java.util.List;

import entity.Train;

public interface ITrainDao {

	int insert(Train train);

	int update(Train train);

	List<Object[]> select();

	List<Object[]> select1(Train train);

	List<Object[]> select2(Train train);

}
