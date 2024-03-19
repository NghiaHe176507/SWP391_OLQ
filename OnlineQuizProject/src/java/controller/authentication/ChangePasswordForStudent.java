/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authentication;

import dal.ControllerDBContext;
import entity.Account;
import entity.RoleAccess;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author hatua
 */
public class ChangePasswordForStudent extends BasedAuthorizationController {

    ControllerDBContext db = new ControllerDBContext();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/authentication/changePasswordStudent.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser, ArrayList<RoleAccess> roles)
            throws ServletException, IOException {
        String newPassword = request.getParameter("newPassword");
        String currentPassword = request.getParameter("currentPassword");

        // Check if the provided current password matches the password stored in the database
        if (LoggedUser != null && LoggedUser.getPassword().equals(currentPassword)) {
            // Current password matches, proceed with updating the password
            LoggedUser.setPassword(newPassword);
            db.updateAccount(LoggedUser);
            // Password updated successfully, you can redirect or display a success message
            request.setAttribute("success", "Password updated successfully");
            request.getRequestDispatcher("view/authentication/changePasswordLecture.jsp").forward(request, response);
        } else {
            // Current password does not match, display an error message
            request.setAttribute("error", "Current password does not match");
            request.getRequestDispatcher("view/authentication/changePasswordStudent.jsp").forward(request, response);
        }
    }

}
