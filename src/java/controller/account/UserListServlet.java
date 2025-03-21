/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.account;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import models.Account;

/**
 *
 * @author admin
 */
public class UserListServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Account> listAcc = new ArrayList<>();
        AccountDAO dao = new AccountDAO();
        listAcc = dao.getAllAccount();
        String txt = request.getParameter("txt");
        String role = request.getParameter("role");
        String page = request.getParameter("page");
        int endPage = 1;
        try {
            listAcc = dao.searchAccount(Integer.parseInt(page), role, txt);
        } catch (NumberFormatException ex) {
            System.out.println(ex);
        }
        try {

            if (dao.getAccount(role, txt).size() % 12 == 0) {
                endPage = dao.getAccount(role, txt).size() / 12;
            } else {
                endPage = dao.getAccount(role, txt).size() / 12 + 1;
            }

        } catch (NumberFormatException ex) {
            System.out.println(ex);
        }

        request.setAttribute("listAcc", listAcc);
        request.setAttribute("endPage", endPage);
        request.setAttribute("txt", txt);
        request.setAttribute("role", role);
        request.setAttribute("page", page);
        request.getRequestDispatcher("../view/UserList.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
