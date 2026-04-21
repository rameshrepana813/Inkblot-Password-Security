import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/resetImage")
public class ResetImageServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("resetEmail") == null) {
            response.sendRedirect("forgot1.jsp");
            return;
        }

        String email = (String) session.getAttribute("resetEmail");
        String image = request.getParameter("image");
        String description = request.getParameter("description");

        if (image == null || image.isEmpty()) {
            response.getWriter().println("Please select image!");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/graphical", "root", "admin");

            PreparedStatement ps = con.prepareStatement(
                "UPDATE users SET image=?, description=? WHERE email=?");

            ps.setString(1, image);
            ps.setString(2, description);
            ps.setString(3, email);

            int rows = ps.executeUpdate();

            if (rows > 0) {

                session.removeAttribute("resetEmail");

                response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                out.println("<html>");
                out.println("<body style='text-align:center;margin-top:60px;'>");

                out.println("<h2 style='color:green;'>✔ Reset Successful!</h2>");
                out.println("<p>Redirecting to login page in 3 seconds...</p>");

                out.println("<script>");
                out.println("setTimeout(function(){ window.location='login1.jsp'; }, 3000);");
                out.println("</script>");

                out.println("</body>");
                out.println("</html>");

            } else {
                response.getWriter().println("Update failed!");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}