/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authentication;

import dal.ControllerDBContext;
import entity.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author tuann
 */
public class ForgotPassword extends HttpServlet {
    ControllerDBContext db = new ControllerDBContext();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/authentication/forgot.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String password = request.getParameter("password");
        String mail = request.getParameter("gmail");
        ControllerDBContext acc = new ControllerDBContext();

        try {
            if (acc.isEmailExists(mail)) {
                Account accountUpdated = db.getAccountByMail(mail);
                accountUpdated.setPassword(password);
                db.updateAccount(accountUpdated);
                response.sendRedirect(request.getContextPath() + "/login");
            } else {
                request.setAttribute("errorMessage", "Email not found");
                request.getRequestDispatcher("view/authentication/forgot.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            response.sendRedirect("error.jsp");
        }
    }

}
