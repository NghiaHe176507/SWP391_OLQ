package controller.home;

import dal.ControllerDBContext;
import entity.Group;
import entity.Register;
import entity.Topic;
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
        String keyword = request.getParameter("query");
        ArrayList<Group> searchResults = db.searchGroup(keyword);
        ArrayList<Topic> searchTopic = db.searchTopic(keyword);
        ArrayList<Register> searchRegister = db.searchRegister(keyword);
        
        request.setAttribute("searchTopic", searchTopic);
        request.setAttribute("searchResults", searchResults);
        request.setAttribute("searchRegister", searchRegister);

        request.getRequestDispatcher("view/home/result.jsp").forward(request, response);
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
