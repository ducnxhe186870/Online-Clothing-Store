/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.combo;

//import com.sun.org.apache.bcel.internal.generic.BREAKPOINT;
import dal.CategoriesDAO;
import dal.ComboDAO;
import dal.MktDAO;
import dal.ProductDAO;
import dal.ProductImageDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import models.Categories;
import models.Color;
import models.Product;
import models.ProductImage;
import models.Size;
import models.Stock;

/**
 *
 * @author Asus
 */
public class AddComboServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddComboServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddComboServlet at " + request.getContextPath() + "</h1>");
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
    int pid1=0, pid2=0, pid3=0, pid4=0;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MktDAO dao1 = new MktDAO();
        ComboDAO dao = new ComboDAO();
        List<Product> listProductSelect = new ArrayList<>();
        String txt = request.getParameter("txt");

        if (txt == null) {
            txt = "";
        }
        // tao list
        List<Product> listProduct = dao1.getAllProduct();
        List<ProductImage> list_img = new ArrayList<>();
        ProductImageDAO pidb = new ProductImageDAO();
        CategoriesDAO cdb = new CategoriesDAO();

        List<Categories> list_Ca = cdb.getAll();
        request.setAttribute("listCa", list_Ca);

        // get img
//        for (int i = 0; i <= listProduct.size() - 1; i++) {
//            list_img.add(pidb.getImageById(listProduct.get(i).getProID()));
//        }
        List<Integer> ImgID = new ArrayList<>();
        for (int i = 0; i < listProduct.size(); i++) {
            if (!ImgID.contains((listProduct.get(i).getProID()))) {
                ImgID.add((listProduct.get(i).getProID()));
            }
        }
        for (int i = 0; i < ImgID.size(); i++) {
            list_img.add(pidb.getImageById(ImgID.get(i)));
        }

        //get caID
        String caId = request.getParameter("caID");
        request.setAttribute("caID", caId);
        // get sort

        String sort = request.getParameter("sort");
        if (sort == null) {
            sort = "new";
        }
        request.setAttribute("sort_list", sort);

        int ca;

        List<Product> listpage = new ArrayList<>();
        try {
            ca = (caId == null || "".equals(caId)) ? 0 : Integer.parseInt(caId);
            String indexPage = request.getParameter("index");
            if (indexPage == null) {
                indexPage = "1";
            }

            int index = Integer.parseInt(indexPage);
            if (index == 0) {
                index = 1;
            }

            if (sort.equals("new")) {
                listpage = dao.getListByPageNew(index, ca, txt);
                request.setAttribute("listpage", listpage);
            } else if (sort.equals("low")) {
                listpage = dao.getListByPageASC(index, ca, txt);
                request.setAttribute("listpage", listpage);
            } else if (sort.equals("high")) {
                listpage = dao.getListByPageDESC(index, ca, txt);
                request.setAttribute("listpage", listpage);
            }
            int total = dao.getMaxIndex(ca, txt);
            int endPage = (total % 6 == 0 ? (total / 6) : ((total / 6) + 1));

            if (index >= endPage) {
                index = endPage;
            }
            request.setAttribute("endPage", endPage);
            request.setAttribute("indexNow", index);

            request.setAttribute("listProduct", listpage);

        } catch (NumberFormatException e) {
            System.out.println(e);
        }

        Product pro1 = null;
        Product pro2 = null;
        Product pro3 = null;
        Product pro4 = null;

        String del = null;
        try {
            del = request.getParameter("del");
        } catch (NumberFormatException e) {

        }

        if (del != null) {
            if (pid1 == Integer.parseInt(del)) {
                pid1 = 0;
            } else if (pid2 == Integer.parseInt(del)) {
                pid2 = 0;
            } else if (pid3 == Integer.parseInt(del)) {
                pid3 = 0;
            } else if (pid4 == Integer.parseInt(del)) {
                pid4 = 0;
            }
        }

        int pro = 0;
        try {
            pro = Integer.parseInt(request.getParameter("pro"));
        } catch (Exception e) {
        }
        if (pro != 0) {
            if (pid1 == 0&& pid3!=pro && pid2!=pro && pid4!=pro) {
                try {
                    pid1 = pro;
                } catch (NumberFormatException e) {
                    System.out.println("pro" + e);
                }

            } else if (pid2 == 0&& pid3!=pro && pid1!=pro && pid4!=pro) {
                try {
                    pid2 = pro;
                } catch (NumberFormatException e) {
                    System.out.println("pro" + e);
                }
            } else if (pid3 == 0 && pid1!=pro && pid2!=pro && pid4!=pro) {
                try {
                    pid3 = pro;
                } catch (NumberFormatException e) {
                    System.out.println("pro" + e);
                }
            } else if (pid4 == 0 && pid3!=pro && pid2!=pro && pid1!=pro) {
                try {
                    pid4 = pro;
                } catch (NumberFormatException e) {
                    System.out.println("pro" + e);
                }
            }
        }

        pro1 = dao1.getProduct(pid1);
        pro2 = dao1.getProduct(pid2);
        pro3 = dao1.getProduct(pid3);
        pro4 = dao1.getProduct(pid4);
        if (pro1 != null) {
            listProductSelect.add(pro1);
        }
        if (pro2 != null) {
            listProductSelect.add(pro2);
        }
        if (pro3 != null) {
            listProductSelect.add(pro3);
        }
        if (pro4 != null) {
            listProductSelect.add(pro4);
        }

        request.setAttribute("lps", listProductSelect);
        request.setAttribute("pro1", pro1);
        request.setAttribute("pro2", pro2);
        request.setAttribute("pro3", pro3);
        request.setAttribute("pro4", pro4);
        int price = 0;
        try {
            for (Product product : listProductSelect) {
                try {
                    price += product.getProPrice();
                } catch (Exception e) {

                }
            }

        } catch (Exception e) {
        }
        request.setAttribute("txt", txt);
        request.setAttribute("price", price);
        request.setAttribute("list_img", list_img);
        request.setAttribute("list_Category", list_Ca);
        request.getRequestDispatcher("../view/AddCombo.jsp").forward(request, response);

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
        String name = request.getParameter("namec");
        String price = request.getParameter("pricec");
        ComboDAO dao = new ComboDAO();
        int count = 0;
        if (pid1 != 0) {
            count++;
        }
        if (pid2 != 0) {
            count++;
        }
        if (pid3 != 0) {
            count++;
        }
        if (pid4 != 0) {
            count++;
        }
        if (count < 2) {
            request.setAttribute("mess", "Add fail. count<2");
            this.doGet(request, response);
        }
        if (dao.getIDCombo(name) == 0) { // chua co combo ten name
            dao.addCombo(name, price, pid1, pid2, pid3, pid4);
            pid1 = 0;
            pid2 = 0;
            pid3 = 0;
            pid4 = 0;
            request.setAttribute("mess", "Add succesfull");
            request.setAttribute("namec", "");
            this.doGet(request, response);
        } else {
            request.setAttribute("mess", "Add fail. Name coincident");
            request.setAttribute("namec", name);

            this.doGet(request, response);
        }

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
