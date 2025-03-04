package controller.combo;

import dal.ComboDAO;
import dal.ProductDAO;
import dal.ProductImageDAO;
import dal.StockDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.ComboDetails;
import models.ComboList;
import models.Product;
import models.ProductImage;
import models.Stock;

public class ComboListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ComboDAO dao = new ComboDAO();
        ProductDAO pdb = new ProductDAO();
        StockDAO sdb = new StockDAO();
        ProductImageDAO daoPI = new ProductImageDAO();

        List<ComboList> allCombos = dao.getCombo(); // Lấy tất cả combo
        List<ComboDetails> listComboDetail = dao.getComboDetail();
        
        // Chỉ lấy các combo đang hiển thị (conboStatus == true)
        List<ComboList> visibleCombos = new ArrayList<>();
        for (ComboList combo : allCombos) {
            if (combo.isConboStatus()) {
                visibleCombos.add(combo);
            }
        }

        int combosPerPage = 2; // Số combo trên mỗi trang
        int totalCombos = visibleCombos.size();
        int totalPages = (int) Math.ceil((double) totalCombos / combosPerPage);

        // Lấy trang hiện tại từ request
        String pageParam = request.getParameter("page");
        int currentPage = (pageParam != null) ? Integer.parseInt(pageParam) : 1;

        // Nếu trang hiện tại vượt quá tổng số trang, tự động điều chỉnh
        if (currentPage > totalPages) {
            currentPage = Math.max(1, totalPages);
        }

        // Xác định danh sách combo của trang hiện tại
        int start = (currentPage - 1) * combosPerPage;
        int end = Math.min(start + combosPerPage, totalCombos);
        List<ComboList> comboPage = visibleCombos.subList(start, end);

        List<ComboDetails> comboDetailPage = new ArrayList<>();
        List<ProductImage> listImg = new ArrayList<>();
        List<Product> listPage = new ArrayList<>();

        // Lọc combo details theo combo đang hiển thị
        for (ComboList combo : comboPage) {
            for (ComboDetails detail : listComboDetail) {
                if (detail.getComboID() == combo.getComboID()) {
                    comboDetailPage.add(detail);
                    listImg.add(daoPI.getImageById(detail.getProID()));
                    listPage.add(pdb.getProductByID(detail.getProID()));
                }
            }
        }

        // Lấy thông tin kho hàng cho các sản phẩm của trang hiện tại
        List<Stock> listStock = sdb.getStockForShopAll(listPage);

        // Gửi dữ liệu đến JSP
        request.setAttribute("list_stock", listStock);
        request.setAttribute("listimg", listImg);
        request.setAttribute("combolist", comboPage);
        request.setAttribute("combodetail", comboDetailPage);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);

        request.getRequestDispatcher("../view/ComboList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
