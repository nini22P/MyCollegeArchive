package entity;

public class Useredit {

	private String Old;

	private String Phone;

	private String Id;

	private String Name;

	private String Password;

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		this.Password = password;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		this.Phone = phone;
	}

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		this.Id = id;
	}

	public String getOld() {
		return Old;
	}

	public void setOld(String old) {
		Old = old;
	}

}
