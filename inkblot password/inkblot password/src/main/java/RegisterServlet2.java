import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RegisterServlet2")
public class RegisterServlet2 extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        try {
            // Get form data
            String image = request.getParameter("image");
            String desc = request.getParameter("desc");

            // Get session data (from register1)
            HttpSession session = request.getSession();

            String name = (String) session.getAttribute("name");
            String email = (String) session.getAttribute("email");
            String password = (String) session.getAttribute("password");
            String mobile = (String) session.getAttribute("mobile");
            String dob = (String) session.getAttribute("dob");
            String address = (String) session.getAttribute("address");

            // DB connection
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO users(name,email,password,mobile,dob,address,image,description) VALUES (?,?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, mobile);
            ps.setString(5, dob);
            ps.setString(6, address);
            ps.setString(7, image);
            ps.setString(8, desc);

            int i = ps.executeUpdate();

            if (i > 0) {
                // SUCCESS → go to login page
                response.sendRedirect("login1.jsp");
            } else {
                response.getWriter().println("Registration Failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}