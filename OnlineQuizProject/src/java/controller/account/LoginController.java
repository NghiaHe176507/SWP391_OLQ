/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.account;

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
 * @author Đạt Phạm
 */
public class LoginController extends HttpServlet {

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
        Account account = db.getAccount(mail, password);
<<<<<<< Updated upstream:OnlineQuizProject/src/java/controller/account/LoginController.java
        if (account != null) { //login succesful
            request.getSession().setAttribute("account", account);
            response.getWriter().println("Login successful");
            
=======
        Account param = new Account();
        param.setMail(mail);
        param.setPassword(password);
        Account loggedUser = db.getAccount(mail, password);
        
          if (loggedUser == null ) {
            request.setAttribute("checkAuthentication", "F");
            request.getRequestDispatcher("view/login.jsp").forward(request, response);
>>>>>>> Stashed changes:OnlineQuizProject/src/java/controller/authentication/LoginController.java
        } else {
            request.getSession().setAttribute("account", null);
            response.getWriter().println("Login failed");

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
