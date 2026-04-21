import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/changeAll")
public class ChangeAllServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login1.jsp");
            return;
        }

        String user = (String) session.getAttribute("user");

        String password = request.getParameter("password");
        String image = request.getParameter("image");
        String description = request.getParameter("description");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/graphical", "root", "admin");

            PreparedStatement ps = con.prepareStatement(
                "UPDATE users SET password=?, image=?, description=? ");

            ps.setString(1, password);
            ps.setString(2, image);
            ps.setString(3, description);
            

            int rows = ps.executeUpdate();

            if (rows > 0) {

                session.setAttribute("msg", "Details Updated Successfully!");

                response.sendRedirect("success.jsp");
                return;

            } else {
                response.getWriter().println("Update Failed!");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}