
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
        UserService us = new UserService();
        //check if we're editing/deleting a value from our manage users table
        String editParam = request.getParameter("editEmail");
        String deleteParam = request.getParameter("deleteEmail");
        User tempUser;
        
        //do the appropriate actions if the edit or delete parameters have been passed 
        //edit will load the values onto the edit window of the jsp
        if(editParam != null){
        tempUser = us.getUser(editParam);
        request.setAttribute("toUpdateEmail",tempUser.getEmail());
        request.setAttribute("toUpdateFirstName",tempUser.getFirstName());
        request.setAttribute("toUpdateLastName",tempUser.getLastName());     
        }
        //delete will remove the entry from the database
        if(deleteParam != null){
        tempUser = us.getUser(deleteParam);
        us.deleteUser(tempUser);
        }
        
        //load the values from the database onto an array we can display on the jsp
        ArrayList<User> userList = us.getAll();
        request.setAttribute("userList", userList);
       getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserService us;
        String action = request.getParameter("action");
        String email, firstName, lastName, password, roleValue, statusValue;
        boolean status;
        int role;
        User tempUser;
        ArrayList<User> userList;
        
         if(action != null){    
        switch(action){
                case "add":
                    us = new UserService();
                    //initialize the variables with values from the jsp
                    email = request.getParameter("email");
                    firstName = request.getParameter("firstName");
                    lastName = request.getParameter("lastName");
                    password = request.getParameter("password");
                    roleValue = request.getParameter("role");
                    //convert  roleValue into an int based on the jsp input 
                    switch(roleValue){
                        case "sysadmin": 
                            role = 1;
                            break;
                        case "user": 
                            role = 2;
                            break;
                        case "compadmin":
                            role = 3;
                            break;
                        default:
                            role = 0;
                            break;
                    }
                    statusValue = request.getParameter("status");
                    //convert statusValue into a boolean based on the jsp input
                    if (statusValue.equals("T")){
                       status = true; 
                    }
                    else{
                        status = false;
                    }
          
                    //create user and add it to the .sql file
                    tempUser = new User(email, status, firstName, lastName, password, role);
                    us.addUser(tempUser);
                    //load jsp
                    userList = us.getAll();
                    request.setAttribute("userList", userList);
                    request.setAttribute("message", "User successfully added!");
                    getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
                    break;
                    
                case "update":
                    us = new UserService();
                    //initialize the variables with values from the jsp
                    email = request.getParameter("updateEmail");
                    User editUser = us.getUser(email);
                    firstName = request.getParameter("editFirstName");
                    if(firstName != null)
                        editUser.setFirstName(firstName);
                    lastName = request.getParameter("editLastName");
                    if(lastName != null)
                        editUser.setLastName(lastName);
                    roleValue = request.getParameter("editRole");
                    //convert  roleValue into an int based on the jsp input 
                    switch(roleValue){
                        case "sysadmin": 
                            role = 1;
                            break;
                        case "user": 
                            role = 2;
                            break;
                        case "compadmin":
                            role = 3;
                            break;
                        default:
                            role = 0;
                            break;
                    }
                    editUser.setRole(role);
                    statusValue = request.getParameter("editStatus");
                    //convert statusValue into a boolean based on the jsp input
                    if (statusValue.equals("T")){
                       status = true; 
                    }
                    else{
                        status = false;
                    }
                    editUser.setStatus(status);
                    //update the sql file
                    us.updateUser(editUser);
                    //load jsp
                    userList = us.getAll();
                    request.setAttribute("userList", userList);
                    request.setAttribute("message", "User successfully updated!");
                    getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
                    getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
                    break;
                //in case a button doesn't work/something goes wrong, reload the page.
                default:
                    doGet(request,response);
                    break;
            }
        }
    }

}
