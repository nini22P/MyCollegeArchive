package entity;

public class Order {

	private String Orderid;

	public String getOrderid() {
		return Orderid;
	}

	public void setOrderid(String orderid) {
		Orderid = orderid;
	}

	private String Userid;

	private String Trainid;

	private String Number;

	private String State;

	private String date;

	private String Id;

	private String Name;

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getUserid() {
		return Userid;
	}

	public void setUserid(String userid) {
		Userid = userid;
	}

	public String getTrainid() {
		return Trainid;
	}

	public void setTrainid(String trainid) {
		Trainid = trainid;
	}

	public String getNumber() {
		return Number;
	}

	public void setNumber(String number) {
		Number = number;
	}

	public String getState() {
		return State;
	}

	public void setState(String state) {
		State = state;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String datetime) {
		this.date = datetime;
	}

}
