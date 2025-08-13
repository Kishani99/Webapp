

import java.io.IOException;
import java.util.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AddToCartServlet extends HttpServlet {
    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int bookId = Integer.parseInt(request.getParameter("bookId"));
        String bookName = request.getParameter("bookName");
        double price = Double.parseDouble(request.getParameter("price"));

        Map<String, Object> cartItem = new HashMap<>();
        cartItem.put("bookId", bookId);
        cartItem.put("bookName", bookName);
        cartItem.put("price", price);
        cartItem.put("quantity", 1);

        HttpSession session = request.getSession();
        List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        boolean found = false;
        for (Map<String, Object> item : cart) {
            if ((int) item.get("bookId") == bookId) {
                int qty = (int) item.get("quantity");
                item.put("quantity", qty + 1);
                found = true;
                break;
            }
        }

        // If not found, add new item
        if (!found) {
            cart.add(cartItem);
        }

        // Save cart back to session
        session.setAttribute("cart", cart);

        // Redirect to My Cart page
        response.sendRedirect("mycart.jsp");
    }
}
