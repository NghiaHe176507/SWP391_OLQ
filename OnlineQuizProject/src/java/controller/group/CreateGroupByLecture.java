/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.group;

import controller.authentication.BasedRequiredAuthenticationController;
import dal.AccountDBContext;
import dal.AccountInfoDBContext;
import dal.ControllerDBContext;
import dal.StatusDBContext;
import dal.TopicDBContext;
import entity.Account;
import entity.Group;
import entity.Status;
import entity.Topic;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class CreateGroupByLecture extends BasedRequiredAuthenticationController {

    ControllerDBContext db = new ControllerDBContext();
    AccountInfoDBContext accountInfoDB = new AccountInfoDBContext();
    AccountDBContext accountDB = new AccountDBContext();
    StatusDBContext statusDB = new StatusDBContext();
    TopicDBContext topicDB = new TopicDBContext();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        ArrayList<Status> listStatus = db.getListStatus();
        ArrayList<Topic> listTopic = db.getListTopic();
        request.setAttribute("listTopic", listTopic);
        request.getRequestDispatcher("/view/ControllerGroup/CreateGroupByLecture.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        
        Topic topic = topicDB.getById(request.getParameter("topicId"));
        Status status = statusDB.getById("2");
        String groupName = request.getParameter("groupName");
        
        Group newGroup = new Group();
        newGroup.setGroupName(groupName);
        newGroup.setLectureInfo(db.getAccountInfoByAccountId(LoggedUser.getAccountId()));
        newGroup.setTopic(topic);
        newGroup.setStatus(status);
        
        db.createNewGroupByLecture(newGroup);
        
        response.sendRedirect("GroupOwned");
    }

}
