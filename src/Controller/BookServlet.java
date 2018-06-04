package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import Model.Result;
import Utils.GetData;

@WebServlet({"/searchBooks","/bookDetail"})
public class BookServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String action = req.getParameter("action");	
		String url = "/index.jsp";
		if(action.equals("searchBooks")){
			String searchTerm = req.getParameter("search");
			String booksList = GetData.getBooksData(searchTerm);
			Gson gson = new Gson();
			Result books = new Result();
			books =  gson.fromJson(booksList, Result.class);
			req.setAttribute("books", books.getResults());
		}
		else if(action.equals("bookDetail")){
			String selectedBook = req.getParameter("selectedBook");
			String booksList = GetData.getBooksLookup(selectedBook);
			Gson gson = new Gson();
			Result books = new Result();
			books =  gson.fromJson(booksList, Result.class);
			Model.Book book = (books.getResults()).get(0);
			req.setAttribute("book", book);
			url = "/bookDetail.jsp";
		}
		getServletContext()
		.getRequestDispatcher(url)
		.forward(req, resp);
	}


}
