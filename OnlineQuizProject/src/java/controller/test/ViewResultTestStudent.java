/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.test;

import controller.authentication.BasedRequiredAuthenticationController;
import dal.ControllerDBContext;
import dal.TestDBContext;
import entity.Account;
import entity.Result;
import entity.Topic;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author tuann
 */
public class ViewResultTestStudent extends BasedRequiredAuthenticationController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Account LoggedUser)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int pageSize = 4; // Number of items per page
        int page = 1; // Default page number
        String examNameFilter = request.getParameter("examName"); // Get exam name filter from request

        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        TestDBContext test = new TestDBContext();
        ArrayList<Result> listExaminationOfStudent = test.getListExaminationOfStudent();

        // Filter by exam name if applicable
        if (examNameFilter != null && !examNameFilter.isEmpty()) {
            listExaminationOfStudent = filterByExamName(listExaminationOfStudent, examNameFilter);
        }

        // Paginate the data
        int totalItems = listExaminationOfStudent.size();
        int totalPages = (int) Math.ceil((double) totalItems / pageSize);

        int startIndex = (page - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalItems);

        ArrayList<Result> paginatedList = new ArrayList<>(listExaminationOfStudent.subList(startIndex, endIndex));

        ControllerDBContext topicDB = new ControllerDBContext();
        ArrayList<Topic> listTopic = topicDB.getListTopic();
        request.setAttribute("listStudent", paginatedList);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("listTopic", listTopic);
        request.getRequestDispatcher("view/test/ViewListExamTest.jsp").forward(request, response);
    }

// Method to filter the list of results by examination name
    private ArrayList<Result> filterByExamName(ArrayList<Result> resultList, String examName) {
        ArrayList<Result> filteredList = new ArrayList<>();
        for (Result result : resultList) {
            if (result.getExam().getClassExam().getTopic().getTopicName().equalsIgnoreCase(examName)) {
                filteredList.add(result);
            }
        }
        return filteredList;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        processRequest(request, response, LoggedUser);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        processRequest(request, response, LoggedUser);
    }

}
