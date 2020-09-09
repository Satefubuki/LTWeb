package model;

public class Cart {
	int iduser;
	int idcart;

//String name;
//String image;
//double price;
//int quantity;
//double total;
	public void setIdUser(int id) {
		this.iduser = id;
	}

	public void setIdCart(int id) {
		this.idcart = id;
	}

//public void setNameFood(String name) {
//	this.name = name;
//}
//public void setImage(String image) {
//	this.image = image;
//}
//public void setPrice(double price) {
//	this.price = price;
//}
//public void setQuantity(int quantity) {
//	this.quantity = quantity;
//}
//public void setTotal(double total) {
//	this.total = total;
//}
	public int getIdUser() {
		return this.iduser;
	}

	public int getIdCart() {
		return this.idcart;
	}

//public String getNameFood() {
//	return this.name;
//}
//public double getPrice() {
//	return this.price;
//}
//public int getQuantity() {
//	return this.quantity;
//}
//public String getImage() {
//	return this.image;
//}
//public double getTotal() {
//	return this.total;
//}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.idcart + " " + this.iduser;
	}
}
