/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authentication;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author hatua
 */
public class ValidateOtp extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Concatenate OTP digits to form the complete OTP
        StringBuilder otpBuilder = new StringBuilder();
        for (int i = 1; i <= 6; i++) {
            otpBuilder.append(request.getParameter("digit" + i));
        }
        int value = Integer.parseInt(otpBuilder.toString());

        HttpSession session = request.getSession();
        int otp = (int) session.getAttribute("otp");

        RequestDispatcher dispatcher = null;

        if (value == otp) {
            // OTP verification successful
            // Proceed with your logic here
            request.setAttribute("email", request.getParameter("email"));
            request.setAttribute("status", "success");
            dispatcher = request.getRequestDispatcher("view/authentication/newPassword.jsp");
            dispatcher.forward(request, response);
        } else {
            // OTP verification failed
            request.setAttribute("message", "Wrong OTP");
            dispatcher = request.getRequestDispatcher("view/authentication/enterOtp.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
