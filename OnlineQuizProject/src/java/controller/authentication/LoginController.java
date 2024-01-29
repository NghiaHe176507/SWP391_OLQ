/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authentication;

import controller.account.*;
import dal.AccountDBContext;
import dal.ControllerDBContext;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Đạt Phạm
 */
public class LoginController extends HttpServlet {

    ControllerDBContext dB = new ControllerDBContext();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/login/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mail = request.getParameter("mail");
        String password = request.getParameter("password");
        AccountDBContext db = new AccountDBContext();
        Account loggedUser = db.getAccount(mail, password);

        if (loggedUser == null) {
            request.setAttribute("checkAuthentication", "F");
            request.getRequestDispatcher("view/login/login.jsp").forward(request, response);
        } else {
            loggedUser = dB.getAccountByMail(mail);
            String remember = request.getParameter("remember");
            HttpSession session = request.getSession();
            session.setAttribute("account", loggedUser);
            if (remember != null) {
                Cookie c_mail = new Cookie("user", mail);
                Cookie c_pass = new Cookie("pass", password);
                c_mail.setMaxAge(3600 * 24);
                c_pass.setMaxAge(3600 * 24);
                response.addCookie(c_mail);
                response.addCookie(c_pass);
            }
            response.sendRedirect(request.getContextPath() + "/home");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
