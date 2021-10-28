
package servlets;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;
import services.UserService;

/**
 *
 * @author Rafael Garcia Oporto
 */
public class UserServlet extends HttpServlet {

    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        //load the values from the database onto an array we can display on the jsp
        UserService us = new UserService ();
        ArrayList<User> userList = us.getAll();
        
        request.setAttribute("userList", userList);
       getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        
         if(action != null){    
        switch(action){
                case "add":
                    //code
                    break;
                case "edit":
                    //code
                    break;
                case "delete":
                    //code
                    break;
                default:
                    doGet(request,response);
                    break;
            }
        }
    }

}
