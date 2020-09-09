package control;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDao;
import model.DatabaseConnection;
import model.FoodAndDrink;
import model.Item;

/**
 * Servlet implementation class CartControl
 */
@WebServlet("/CartControl")
public class CartControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if (action.equals("Add")) {
			HttpSession session = request.getSession();
			if (session.getAttribute("userNameLogin") == null) {
				response.sendRedirect("login.jsp");
			} else {
				String id = request.getParameter("index");
				try {
					ResultSet rs = new DatabaseConnection().chonDuLieuTuDTB("select * from food where id='" + id + "'");
					while (rs.next()) {
						int i = 1;
						FoodAndDrink f = new FoodAndDrink(rs.getString(1), rs.getString(2), rs.getString(3),
								rs.getString(4), rs.getString(5), rs.getDouble(6));
						new CartDao().add(f);
						// System.out.println(CartDao.getCart().size());

					}
				} catch (Exception e) {
					// Xử lý ngoại lệ, trong trường hợp này là Connection có thể là null, hoặc câu
					// lệnh SQL không đúng
				}
				response.sendRedirect("cart.jsp");
			}
		}
		if (action.equals("Delete")) {
			String id = request.getParameter("index");
			new CartDao().del(id);
			// System.out.println(CartDao.getCart().size());
			response.sendRedirect("cart.jsp");
		}
		if (action.equals("Pay")) {
			// new CartDao().pay();
			// System.out.println(CartDao.getCart().size());
			HttpSession session = request.getSession();
			ArrayList<FoodAndDrink> list = new CartDao().getCart();
			CartDao.addCartToDB((int) session.getAttribute("id"), CartDao.getSizeCart() + 1, list);
//		for (FoodAndDrink fnd:list) {
//			int c = CartDao.getSizeCart()+1;
//			CartDao.addCartToDB((int)session.getAttribute("id"),CartDao.getSizeCart()+1, fnd);
//		}
			new CartDao().pay();
			response.sendRedirect("cart.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
