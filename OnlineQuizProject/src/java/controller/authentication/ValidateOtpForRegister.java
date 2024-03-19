package controller.authentication;

import dal.ControllerDBContext;
import entity.Account;
import entity.AccountInfo;
import entity.RoleFeature;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class ValidateOtpForRegister extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to OTP validation page
        request.getRequestDispatcher("view/authentication/validateOtpForRegister.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve entered OTP from the form
        StringBuilder otpBuilder = new StringBuilder();
        for (int i = 1; i <= 6; i++) {
            otpBuilder.append(request.getParameter("digit" + i));
        }
        int enteredOTP = Integer.parseInt(otpBuilder.toString());

        // Retrieve stored OTP from the session
        HttpSession session = request.getSession();
        Integer storedOTP = (Integer) session.getAttribute("otp");

        // Retrieve other session attributes
        Account newAccount = (Account) session.getAttribute("newAccount");
        AccountInfo newAccountInfo = (AccountInfo) session.getAttribute("newAccountInfo");
        RoleFeature newRoleFeature = (RoleFeature) session.getAttribute("newRoleFeature");
        String email = (String) session.getAttribute("email");

        // Check if any of the session attributes are null
        if (newAccount == null || newAccountInfo == null || newRoleFeature == null || email == null || storedOTP == null) {
            // Redirect to registration page with an error message
            request.setAttribute("errorMessage", "Session attributes are missing. Please try again.");
            request.getRequestDispatcher("view/authentication/register.jsp").forward(request, response);
            return; // Exit the method to prevent further execution
        }

        // Validate OTP
        if (enteredOTP == storedOTP) {
            // OTP verification successful
            // Proceed with registration process
            ControllerDBContext db = new ControllerDBContext();
            db.createNewAccount(newAccount); // Save newAccount to the database
            db.createNewAccountInfo(newAccountInfo); // Save newAccountInfo to the database
            db.createNewRoleFeature(newRoleFeature); // Save newRoleFeature to the database

            // Redirect to success page
            response.sendRedirect(request.getContextPath() + "/login");
        } else {
            // OTP verification failed
            // Forward back to OTP validation page with error message
            request.setAttribute("errorMessage", "Invalid OTP. Please try again.");
            request.getRequestDispatcher("view/authentication/validateOtpForRegister.jsp").forward(request, response);
        }
    }

}
