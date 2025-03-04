/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.combo;

import dal.ComboDAO;
import dal.ProductImageDAO;
import dal.SaleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.ComboDetails;
import models.ComboList;
import models.ProductImage;

/**
 *
 * @author Asus
 */
public class ComboManageServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ComboManageServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ComboManageServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        ComboDAO dao = new ComboDAO();
        SaleDAO dao1 = new SaleDAO();
        ProductImageDAO daoPI = new ProductImageDAO();

        List<ComboList> listCombo = dao.getCombo();
        List<ComboDetails> listComboDetail = dao.getComboDetail();
        List<ProductImage> listImg = new ArrayList<>();
        List<Integer> ImgID = new ArrayList<>();
        for (int i = 0; i < listComboDetail.size(); i++) {
            if (!ImgID.contains((listComboDetail.get(i).getProID()))) {
                ImgID.add((listComboDetail.get(i).getProID()));
            }
        }
        for (int i = 0; i < ImgID.size(); i++) {
            listImg.add(daoPI.getImageById(ImgID.get(i)));
        }

        String txt = request.getParameter("txt");
        if (txt != null) {
            listCombo = dao1.seachComboByName(txt);
        } else {
            listCombo = dao.getCombo();
        }
        request.setAttribute("txt", txt);
        request.setAttribute("listimg", listImg);
        request.setAttribute("combolist", listCombo);
        request.setAttribute("combodetail", listComboDetail);
        request.getRequestDispatcher("../view/ComboManage.jsp").forward(request, response);
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
        ComboDAO dao = new ComboDAO();
        String id = request.getParameter("id");

        if (request.getParameter("hide") != null) {
            try {
                dao.setStatusCombo(id, false); 
            } catch (Exception ex) {
                Logger.getLogger(ComboManageServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (request.getParameter("display") != null) {
            try {
                dao.setStatusCombo(id, true); 
            } catch (Exception ex) {
                Logger.getLogger(ComboManageServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        response.sendRedirect("comboManage"); 
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
