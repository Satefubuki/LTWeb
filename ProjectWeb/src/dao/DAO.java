package dao;

import java.sql.ResultSet;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.regex.Pattern;

import model.DatabaseConnection;
import model.FoodAndDrink;

public class DAO implements IDAO {
	public static ArrayList<FoodAndDrink> list;
	public static ArrayList<FoodAndDrink> listSearch = new ArrayList<>();

	public static ArrayList<FoodAndDrink> getListSearch() {
		return listSearch;
	}

	public static FoodAndDrink getFood(int id) {
		FoodAndDrink fd = null;
		try {
			ResultSet rs = new DatabaseConnection().chonDuLieuTuDTB("select * from food where id='" + id + "'");
			while (rs.next()) {
				fd = new FoodAndDrink(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getInt(6));

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fd;
	}

	public static ArrayList<FoodAndDrink> getList() {
		list = new ArrayList<>();
		list.removeAll(list);

		try {
			ResultSet rs = new DatabaseConnection().chonDuLieuTuDTB("select * from food");
			while (rs.next()) {
				FoodAndDrink fd = new FoodAndDrink(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getInt(6));
				list.add(fd);

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public boolean add(Object obj) {
		FoodAndDrink fd = (FoodAndDrink) obj;
		try {
			new DatabaseConnection().thucThiCauLenhSQL(
					"insert into food values('" + fd.getType() + "','" + fd.getId() + "',N'" + fd.getName() + "','"
							+ fd.getImage() + "',N'" + fd.getDescription() + "','" + fd.getPrice() + "')");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return false;
	}

	public boolean del(String id) {
		try {
			String id1 = id.trim();
			new DatabaseConnection().thucThiCauLenhSQL("delete from food where id='" + id1 + "'");
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean edit(Object obj, String id) {
		FoodAndDrink fd = (FoodAndDrink) obj;
		try {
			new DatabaseConnection().thucThiCauLenhSQL("update food set type='" + fd.getType() + "',id='" + fd.getId()
					+ "',name='" + fd.getName() + "',description='" + fd.getDescription() + "',price='" + fd.getPrice()
					+ "' where id='" + id + "'");
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

//		public ArrayList<FoodAndDrink> search(String text) {
//			// TODO Auto-generated method stub
//			
//			listSearch.removeAll(listSearch);
//			for(FoodAndDrink f: list){
//				if(f.getName().contains(text)){
//					
//						listSearch.add(f);
//					
//				}
//			}
//			return listSearch;
//		}
	public ArrayList<FoodAndDrink> search(String text) {
		// TODO Auto-generated method stub
		String text1 = removeAccent(text).toLowerCase();
		listSearch.removeAll(listSearch);
		for (FoodAndDrink f : getList()) {
			String text2 = removeAccent(f.getName().toLowerCase()).toLowerCase();
			if (text2.contains(text1)) {

				listSearch.add(f);

			}
		}
		return listSearch;
	}

	public static String removeAccent(String s) {

		String temp = Normalizer.normalize(s, Normalizer.Form.NFD);
		Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
		return pattern.matcher(temp).replaceAll("");
	}

	public void addImage(String id, String url) {
		// TODO Auto-generated method stub
		try {
			new DatabaseConnection().thucThiCauLenhSQL("update food set image='" + url + "' where id='" + id + "'");

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
	}

}
