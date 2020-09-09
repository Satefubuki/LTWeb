package model;

public class UserDetail {
	int iduser;
	String name;
	String phone;
	String address;
	String email;

	public UserDetail() {

	}

	public UserDetail(int iduser, String name, String phone, String address, String email) {
		this.iduser = iduser;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.email = email;
	}

	public void setId(int id) {
		this.iduser = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setAddress(String add) {
		this.address = add;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getId() {
		return this.iduser;
	}

	public String getName() {
		return this.name;
	}

	public String getPhone() {
		return this.phone;
	}

	public String getAddress() {
		return this.address;
	}

	public String getEmail() {
		return this.email;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.iduser + this.name;
	}
}
