<%-- 
    Document   : users
    Created on : Oct 28, 2021, 1:20:11 PM
    Author     : 851649
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Users</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/WEB-INF/ManageUsersStyling.css">
    </head>
    
    <body>
        
        <div id="addUsers">
        <h1>Add User</h1>
        <form method="POST">
            <input type="hidden" name="action" value="add">
            <input type="text" name="email" placeholder="Email"><br>
            <label>Status:</label><br>
            <input type="radio"  name="status" value="T">
            <label>Active</label><br>
            <input type="radio" name="status" value="F">
            <label>Inactive</label><br>
            <input type="text" name="firstName" placeholder="First Name"><br>
            <input type="text" name="lastName" placeholder="Last Name"><br>
            <input type="text" name="pasword" placeholder="Password"><br>
            <select name="role">
                <option value="sysadmin">System Administrator</option>
                <option value="compadmin">Company Administrator</option>
                <option value="user">User</option> 
            </select><br>
            <input type="submit" value="Save">
        </form>
        </div>
        
        <div name="manageUsers">
            <h1>Manage Users</h1>
            <form method="POST">
                <table>
                    <tr>
                        <th>Email</th>
                        <th>Name</th>
                        <th>Role</th>
                    </tr>
                    <c:forEach var="users" items="${userList}">
                        <tr>
                            <td><p>${users.email}</p></td>
                            <td><p>${users.firstName} ${users.lastName}</p></td>
                            <td><p>${users.role}</p></td>
                            <td><input type="submit" name="action" value="Edit"></td>
                            <td><input type="submit" name="action" value="Delete"></td>
                        </tr>
                    </c:forEach>
                </table>
            </form>
        </div>
        
        <div name="editUsers">
            <h1>Edit Users</h1>
            <form method="POST">
            <input type="hidden" name="action" value="edit">
            <input type="text" name="email" placeholder="Email"><br>
            <label>Status:</label><br>
            <input type="radio"  name="status" value="T">
            <label>Active</label><br>
            <input type="radio" name="status" value="F">
            <label>Inactive</label><br>
            <input type="text" name="firstName" placeholder="First Name"><br>
            <input type="text" name="lastName" placeholder="Last Name"><br>
            <select name="role">
                <option value="sysadmin">System Administrator</option>
                <option value="compadmin">Company Administrator</option>
                <option value="user">User</option> 
            </select><br>
            <input type="submit" value="Save">
            <input type="reset" value="Cancel">
        </form>
        </div>
    </body>
</html>
