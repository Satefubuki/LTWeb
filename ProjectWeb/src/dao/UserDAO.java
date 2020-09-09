package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import model.*;

public class UserDAO implements IDAO {
	public static ArrayList<User> listUser = new ArrayList<>();

	public static UserDetail getUserDetail(int iduser) {
		UserDetail ud = new UserDetail();
		try {
			ResultSet rs = new DatabaseConnection().chonDuLieuTuDTB("select * from userdetail where iduser=" + iduser);
			while (rs.next()) {
				ud.setId(rs.getInt(1));
				ud.setName(rs.getString(2));
				ud.setPhone(rs.getString(3));
				ud.setAddress(rs.getString(4));
				ud.setEmail(rs.getString(5));

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ud;
	}

	public static ArrayList<User> getListUser() {
		listUser.removeAll(listUser);
		try {
			ResultSet rs = new DatabaseConnection().chonDuLieuTuDTB("select * from users");
			while (rs.next()) {
				User fd = new User(rs.getInt(1), rs.getString(2), rs.getString(3));
				listUser.add(fd);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listUser;
	}

	public boolean addUserDetail(Object obj) {
		UserDetail fd = (UserDetail) obj;
		try {
			new DatabaseConnection().thucThiCauLenhSQL(
					"INSERT INTO `userdetail` (`iduser`, `fullname`, `phone`, `address`, `email`) VALUES ('"
							+ fd.getId() + "', N'" + fd.getName() + "', '" + fd.getPhone() + "', N'" + fd.getAddress()
							+ "', '" + fd.getEmail() + "');");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return false;
	}

	@Override
	public boolean add(Object obj) {
		User fd = (User) obj;
		try {
			new DatabaseConnection().thucThiCauLenhSQL(
					"insert into users values(N'" + fd.getId() + "','" + fd.getName() + "','" + fd.getPass() + "')");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return false;
	}

	@Override
	public boolean del(String id) {
		// TODO Auto-generated method stub
		int id1 = Integer.parseInt(id);
		try {
			new DatabaseConnection().thucThiCauLenhSQL("delete from users where id='" + id1 + "'");
			new DatabaseConnection().thucThiCauLenhSQL("delete from userdetail where iduser='" + id1 + "'");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean edit(Object obj, String id) {
		// TODO Auto-generated method stub
		UserDetail fd = (UserDetail) obj;
		try {
			new DatabaseConnection().thucThiCauLenhSQL("update userdetail set iduser='" + fd.getId() + "',fullname=N'"
					+ fd.getName() + "',phone='" + fd.getPhone() + "',address=N'" + fd.getAddress() + "',email='"
					+ fd.getEmail() + "' where iduser='" + id + "'");
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return false;
	}
	public boolean edit(User u, String pass,String id) {
		try {
			new DatabaseConnection().thucThiCauLenhSQL("update users set pass='" + pass + "' where id='" + id + "'");
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public static void main(String[] args) {
//		for (UserDetail f:UserDAO.getUserDetail(1)) {
//			System.out.println(f.toString());
//		}
//		System.out.println(getUserDetail(1).toString());
//		addUserDetail()

	}

}
