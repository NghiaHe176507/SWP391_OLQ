package controller.authentication;

import dal.ControllerDBContext;
import dal.RoleDBContext;
import entity.Account;
import entity.AccountInfo;
import entity.RoleFeature;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Register extends HttpServlet {

    private final RoleDBContext roleDB = new RoleDBContext();
    private final ControllerDBContext db = new ControllerDBContext();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/authentication/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mail = request.getParameter("gmail");
        String password = request.getParameter("password");
        String displayname = request.getParameter("username");
        ControllerDBContext acc = new ControllerDBContext();

        if (acc.isEmailExists(mail)) {
            request.setAttribute("errorMessage", "Gmail has already been registered");
            request.getRequestDispatcher("view/authentication/register.jsp").forward(request, response);
        } else {
            Account newAccount = new Account();
            AccountInfo newAccountInfo = new AccountInfo();
            RoleFeature newRoleFeature = new RoleFeature();

            String fullname = request.getParameter("fullname");
            Date dob = Date.valueOf(request.getParameter("dob"));

            newAccount.setMail(mail);
            newAccount.setPassword(password);
            newAccount.setDisplayName(displayname);
            newAccount.setAccountStatus("Active");

            newAccountInfo.setFullName(fullname);
            newAccountInfo.setDob(dob);
            newAccountInfo.setAccount(newAccount);

            newRoleFeature.setRole(roleDB.getById("3"));
            newRoleFeature.setAccount(newAccount);

            HttpSession session = request.getSession();
            session.setAttribute("newAccount", newAccount);
            session.setAttribute("newAccountInfo", newAccountInfo);
            session.setAttribute("newRoleFeature", newRoleFeature);
            session.setAttribute("email", mail);

            // Save registration data into the database
//            db.createNewAccount(newAccount);
//            db.createNewAccountInfo(newAccountInfo);
//            db.createNewRoleFeature(newRoleFeature);
            // Send confirmation email
            sendConfirmationEmail(mail, session);

            response.sendRedirect(request.getContextPath() + "/validate-otp-register");
        }
    }

    private void sendConfirmationEmail(String email, HttpSession session) {
        Random rand = new Random();
        int otpValue = rand.nextInt(900000) + 100000;

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        Session mailSession = Session.getDefaultInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("tuanhmhe173175@fpt.edu.vn", "tqbtwauackcnlmhd");
            }
        });

        try {
            MimeMessage message = new MimeMessage(mailSession);
            message.setFrom(new InternetAddress("tuanhmhe173175@fpt.edu.vn"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            message.setSubject("Account Confirmation OTP");
            message.setText("Hello,\n\nYour OTP to confirm your account is: " + otpValue);

            Transport.send(message);

            // Set OTP and email in the session
            session.setAttribute("otp", otpValue);
            session.setAttribute("email", email);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
