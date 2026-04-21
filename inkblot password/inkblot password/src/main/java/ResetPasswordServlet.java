import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/resetPassword")
public class ResetPasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!newPassword.equals(confirmPassword)) {
            response.getWriter().println("Passwords do not match!");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/graphical", "root", "admin");

            PreparedStatement ps = con.prepareStatement(
                "UPDATE users SET password=? WHERE email=?");

            ps.setString(1, newPassword);
            ps.setString(2, email);

            int rows = ps.executeUpdate();

            if (rows > 0) {

                response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                out.println("<html>");
                out.println("<body style='text-align:center;margin-top:60px;'>");

                out.println("<h2 style='color:green;'>✔ Password Updated Successfully!</h2>");
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