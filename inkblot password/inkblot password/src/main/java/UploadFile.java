import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/uploadFile")
@MultipartConfig
public class UploadFile extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // get file
            Part part = request.getPart("file");
            String fileName = part.getSubmittedFileName();

            // DB connection
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/graphical","root","admin");

            // insert only file
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO files(file_name,file_data) VALUES(?,?)");

            ps.setString(1, fileName);
            ps.setBlob(2, part.getInputStream());

            int result = ps.executeUpdate();

            if(result > 0){
                out.println("<h2 style='color:green;'>File Uploaded Successfully!</h2>");
            } else {
                out.println("<h2 style='color:red;'>Upload Failed!</h2>");
            }

            out.println("<br><a href='upload.jsp'>Back</a>");

            con.close();

        } catch(Exception e){
            out.println("<h3 style='color:red;'>ERROR:</h3>");
            e.printStackTrace(out);
        }
    }
}