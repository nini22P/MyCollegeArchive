package impl;

import java.util.List;

import dao.IOrderDao;
import entity.Order;
import utils.DBHelper;

public class OrderDao implements IOrderDao {

	@Override
	public List<Object[]> select() {
		String sql = "SELECT order.Orderid,user.Name,user.Phone,train.trainid,train.Carriage,order.Number,train.Seatmode,train.price,order.odate,train.Startcity,train.Start,train.Endcity,train.End,train.Starttime,train.Endtime FROM `order` INNER JOIN `user` ON order.Userid=user.Id INNER JOIN `train` ON order.Trainid=train.Trainid";
		return DBHelper.executeQuery(sql);
	}

	@Override
	public List<Object[]> select0() {
		String sql = "SELECT order.Orderid,user.Name,user.Phone,train.trainid,train.Carriage,order.Number,train.Seatmode,train.price,order.odate,train.Startcity,train.Start,train.Endcity,train.End,train.Starttime,train.Endtime FROM `order` INNER JOIN `user` ON order.Userid=user.Id INNER JOIN `train` ON order.Trainid=train.Trainid where order.State='0'";
		return DBHelper.executeQuery(sql);
	}

	@Override
	public List<Object[]> select1() {
		String sql = "SELECT order.Orderid,user.Name,user.Phone,train.trainid,train.Carriage,order.Number,train.Seatmode,train.price,order.odate,train.Startcity,train.Start,train.Endcity,train.End,train.Starttime,train.Endtime FROM `order` INNER JOIN `user` ON order.Userid=user.Id INNER JOIN `train` ON order.Trainid=train.Trainid where order.State='1'";
		return DBHelper.executeQuery(sql);
	}

	@Override
	public int insert(Order order) {
		String Userid = order.getUserid();
		String Trainid = order.getTrainid();
		String Date = order.getDate();
		String Id = order.getId();
		String Name = order.getName();
		String Number = order.getNumber();
		String State = order.getState();
		String sql = "insert into `order` (Userid,Trainid,Number,State,odate,oname,oid) values ('" + Userid + "','"
				+ Trainid + "','" + Number + "','" + State + "','" + Date + "','" + Name + "','" + Id + "')";
		return DBHelper.execSql(sql);
	}

	@Override
	public int update(Order order) {
		String Orderid = order.getOrderid();
		String State = order.getState();
		System.out.print(State);
		System.out.print(Orderid);
		String sql = "update `order` set State='" + State + "' where Orderid='" + Orderid + "'";
		return DBHelper.execSql(sql);
	}

	@Override
	public List<Object[]> select2(Order order) {
		String Userid = order.getUserid();
		String sql = "SELECT order.Orderid,user.Name,user.Phone,train.trainid,train.Carriage,order.Number,train.Seatmode,train.price,order.odate,train.Startcity,train.Start,train.Endcity,train.End,train.Starttime,train.Endtime FROM `order` INNER JOIN `user` ON order.Userid=user.Id INNER JOIN `train` ON order.Trainid=train.Trainid where order.State='1' and order.Userid='"
				+ Userid + "'";
		return DBHelper.executeQuery(sql);
	}

	@Override
	public List<Object[]> select3(Order order) {
		// TODO Auto-generated method stub
		return null;
	}

}
