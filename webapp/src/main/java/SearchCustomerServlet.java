import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



@WebServlet("/SearchCustomerServlet")
public class SearchCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");

        StringBuilder table = new StringBuilder();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pahanaedu", "root", "");
            String sql = "SELECT * FROM customers WHERE accountnumber LIKE ? OR name LIKE ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();

            table.append("<table><tr><th>ID</th><th>Name</th><th>Address</th><th>Phone</th></tr>");
            while (rs.next()) {
                table.append("<tr><td>").append(rs.getInt("customer_id")).append("</td>")
                     .append("<td>").append(rs.getString("name")).append("</td>")
                     .append("<td>").append(rs.getString("address")).append("</td>")
                     .append("<td>").append(rs.getString("phone")).append("</td></tr>");
            }
            table.append("</table>");
            con.close();
        } catch (Exception e) {
            table.append("<p style='color:red;'>Error: ").append(e.getMessage()).append("</p>");
        }

        request.setAttribute("result", table.toString());
        request.getRequestDispatcher("search_customer.jsp").forward(request, response);
    }
}
