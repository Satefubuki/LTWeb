package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.User;
import model.UserDetail;

/**
 * Servlet implementation class LogControl
 */
@WebServlet("/LogControl")
public class LogControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LogControl() {
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
		String action = request.getParameter("action");
		if (action.equals("Login")) {
			String un = request.getParameter("username");
			String ps = request.getParameter("pass");
			String result = "";
			String login_err;
			HttpSession session = request.getSession();
			List<User> list = UserDAO.getListUser();
			for (User u : list) {
				if (u.getName().trim().equals(un)) {
					if (u.getPass().trim().equals(ps)) {
						result = "success";
						User us = new User(u.getId(),un,ps);
						session.setAttribute("us", us);
						session.setAttribute("userNameLogin", un);
						session.setAttribute("pass", ps);
						session.setAttribute("id", u.getId());
						session.setAttribute("userDetail", UserDAO.getUserDetail(u.getId()));
					} else {
						// err = true;
						result = "fail";
						login_err = "Username or password is not correct";
						request.setAttribute("login_err", login_err);
						RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
						rd.forward(request, response);
					}
				}
			}

			session.setAttribute("resultLogin", result);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
		}
		if (action.equals("Register")) {
			boolean err = false;
			PrintWriter pw = response.getWriter();
			String userName = request.getParameter("username");
			String passwd = request.getParameter("pass");
			String rePasswd = request.getParameter("repass");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String email = request.getParameter("email");
			String birthday = request.getParameter("birthday");
			String pass_err = "";
			String user_err = "";
			for (int i = 0; i < UserDAO.getListUser().size(); i++) {
				if (userName.equals(UserDAO.getListUser().get(i).getName().trim())) {
					err = true;
					user_err = "username has been exist";
					request.setAttribute("user_err", user_err);
				}
			}
			if (rePasswd.equals(passwd) == false) {
				err = true;
				pass_err = "retyped password is not correct ";
				request.setAttribute("pass_err", pass_err);
			}
			if (err) {
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/dangky.jsp");
				rd.forward(request, response);
			} else {
				int id = UserDAO.getListUser().size() + 1;
				User u = new User(id, userName, passwd);
				UserDetail ud = new UserDetail(id, toUTF8(name), phone, toUTF8(address), email);
				new UserDAO().addUserDetail(ud);
				new UserDAO().add(u);
//			pw.println("<html>");
//			pw.println("<head><title>Hello Servlet</title></head>");
//			pw.println("<body style=\"text-align:center;color:blue;\">");
//			pw.println("<h1>"+"Hello "+userName+"</h1>");
//			pw.println("<h1>"+"Your name: "+name+"</h1>");
//			pw.println("<h1>"+"Your birthday: "+birthday+"</h1>");
//			pw.println("<h1>"+"Thanks for your register!"+"</h1>");
//			pw.println("</body>");
//			pw.println("<html>");
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
				rd.forward(request, response);
			}
		}
		if (action.equals("Logout")) {
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect("index.jsp");
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
