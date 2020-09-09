package control;

import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.DAO;
import model.DatabaseConnection;
import model.FoodAndDrink;

@WebServlet("/Control")
public class Control extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Control() {
		super();
	}

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
		ArrayList<FoodAndDrink> list = DAO.getList();
		request.setAttribute("list", list);
		ServletContext FunctionContext = getServletContext();
		String action = request.getParameter("action");
		// request.setCharacterEncoding("UTF-8");
		// request.setCharacterEncoding("UTF-8");
		// response.setContentType("text/html;charset=UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String name123 = request.getParameter("name");
		request.setAttribute("name123", name123);
		if (action.equals("Delete")) {
			// function=request.getParameter("function");
			String id = request.getParameter("id");
			new DAO().del(id);
			response.sendRedirect("foodmanage.jsp");
		} else if (action.equals("Add")) {

			boolean error = false;
			String type = request.getParameter("type");
			String id = request.getParameter("id");
			String name = request.getParameter("name");
//				String image = request.getParameter("image");
			String des = request.getParameter("des");
			String price = request.getParameter("price");

			request.setAttribute("id", id);
			request.setAttribute("name", toUTF8(name));
//				request.setAttribute("image", image);
			request.setAttribute("des", toUTF8(des));
			request.setAttribute("price", price);
			String id_err = "";
			String name_err = "";
			String image_err = "";
			String des_err = "";
			String price_err = "";
			if (id == null || id.equals("")) {
				error = true;
				id_err = "Id's field must be filled up";
				request.setAttribute("id_err", id_err);
			}
			try {
				if (id != null && checkMenu(id) == true) {
					error = true;
					id_err = "Id has been exist";
					request.setAttribute("id_err", id_err);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (name == null || name.equals("")) {
				error = true;
				name_err = "Name's field must be filled up";
				request.setAttribute("name_err", name_err);

			}
//				if(image == null ||image.equals("")){
//					error = true;
//					image_err = "Image's field must be filled up";
//					request.setAttribute("image_err",image_err );
//					
//				}
			if (des == null || des.equals("")) {
				error = true;
				des_err = "Descriptione's field must be filled up";
				request.setAttribute("des_err", des_err);

			}
			if (price != null && check(price) == false) {
				error = true;
				price_err = "The field's value must be in digit's format";
				request.setAttribute("price_err", price_err);

			}
			if (price == null || price.equals("")) {
				error = true;
				price_err = "Price's field must be filled up";
				request.setAttribute("price_err", price_err);
			}
			if (error) {
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/add.jsp");
				rd.forward(request, response);
			} else {
				System.out.println(name);
				double price1 = Double.parseDouble(price);
				FoodAndDrink fd = new FoodAndDrink(type, id, toUTF8(name), "", toUTF8(des), price1);
				new DAO().add(fd);
				response.sendRedirect("foodmanage.jsp");
			}
		} else if (action.equals("Edit")) {
			ServletContext contextID = getServletContext();
			String type = request.getParameter("type");
			String id = request.getParameter("id");
			String name = request.getParameter("name");
//			String image = request.getParameter("image");
			String des = request.getParameter("des");
			String price = request.getParameter("price");
			double price1 = Double.parseDouble(price);
			FoodAndDrink fd = new FoodAndDrink(type, id, toUTF8(name), "", toUTF8(des), price1);
			new DAO().edit(fd, id);
			response.sendRedirect("foodmanage.jsp");
		} else if (action.equals("Search")) {
			String text = request.getParameter("search");
			ArrayList<FoodAndDrink> listSearch = null;
			listSearch = new DAO().search(toUTF8(text));
//			new DAO().search(text);
//			ArrayList<FoodAndDrink> list1 = DAO.getList();
//			request.setAttribute("listSearch", list1);
			request.setAttribute("listSearch", listSearch);
			request.getRequestDispatcher("/foodmanage.jsp").forward(request, response);
		} else if (action.equals("Upload")) {
			String uploadFolder = getServletContext().getRealPath("//upload");
			String rs = null;
			String id = (String) request.getParameter("var");
			String url = "";
			boolean uploadCompleted = false;
			if (ServletFileUpload.isMultipartContent(request)) {
				try {
					List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
					for (FileItem fileItem : multiparts) {
						if (!fileItem.isFormField()) {
							String name = new File(fileItem.getName()).getName();
							File a = new File(uploadFolder);
							if (!a.exists())
								a.mkdir();
							File b = new File(uploadFolder + "/" + name);
							fileItem.write(b);
							rs = name;
							url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
									+ request.getContextPath() + "/upload/" + name;
							System.out.println(id);
							System.out.println(request.getScheme() + "://" + request.getServerName() + ":"
									+ request.getServerPort() + request.getContextPath() + "/upload/" + name);
							System.out.println(b.getCanonicalPath());
							uploadCompleted = true;
						}
					}
				} catch (Exception e) {
					request.setAttribute("message", "File Upload Failed" + e);
				}
			} else {
				request.setAttribute("message", "Sorry! Well done!");
			}
			if (uploadCompleted) {
				// response.sendRedirect("upload/" + rs);
				new DAO().addImage(id, url);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/foodmanage.jsp");
				rd.forward(request, response);
			} else {
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/upload.jsp");
				rd.forward(request, response);
			}

		}

	}

	private boolean checkMenu(String id) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			ResultSet rs = new DatabaseConnection().chonDuLieuTuDTB("select * from food");
			while (rs.next()) {
				if (rs.getString(2).trim().equals(id.trim())) {
					flag = true;
					break;
				} else {
					flag = false;
				}

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	private boolean check(String price) {
		// TODO Auto-generated method stub
		for (int i = 0; i < price.length(); i++) {
			if (Character.isDigit(price.charAt(i))) {
			} else
				return false;
		}
		return true;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
