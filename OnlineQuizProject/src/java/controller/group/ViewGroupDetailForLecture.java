/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.group;

import controller.authentication.BasedRequiredAuthenticationController;
import dal.ControllerDBContext;
import entity.Account;
import entity.AccountInfo;
import entity.Exam;
import entity.Group;
import entity.Register;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author nghia
 */
public class ViewGroupDetailForLecture extends BasedRequiredAuthenticationController {

    ControllerDBContext db = new ControllerDBContext();

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
        response.setContentType("text/html;charset=UTF-8");
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

        int lecturerId = LoggedUser.getAccountId();
        AccountInfo accountInfo = db.getAccountInfoByAccountId(lecturerId);
        ArrayList<Group> listGroupOwned = db.getListGroupOwnedByLectureId(accountInfo.getAccountInfoId());

        String groupIdStr = request.getParameter("groupId");
        int groupId = Integer.parseInt(groupIdStr);

        String topicIdStr = request.getParameter("topicId");
        int topicId = Integer.parseInt(topicIdStr);

        ArrayList<Exam> listExamOfGroup = db.getListExamByGroupId(groupId);
        for (Exam exam : listExamOfGroup) {
            db.updateStatusExamToFitRealTime(exam);
        }
        request.setAttribute("listGroup", listGroupOwned);
        request.setAttribute("topicId", topicId);
        request.setAttribute("groupId", groupId);
        request.setAttribute("listExamOfGroup", listExamOfGroup);
        request.getRequestDispatcher("view/controllerGroup/GroupDetailForLecture.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
