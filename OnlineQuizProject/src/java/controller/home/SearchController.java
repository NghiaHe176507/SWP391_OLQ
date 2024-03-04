package controller.home;

import dal.ControllerDBContext;
import dal.GroupDBContext;
import entity.Group;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SearchController extends HttpServlet {
    
    ControllerDBContext db = new ControllerDBContext();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String keyword = request.getParameter("searchQuery");

        // Gọi hàm searchGroup từ GroupDBContext để tìm kiếm
        GroupDBContext gb = new GroupDBContext();
        ArrayList<Group> searchResults = db.searchGroup(keyword);

        // Đặt kết quả tìm kiếm vào attribute của request để truyền cho JSP
        request.setAttribute("searchResults", searchResults);

        // Chuyển hướng đến trang JSP để hiển thị kết quả
        response.sendRedirect("result.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
