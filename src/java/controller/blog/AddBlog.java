 /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.blog;


import dal.PostDAO;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Account;


/**
 *
 * @author DELL
 */
public class AddBlog extends HttpServlet {
    private java.sql.Date date;
   
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
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
        processRequest(request, response);
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
          response.setContentType("text/html;charset=UTF-8");
        String tittle = request.getParameter("tittle");
        String detail = request.getParameter("detail");
         String gmail = request.getParameter("gmail");
        String toppic = request.getParameter("toppic");
        String image = request.getParameter("image");
        String dob = request.getParameter("date");
         
        
        HttpSession sesion = request.getSession();
        Account account = (Account) sesion.getAttribute("account");
                 
        PostDAO dao = new PostDAO();
        boolean postExists = dao.isProductNameExists(tittle,detail);
        if(postExists){
               request.setAttribute("message-error", "Bài viết này đã tồn tại");
        }
        else{
       
        dao.insertPost(tittle, account.getGmail(), toppic, image, detail, dob);
         request.setAttribute("message", "Thêm bài viết thành công");
        }      
        request.getRequestDispatcher("../view/AddBlog.jsp").forward(request, response);
       
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
