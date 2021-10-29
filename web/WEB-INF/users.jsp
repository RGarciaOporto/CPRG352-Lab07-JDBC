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
        <style>
        body{
            font-family:'Open Sans', 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            color: #ffffff;
            background-color:#14213d;
        }
        
        h1{
            text-align: center;
        }
        .column {
            float: left;
            width: 30%;
            padding: 5px;
        }
        
        #addUsersForm{
            padding-left:37%;
        }
        
        #editUsersForm{
            padding-left:37%;
        }
        
        table {
            border-collapse: collapse;
             color:#000000;
        }

        td, th {
            border: 1.5px solid #fca311;
            text-align: left;
            padding: 8px;
        }

        th{
            background-color:#fca311;
        }

        tr:nth-child(odd){
            background-color: #ffffff;
        }

        tr:nth-child(even) {
            background-color: #e5e5e5;
        }
        </style>
    </head>
    
    <body>
        
        <div id="addUsers" class="column">
        <h1>Add User</h1>
        <form method="POST" id="addUsersForm">
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
        
        <div name="manageUsers" class="column">
            <h1>Manage Users</h1>
            <form method="POST">
                <table>
                    <tr>
                        <th>Email</th>
                        <th>Name</th>
                        <th>Role</th>
                        <th>Edit</th>
                        <th>Delete</th>
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
        
        <div name="editUsers" class="column" id="editUsers">
            <h1>Edit Users</h1>
            <form method="POST" id="editUsersForm">
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
