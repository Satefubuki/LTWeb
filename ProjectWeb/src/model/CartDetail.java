package model;

public class CartDetail {
	int stt;
	int idcart;
	int iduser;
	String name;
	String image;
	double price;
	int quantity;
	double total;

	public void setStt(int id) {
		this.stt = id;
	}

	public void setIdCart(int id) {
		this.idcart = id;
	}

	public void setIdUser(int id) {
		this.iduser = id;
	}

	public void setNameFood(String name) {
		this.name = name;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public int getStt() {
		return this.stt;
	}

	public int getIdCart() {
		return this.idcart;
	}

	public int getIdUser() {
		return this.iduser;
	}

	public String getNameFood() {
		return this.name;
	}

	public double getPrice() {
		return this.price;
	}

	public int getQuantity() {
		return this.quantity;
	}

	public String getImage() {
		return this.image;
	}

	public double getTotal() {
		return this.total;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.stt + this.idcart + this.name + this.image + this.price + this.quantity + this.total;
	}
}
