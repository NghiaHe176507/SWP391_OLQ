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
import jakarta.servlet.http.HttpSession;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mail = request.getParameter("email");
        int otpValue = 0;
        HttpSession mySession = request.getSession();
        Account account = db.getAccountByMail(mail);

        if (account != null) {
            // sending otp
            Random rand = new Random();
            otpValue = rand.nextInt(900000) + 100000;

            String to = mail;// change accordingly
            // Get the session object
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");
            props.put("mail.smtp.ssl.enable", "true");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("tuanhmhe173175@fpt.edu.vn", "tqbtwauackcnlmhd");// Put your email
                    // id and
                    // password here
                }
            });
            // compose message
            try {
                MimeMessage message = new MimeMessage(session);
                try {
                    message.setFrom(new InternetAddress(mail));// change accordingly
                } catch (MessagingException ex) {
                    Logger.getLogger(ForgotPassword.class.getName()).log(Level.SEVERE, null, ex);
                }
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                String subject = "Your OTP to confirm";
                String messageText = "Hello,\n\nYour OTP is: " + otpValue + "\n\nPlease use this OTP to verify your account.\n\nBest regards,\nQuizWiz Team";
                message.setSubject(subject);
                message.setText(messageText);
                Transport.send(message);
                System.out.println("Message sent successfully");
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
            request.setAttribute("message", "OTP is sent to your email");
            //request.setAttribute("connection", con);
            mySession.setAttribute("otp", otpValue);
            mySession.setAttribute("email", mail);
            request.getRequestDispatcher("view/authentication/enterOtp.jsp").forward(request, response);
            //request.setAttribute("status", "success");
        } else {
            request.setAttribute("mess", "Username or Email was wrong");
            request.getRequestDispatcher("view/authentication/forgot.jsp").forward(request, response);
        }
    }

}
