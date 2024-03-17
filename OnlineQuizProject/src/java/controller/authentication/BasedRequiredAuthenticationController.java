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
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URL;

/**
 *
 * @author Đạt Phạm
 */
@WebServlet(name = "BaseRequiredAuthenController", urlPatterns = {"/BaseRequiredAuthenController"})
public abstract class BasedRequiredAuthenticationController extends HttpServlet {

    private boolean isAuthenticated(HttpServletRequest request) {
        Account account = (Account) request.getSession().getAttribute("account");
        if (account != null) {
            return true;
        } else {
            String mail = null;
            String password = null;
            Cookie[] cookies = request.getCookies();
            for (Cookie cooky : cookies) {
                if (mail != null && password != null) {
                    break;
                }
                if (cooky.equals("mail")) {
                    mail = cooky.getValue();
                }
                if (cooky.equals("password")) {
                    password = cooky.getValue();
                }
            }

            if (mail != null && password != null) {
                AccountDBContext db = new AccountDBContext();
                Account param = new Account();
                param.setMail(mail);
                param.setPassword(password);
                account = db.getAccount(mail, password);
                if (account != null) {
                    request.getSession().setAttribute("account", account);
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String currentUrl = request.getRequestURL().toString();
        URL url = new URL(currentUrl);
        if (isAuthenticated(request)) {
            //login
            doGet(request, response, (Account) request.getSession().getAttribute("account"));
        } else {
            if (url.getPath() == null ? (request.getContextPath()+"/") == null : url.getPath().equals(request.getContextPath()+"/")) {
                request.getRequestDispatcher("view/controllerHome/home.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/login");
            }
        }
    }

    protected abstract void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser)
            throws ServletException, IOException;

    protected abstract void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser)
            throws ServletException, IOException;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String currentUrl = request.getRequestURL().toString();
        URL url = new URL(currentUrl);
        if (isAuthenticated(request)) {
            //login
            doGet(request, response, (Account) request.getSession().getAttribute("account"));
        } else {
            if (url.getPath() == null ? (request.getContextPath()+"/") == null : url.getPath().equals(request.getContextPath()+"/")) {
                request.getRequestDispatcher("view/controllerHome/home.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/login");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
