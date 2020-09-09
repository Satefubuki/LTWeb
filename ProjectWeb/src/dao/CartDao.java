package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.*;

public class CartDao implements IDAO {
//	public static ArrayList<Item> cart = new ArrayList<>();
//	{
//		cart.removeAll(cart);
//		try {
//			ResultSet rs = new DatabaseConnection().chonDuLieuTuDTB("select * from cart");
//			while (rs.next()) {
//				Item t = new Item(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDouble(6),1);
//				cart.add(t);
//			
//			}
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//	}
//	public static ArrayList<Item> getCart() {
//		return cart;
//	}
//
//	public boolean add(Object obj) {
//		Item fd = (Item) obj;
//		String id = fd.getId();
//		if(checkInCart(id) == true){		
//		return true;
//		}else{
//			try {
//				new DatabaseConnection().thucThiCauLenhSQL("insert into cart values('"+fd.getType()+"','"+fd.getId()+"','"+fd.getName()+"','"+fd.getImage()+"','"+fd.getDescription()+"','"+fd.getPrice()+"','"+fd.getQuantity()+"')");
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//		return false;
//	}
//
//	public boolean del(String id) {
//		try {
//			new DatabaseConnection().thucThiCauLenhSQL("delete from cart where id='"+id+"'");
//			return true;
//		} catch (Exception e) {
//			System.out.println(e.getMessage());
//			e.printStackTrace();
//		}
//		return false;
//	}
//	public boolean edit(Object obj,  String id) {
//		FoodAndDrink fd = (FoodAndDrink) obj;
//		try {
//			new DatabaseConnection().thucThiCauLenhSQL("update food set type='"+fd.getType()+"',id='"+fd.getId()+"',name='"+fd.getName()+"',image='"+fd.getImage()+"',description='"+fd.getDescription()+"',price='"+fd.getPrice()+"' where id='"+id+"'");	
//			return true;
//		} catch (Exception e) {
//			System.out.println(e.getMessage());
//			e.printStackTrace();
//		}
//		return false;
//	}
//	public boolean checkInCart(String id) {
//	// TODO Auto-generated method stub
//	boolean flag = false;
//	ResultSet rs;
//	try {
//		rs = new DatabaseConnection().chonDuLieuTuDTB("select * from cart");
//		while (rs.next()){
//			int t = rs.getInt(7);
//			if(rs.getString(2).trim().equals(id.trim())){
//				t++;
//				new DatabaseConnection().thucThiCauLenhSQL("update cart set quantity='"+t+"' where id='"+id+"'");
//			flag = true;
//	}else {
//		flag = false;
//	}
//	}}catch (Exception e) {
//		// TODO Auto-generated catch block
//		e.printStackTrace();
//	
//	}return flag;
//}
//	public void pay() {
//		// TODO Auto-generated method stub
//		try {
//			new DatabaseConnection().thucThiCauLenhSQL("delete from cart");
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//	}
	public static ArrayList<CartDetail> getCartDetail(int id) {
		ArrayList<CartDetail> list = new ArrayList<CartDetail>();
		try {
			ResultSet rs = new DatabaseConnection().chonDuLieuTuDTB(
					"select * from cart,cartdetail where cart.idcart=cartdetail.idcart and cart.idcart=" + id);
			while (rs.next()) {
				CartDetail fd = new CartDetail();
				fd.setIdCart(rs.getInt(4));
				fd.setIdUser(rs.getInt(2));
				fd.setNameFood(rs.getString(5));
				fd.setImage(rs.getString(6));
				fd.setPrice(rs.getDouble(7));
				fd.setQuantity(rs.getInt(8));
				fd.setTotal(rs.getDouble(9));
				list.add(fd);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public static int getSizeCart() {
		int result = 0;
		try {
			ResultSet rs = new DatabaseConnection().chonDuLieuTuDTB("select max(idcart) from cart");
			while (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public static boolean addCartToDB(int iduser, int idcart, ArrayList<FoodAndDrink> list) {
		try {
			new DatabaseConnection().thucThiCauLenhSQL(
					"insert into cart (`idcart`, `iduser`) values(N'" + idcart + "','" + iduser + "')");
			addFoodCartDetail(idcart, list);
//			double total = fnd.getQuantity()*fnd.getPrice();
//			new DatabaseConnection().thucThiCauLenhSQL("insert into cart values(N'"+idcart+"','"+iduser+"','"+fnd.getImage()+"','"+fnd.getPrice()+"','"+fnd.getQuantity()+"','"+total+"','"+fnd.getName()+"')");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return false;

	}

	public static boolean addFoodCartDetail(int idcart, ArrayList<FoodAndDrink> list) {
		try {
			for (FoodAndDrink fnd : list) {
				double total = fnd.getPrice() * fnd.getQuantity();
				new DatabaseConnection().thucThiCauLenhSQL("insert into cartdetail values(N'"
						+ (getSizeCartDetail() + 1) + "','" + idcart + "','" + fnd.getName() + "','" + fnd.getImage()
						+ "','" + fnd.getPrice() + "','" + fnd.getQuantity() + "','" + total + "')");
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return false;
	}

	public static int getSizeCartDetail() {
		int result = 0;
		try {
			ResultSet rs = new DatabaseConnection().chonDuLieuTuDTB("select max(stt) from cartdetail");
			while (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public static ArrayList<FoodAndDrink> cart = new ArrayList<FoodAndDrink>();

	public CartDao() {
	}

	public static ArrayList<FoodAndDrink> getCart() {
		return cart;
	}

	public static ArrayList<Cart> getListCart() {
		ArrayList<Cart> list = new ArrayList<Cart>();
		try {
			ResultSet rs = new DatabaseConnection().chonDuLieuTuDTB("select * from cart order by iduser");
			while (rs.next()) {
				Cart fd = new Cart();
				fd.setIdCart(rs.getInt(1));
				fd.setIdUser(rs.getInt(2));
				list.add(fd);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public static ArrayList<CartDetail> getListCartDetail() {
		ArrayList<CartDetail> list = new ArrayList<CartDetail>();
		try {
			ResultSet rs = new DatabaseConnection().chonDuLieuTuDTB("select * from cartdetail");
			while (rs.next()) {
				CartDetail fd = new CartDetail();
				fd.setStt(rs.getInt(1));
				fd.setIdCart(rs.getInt(2));
				fd.setNameFood(rs.getString(3));
				fd.setImage(rs.getString(4));
				fd.setPrice(rs.getDouble(5));
				fd.setQuantity(rs.getInt(6));
				fd.setTotal(rs.getDouble(7));
				list.add(fd);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public boolean add(Object obj) {
		FoodAndDrink f = (FoodAndDrink) obj;
		if (checkInCart(f.getId()) == true) {
			for (int i = 0; i < cart.size(); i++) {
				if (cart.get(i).getId().trim().equals(((FoodAndDrink) obj).getId().trim()))
					cart.get(i).setQuantity(cart.get(i).getQuantity() + 1);
			}
		} else {
			cart.add(f);

		}
		return false;
	}

	public boolean del(String id) {
		// double it = Double.parseDouble(id);
		for (int i = 0; i < cart.size(); i++) {
			if (cart.get(i).getId().trim().equals(id.trim())) {
				cart.remove(cart.get(i));
			} else {
				System.out.println(false);
			}
		}
		return false;
	}

	public static boolean checkInCart(String id) {
		// TODO Auto-generated method stub
		boolean flag = false;
		for (int i = 0; i < cart.size(); i++) {
			if (cart.get(i).getId().trim().equals(id.trim())) {
				flag = true;
			}
		}
		return flag;
	}

	@Override
	public boolean edit(Object obj, String id) {
		// TODO Auto-generated method stub
		return false;
	}

	public void pay() {
		// TODO Auto-generated method stub
		cart.removeAll(cart);
	}

	public static void main(String[] args) {
//		for (CartDetail c:getCartDetail(7)) {
//			System.out.println(c.toString());
//		}
//		System.out.println(getSizeCart());
	}

}
