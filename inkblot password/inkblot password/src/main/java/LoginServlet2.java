import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/login2")
public class LoginServlet2 extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String image = request.getParameter("image");
        String description = request.getParameter("description");

        // validation
        if (image == null || image.isEmpty()) {
            response.getWriter().println("Please select an image");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/graphical", "root", "admin");

            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM users WHERE image=? AND description=?");

            ps.setString(1, image);
            ps.setString(2, description.trim());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("user", rs.getString("email"));

                response.sendRedirect("profile.jsp");
            } else {
                response.getWriter().println("Login Failed");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}