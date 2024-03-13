/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.comment;

import dal.ResultTotalExamDBContext;
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
public class UpdateLectureComment extends HttpServlet {
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int resultId = Integer.parseInt(request.getParameter("resultId"));
            String lectureComment = request.getParameter("lectureComment");

            ResultTotalExamDBContext resultDB = new ResultTotalExamDBContext();
            resultDB.updateLectureComment(resultId, lectureComment);

            // Redirect back to the result page after updating the Lecture Comment
            response.sendRedirect(request.getContextPath() + "/view-list-exam");
        } catch (NumberFormatException e) {
            // Handle the case where resultId is not a valid integer
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid resultId");
        } catch (Exception e) {
            // Handle other exceptions
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal Server Error");
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // You can implement GET handling if needed, but it's generally not recommended for data modifications.
    response.sendRedirect(request.getContextPath() + "/view-list-exam");
}
}
