/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.group;

import controller.authentication.BasedRequiredAuthenticationController;
import dal.ControllerDBContext;
import dal.GroupDBContext;
import entity.Account;
import entity.Group;
import entity.Register;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.time.LocalDate;

/**
 *
 * @author PC
 */
public class UnenrollGroupForStudent extends BasedRequiredAuthenticationController {

    ControllerDBContext db = new ControllerDBContext();
    GroupDBContext GroupDB = new GroupDBContext();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account LoggedUser)
            throws ServletException, IOException {
        Register newRegister = new Register();
        Group groupNeedToUnenroll = GroupDB.getById(request.getParameter("groupId"));

        newRegister.setGroup(groupNeedToUnenroll);
        newRegister.setStudentInfo(db.getAccountInfoByAccountId(LoggedUser.getAccountId()));
// Kiểm tra trạng thái sinh viên trong lớp trước khi unenroll
        boolean hasActivitiesInGroup = db.checkStudentActivitiesInGroupByRegister(newRegister);

        if (!hasActivitiesInGroup) {
            // Nếu sinh viên có hoạt động trong lớp, tiến hành unenroll và đặt successMessage
            db.unEnrollForStudent(newRegister);
            HttpSession session = request.getSession();
            session.setAttribute("successMessage", "You have successfully unenrolled from the group.");
        } else {
            // Nếu sinh viên không có hoạt động trong lớp hoặc có lỗi xảy ra, đặt errorMessage
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "You cannot unenroll from an active group.");
        }

        response.sendRedirect(request.getContextPath() + "/home");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        processRequest(request, response, LoggedUser);
    }

}
