import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/verifyEmail")
public class VerifyEmailServelet extends HttpServlet {

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

                // store email in session
                HttpSession session = request.getSession();
                session.setAttribute("resetEmail", email);

                // go to reset page
                response.sendRedirect("resetImage.jsp");

            } else {
                response.getWriter().println("Email not found!");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}