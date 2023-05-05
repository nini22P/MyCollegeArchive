package impl;

import java.util.List;
import utils.DBHelper;
import dao.ITrainDao;
import entity.Train;

public class TrainDao implements ITrainDao {

	@Override
	public int insert(Train train) {
		String Trainid = train.getTrainid();
		String Startcity = train.getStartcity();
		String Start = train.getStart();
		String Endcity = train.getEndcity();
		String End = train.getEnd();
		String Starttime = train.getStarttime();
		String Endtime = train.getEndtime();
		String Seatmode = train.getSeatmode();
		String Number = train.getNumber();
		String Carriage = train.getCarriage();
		String Price = train.getPrice();
		String sql = "insert into train values('" + Trainid + "','" + Startcity + "','" + Start + "','" + Endcity + "','"
				+ End + "','" + Starttime + "','" + Endtime + "','" + Seatmode + "','" + Number + "','" + Carriage + "','"
				+ Price + "')";
		return DBHelper.execSql(sql);
	}

	@Override
	public int update(Train train) {
		String Old = train.getOld();
		String Startcity = train.getStartcity();
		String Start = train.getStart();
		String Endcity = train.getEndcity();
		String End = train.getEnd();
		String Starttime = train.getStarttime();
		String Endtime = train.getEndtime();
		String Seatmode = train.getSeatmode();
		String Number = train.getNumber();
		String Carriage = train.getCarriage();
		String Price = train.getPrice();
		String sql = "update train set Startcity='" + Startcity + "',Start='" + Start + "',Endcity='" + Endcity + "',End='"
				+ End + "',Starttime='" + Starttime + "',Endtime='" + Endtime + "',Seatmode='" + Seatmode + "',Number='"
				+ Number + "',Carriage='" + Carriage + "',Price='" + Price + "' where Trainid='" + Old + "'";
		return DBHelper.execSql(sql);
	}

	@Override
	public List<Object[]> select() {
		String sql = "select * from train";
		return DBHelper.executeQuery(sql);
	}

	@Override
	public List<Object[]> select1(Train train) {
		String old = train.getOld();
		String sql = "select * from train where Trainid='" + old + "'";
		return DBHelper.executeQuery(sql);
	}

	@Override
	public List<Object[]> select2(Train train) {
		String Startcity = train.getStartcity();
		String Endcity = train.getEndcity();
		String Starttime = train.getStarttime();
		String sql = "select * from train where Startcity='" + Startcity + "' and Endcity='" + Endcity + "' and Starttime='"
				+ Starttime + "'";
		return DBHelper.executeQuery(sql);
	}

}
