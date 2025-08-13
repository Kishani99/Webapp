

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@jakarta.servlet.annotation.WebServlet("/PrintBillServlet")
public class PrintbillServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Change these DB details as per your setup
    private static final String DB_URL = "jdbc:mysql://localhost:3306/pahanaedu";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerName = request.getParameter("customerName");
        String billDate = request.getParameter("billDate");

        List<BillItem> billItems = new ArrayList<>();
        double totalAmount = 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

            StringBuilder sql = new StringBuilder(
                "SELECT book_name, quantity, price, (quantity * price) AS total_price " +
                "FROM bill_history WHERE 1=1"
            );

            if (customerName != null && !customerName.trim().isEmpty()) {
                sql.append(" AND customer_name LIKE ?");
            }
            if (billDate != null && !billDate.trim().isEmpty()) {
                sql.append(" AND bill_date = ?");
            }

            PreparedStatement ps = con.prepareStatement(sql.toString());

            int paramIndex = 1;
            if (customerName != null && !customerName.trim().isEmpty()) {
                ps.setString(paramIndex++, "%" + customerName + "%");
            }
            if (billDate != null && !billDate.trim().isEmpty()) {
                ps.setString(paramIndex++, billDate);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BillItem item = new BillItem();
                item.setBookName(rs.getString("book_name"));
                item.setQuantity(rs.getInt("quantity"));
                item.setPrice(rs.getDouble("price"));
                item.setTotalPrice(rs.getDouble("total_price"));
                billItems.add(item);
                totalAmount += item.getTotalPrice();
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error fetching bill: " + e.getMessage());
        }

        request.setAttribute("billItems", billItems);
        request.setAttribute("totalAmount", totalAmount);

        RequestDispatcher dispatcher = request.getRequestDispatcher("print_bill.jsp");
        dispatcher.forward(request, response);
    }

    // BillItem inner class
    public static class BillItem {
        private String bookName;
        private int quantity;
        private double price;
        private double totalPrice;

        public String getBookName() { return bookName; }
        public void setBookName(String bookName) { this.bookName = bookName; }
        public int getQuantity() { return quantity; }
        public void setQuantity(int quantity) { this.quantity = quantity; }
        public double getPrice() { return price; }
        public void setPrice(double price) { this.price = price; }
        public double getTotalPrice() { return totalPrice; }
        public void setTotalPrice(double totalPrice) { this.totalPrice = totalPrice; }
    }
}
