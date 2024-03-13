<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manager Account</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manage.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title" style="background-color: #03989E">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2><b>Manage Account</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addAccountModal"  class="btn btn-info" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Account</span></a>
                            <a href="#deleteAccountModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>						
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>
                                <span class="custom-checkbox">
                                    <input type="checkbox" id="selectAll">
                                    <label for="selectAll"></label>
                                </span>
                            </th>
                            <th>ID</th>
                            <th>Username</th>
                            <th>Name</th>
                            <th>Address</th>
                            <th>DOB</th>                         
                            <th>Role</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listA}" var="o">
                            <tr>
                                <td>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                        <label for="checkbox1"></label>
                                    </span>
                                </td>
                                <td>${o.id}</td>
                                <td>${o.user}</td>
                                <td>${o.lastName} ${o.firstName}</td>
                                <td>${o.address}</td>
                                <td>${o.dob}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${o.isSell eq 1 and o.isAdmin eq 0}">
                                            Seller
                                        </c:when>
                                        <c:when test="${o.isSell eq 0 and o.isAdmin eq 1}">
                                            Mod
                                        </c:when>
                                        <c:when test="${o.isSell eq 1 and o.isAdmin eq 1}">
                                            Admin
                                        </c:when>
                                        <c:when test="${o.isSell eq 0 and o.isAdmin eq 0}">
                                            Customer
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td>
                                    <a href="loadAccount?aid=${o.id}"  class="editaccount" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" style="color: #FFC107 " title="Edit">&#xE254;</i></a>
                                    <a href="deleteaccount?aid=${o.id}" class="deleteaccount" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" style="color: #F44336" title="Delete">&#xE872;</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="clearfix">
                    <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                    <ul class="pagination">
                        <li class="page-item disabled"><a href="#">Previous</a></li>
                        <li class="page-item active"><a href="#" class="page-link">1</a></li>
                        <li class="page-item"><a href="#" class="page-link">2</a></li>
                        <li class="page-item"><a href="#" class="page-link">3</a></li>
                        <li class="page-item"><a href="#" class="page-link">4</a></li>
                        <li class="page-item"><a href="#" class="page-link">5</a></li>
                        <li class="page-item"><a href="#" class="page-link">Next</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="addAccountModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addaccount" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Account</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					 
                            <div class="form-group">
                                <label>First Name</label>
                                <input name="addfirstname" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Last Name</label>
                                <input name="addlastname" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <input name="addaddress" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>DOB</label>
                                <input name="adddob" type="date" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Role</label>
                                <select name="addrole" class="form-select" aria-label="Default select example">  
                                        <option>Admin</option>
                                        <option>Mod</option>   
                                        <option>Seller</option> 
                                        <option>Customer</option> 
                                </select>
                            </div>
                            <div class="form-group">
                                <label>User Name</label>
                                <input name="addusername" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input name="addpass" type="pass" class="form-control" required>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="js/manage.js" type="text/javascript"></script>
        <div><a href="home"><button type="button" class="btn btn-info" style="margin-left: 10%; margin-bottom: 5%;">Back to home</button></div>       
    </body>
</html>

