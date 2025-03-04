package controller.combo;

import dal.ComboDAO;
import dal.ProductDAO;
import dal.ProductImageDAO;
import dal.StockDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import models.Cart;
import models.Color;
import models.ComboDetails;
import models.ComboList;
import models.Product;
import models.ProductImage;
import models.StockDetail;

/**
 *
 * @author Asus
 */
public class ComboDetailServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ComboDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ComboDetailServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO pdb = new ProductDAO();
        StockDAO sdb = new StockDAO();
        ProductImageDAO pidb = new ProductImageDAO();
        ComboDAO dao = new ComboDAO();

        String proId_raw = request.getParameter("proID");
        String proColorID_raw = request.getParameter("colorID");
        request.setAttribute("coID", proColorID_raw);
        String Sizeid_raw = request.getParameter("sizeID");
        request.setAttribute("siID", Sizeid_raw);
        String quantity = request.getParameter("quantity");
        request.setAttribute("quantity_c", quantity);
        String comboID_raw = request.getParameter("comboID");
        request.setAttribute("CoboID", comboID_raw);

        int comboId, proid, colorID, sizeID;
        Product pro = new Product();

        try {
            comboId = Integer.parseInt(comboID_raw);
            proid = Integer.parseInt(proId_raw);
            colorID = Integer.parseInt(proColorID_raw);
            sizeID = Integer.parseInt(Sizeid_raw);

            StockDetail stock_quantity = sdb.getStockQuantity(proid, colorID, sizeID);
            List<StockDetail> list_stock = sdb.getStockProduct(proid, colorID);
            List<StockDetail> size_default = sdb.getSizeDefault(proid);
            List<StockDetail> list_stock_all = sdb.getStockProductAll(proid);
            List<ComboDetails> listComboDetail = dao.getComboDetailByComboID(comboId);

            // Loại bỏ trùng màu trong danh sách size_default
            for (int i = 0; i < size_default.size(); i++) {
                for (int j = i + 1; j < size_default.size(); j++) {
                    if (size_default.get(i).getProColorName().equals(size_default.get(j).getProColorName())) {
                        size_default.remove(j);
                        j--;
                    }
                }
            }

            List<ProductImage> listImg = new ArrayList<>();
            for (ComboDetails cd : listComboDetail) {
                listImg.add(pidb.getImageById(cd.getProID()));
            }

            // Xử lý danh sách màu sắc
            List<Color> list_color = new ArrayList<>();
            for (StockDetail sd : list_stock_all) {
                Color c = new Color(sd.getProColorID(), sd.getProColorName());
                list_color.add(c);
            }

            // Loại bỏ trùng màu trong danh sách list_color
            for (int i = 0; i < list_color.size(); i++) {
                for (int j = i + 1; j < list_color.size(); j++) {
                    if (list_color.get(i).getProColorName().equals(list_color.get(j).getProColorName())) {
                        list_color.remove(j);
                        j--;
                    }
                }
            }

            pro = pdb.getProductByID(proid);
            ProductImage pi = listImg.get(0);

            request.setAttribute("size_default", size_default);
            request.setAttribute("list_color", list_color);
            request.setAttribute("stock_quantity", stock_quantity);
            request.setAttribute("list_stock", list_stock);
            request.setAttribute("list_stock_all", list_stock_all);
            request.setAttribute("pro", pro);
            request.setAttribute("fisrtImg", pi);
            request.setAttribute("listimg", listImg);
            request.setAttribute("combodetail", listComboDetail);

        } catch (NumberFormatException e) {
            System.out.println("Error parsing numbers: " + e);
        }

        request.getRequestDispatcher("../view/ComboDetails.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String proId_raw = request.getParameter("proID");
        request.setAttribute("proId", proId_raw);
        String proColorID_raw = request.getParameter("colorID");
        request.setAttribute("coID", proColorID_raw);
        String Sizeid_raw = request.getParameter("sizeID");
        request.setAttribute("siID", Sizeid_raw);
        String quantity = request.getParameter("quantity");
        request.setAttribute("quantity_c", quantity);
        String comboID_raw = request.getParameter("comboID");
        request.setAttribute("CoboID", comboID_raw);

        try {
            int quantity_cart = Integer.parseInt(quantity);
            if (quantity_cart != 0) {
                Cookie[] arr = request.getCookies();
                String txt = "";
                int size = 0;

                if (arr != null) {
                    for (Cookie o : arr) {
                        if (o.getName().equals("cart")) {
                            txt += o.getValue();
                            o.setMaxAge(0);
                            response.addCookie(o);
                        }
                        if (o.getName().equals("size")) {
                            size += Integer.parseInt(o.getValue());
                            o.setMaxAge(0);
                            response.addCookie(o);
                        }
                    }
                }

                if (txt.isEmpty()) {
                    txt = proId_raw + ":" + proColorID_raw + ":" + Sizeid_raw + ":" + quantity;
                } else {
                    txt += "#" + proId_raw + ":" + proColorID_raw + ":" + Sizeid_raw + ":" + quantity;
                }

                Cookie c = new Cookie("cart", txt);
                c.setMaxAge(7 * 24 * 60 * 60);
                response.addCookie(c);

                Cart cart = new Cart(txt);
                size = cart.getSize();
                Cookie size_cart = new Cookie("size", String.valueOf(size));
                size_cart.setMaxAge(7 * 24 * 60 * 60);
                response.addCookie(size_cart);
            }
        } catch (NumberFormatException e) {
            System.out.println("Error parsing quantity: " + e);
        }

        request.setAttribute("loadPage", true);
        this.doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
