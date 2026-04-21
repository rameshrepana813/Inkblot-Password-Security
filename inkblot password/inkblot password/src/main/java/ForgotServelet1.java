import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/ForgotServelet1")
public class ForgotServelet1 extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/graphical", "root", "admin");

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE email=?");

            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                HttpSession session = request.getSession();
                session.setAttribute("resetEmail", email);

                response.sendRedirect("resetPassword.jsp");
                return;

            } else {
                response.setContentType("text/html");
                response.getWriter().println("<h3>Email not found!</h3>");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}