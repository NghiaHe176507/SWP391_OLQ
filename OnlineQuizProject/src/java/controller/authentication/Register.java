/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authentication;

import dal.AccountDBContext;
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
public class Register extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/authentication/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String displayname = request.getParameter("username");
        String password = request.getParameter("password");
        String mail = request.getParameter("gmail");
        ControllerDBContext acc = new ControllerDBContext();
        if (acc.isEmailExists(mail)) {
            // Email already exists, redirect back to register page with an error message
            request.setAttribute("errorMessage", "Gmail has already been registered");
            request.getRequestDispatcher("view/authentication/register.jsp").forward(request, response);
        } else {
            // Email does not exist, proceed with registration
            Account newAccount = new Account();
            newAccount.setMail(mail);
            newAccount.setPassword(password);
            newAccount.setDisplayName(displayname);

            acc.registerNewAccount(newAccount);

            // Display success message
            response.getWriter().println("Account created successfully!");
        }
    }

}
