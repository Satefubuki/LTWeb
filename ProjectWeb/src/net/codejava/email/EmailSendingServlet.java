package net.codejava.email;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;

/**
 * A servlet that takes message details from user and send it as a new e-mail
 * through an SMTP server.
 * 
 * @author www.codejava.net
 * 
 */
@WebServlet("/EmailSendingServlet")
public class EmailSendingServlet extends HttpServlet {
	private String host;
	private String port;
	private String user;
	private String pass;

	public void init() {
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		user = context.getInitParameter("user");
		pass = context.getInitParameter("pass");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		ArrayList<CartDetail> list = (ArrayList<CartDetail>) session.getAttribute("listCartDetail");
		UserDetail ud = (UserDetail) session.getAttribute("userdetail");
		String ctn = "";
		String tab = "						";
		String space = "---------------------------------------------------------";
		String product = "";
		double cost = 0;
		for (CartDetail cd : list) {
			cost += cd.getTotal();
			product += cd.getNameFood() + tab + tab + cd.getPrice() + tab + cd.getQuantity() + tab + cd.getTotal()
					+ '\n';
		}
		product += tab + "Gia tri giao hang" + tab + tab + tab + cost;

		ctn += "Xin chao " + ud.getName() + '\n' + "San pham trong don hang #" + list.get(0).getIdCart()
				+ " cua Anh/chi tai The Restaurant se duoc giao hang toi dia chi nhan hang theo thong tin sau:" + '\n'
				+ space + '\n' + "Thong tin giao hang:" + '\n' + space + '\n' + "Ma don hang: #"
				+ list.get(0).getIdCart() + tab + "Ngay tao don: " + new Date().toString() + '\n'
				+ "Thong tin nguoi nhan:" + '\n' + "Ho va ten: " + ud.getName() + '\n' + "So dien thoai: "
				+ ud.getPhone() + '\n' + "Dia chi: " + ud.getAddress() + '\n' + space + '\n' + "Hinh thuc van chuyen: "
				+ '\n' + "Cuoc tu 5$ den toi da 10$" + '\n' + space + '\n' + "San pham duoc giao" + tab + "Gia mon an"
				+ tab + "So luong" + tab + "Tong tien" + '\n' + product + '\n' + space + '\n'
				+ "Ban chua nhan duoc mon an, xin vui long lien lac voi chung toi qua dia chi 16130287@st.hcmuaf.edu.vn";
		// reads form fields
		String recipient = ud.getEmail();
		String subject = "Xac nhan giao van cho don hang #" + list.get(0).getIdCart()
				+ "-The Restaurant tu The Restaurant";
		String content = ctn;

		String resultMessage = "";

		try {
			EmailUtility.sendEmail(host, port, user, pass, recipient, subject, content);
			resultMessage = "The e-mail was sent successfully";
		} catch (Exception ex) {
			ex.printStackTrace();
			resultMessage = "There were an error: " + ex.getMessage();
		} finally {
			request.setAttribute("Message", resultMessage);
			getServletContext().getRequestDispatcher("/Result.jsp").forward(request, response);
		}
	}
}