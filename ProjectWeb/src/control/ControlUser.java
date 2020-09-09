package control;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import dao.UserDAO;
import model.FoodAndDrink;
import model.User;
import model.UserDetail;

/**
 * Servlet implementation class ControlUser
 */
@WebServlet("/ControlUser")
public class ControlUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControlUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public static String toUTF8(String isoString) {
		String utf8string = null;
		try {
			byte[] stringBytesIso = isoString.getBytes("ISO-8859-1");
			utf8string = new String(stringBytesIso, "UTF-8");
		} catch (Exception e) {

		}
		return utf8string;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String action = request.getParameter("action");
		if (action.equals("Edit")) {
			ServletContext contextID = getServletContext();
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
//			String image = request.getParameter("image");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String email = request.getParameter("email");
			UserDetail ud = new UserDetail(id, toUTF8(name), phone, toUTF8(address), email);
			new UserDAO().edit(ud, id + "");
			HttpSession session = request.getSession();
			session.setAttribute("userDetail", ud);
			response.sendRedirect("foodmanage.jsp");
		}else if(action.equals("changepass")) {
			HttpSession session = request.getSession();
			User u =(User) session.getAttribute("us");
			String oldpw = request.getParameter("oldpass");
			String newpw = request.getParameter("newpass");
			String pwsession =(String) session.getAttribute("pass");
			if(!pwsession.equals(oldpw)) {
				response.sendRedirect("changepass.jsp");
			}else {
				new UserDAO().edit(u, newpw,u.getId()+"");
				response.sendRedirect("logout.jsp");
			}
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
