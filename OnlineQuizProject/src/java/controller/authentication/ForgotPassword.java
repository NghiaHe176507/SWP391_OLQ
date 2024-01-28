/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authentication;

import dal.AccountDBContext;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author tuann
 */
public class ForgotPassword extends HttpServlet {

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
        AccountDBContext acc = new AccountDBContext();

        try {
            if (acc.isEmailExists(mail)) {
                Account accountUpdated = new Account();
                accountUpdated.setMail(mail);
                accountUpdated.setPassword(password);
                acc.updatePasswordAccount(accountUpdated);
                request.getRequestDispatcher("view/authentication/register.jsp").forward(request, response); // Redirect to a success page
            } else {
                request.setAttribute("errorMessage", "Email not found");
                request.getRequestDispatcher("view/authentication/forgot.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            response.sendRedirect("error.jsp");
        }
    }

}
