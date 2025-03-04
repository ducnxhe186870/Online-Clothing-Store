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
import jakarta.servlet.http.HttpSession;
import static java.lang.Integer.parseInt;
import java.util.List;
import models.Account;
import models.Address;

/**
 *
 * @author admin
 */
public class UpdateProfileServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        doGet(request, response);

    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        AccountDAO dao = new AccountDAO();
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        List<Address> list = dao.getAllAddress(acc.getGmail());
        request.setAttribute("listadd", list);
        request.setAttribute("mess", "");
        request.setAttribute("messprofile", "");
        request.getRequestDispatcher("../view/UpdateProfile.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       // processRequest(request, response);
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        AccountDAO dao = new AccountDAO();
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        dao.updateAccount(name, gender, acc.getGmail());
        Account acc2 = dao.searchAccByID(acc.getGmail());
        session.setAttribute("account", acc2);
        List<Address> list = dao.getAllAddress(acc.getGmail());
        request.setAttribute("listadd", list);
        request.setAttribute("messprofile", "update sucseccful!");
        request.getRequestDispatcher("../view/UpdateProfile.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
