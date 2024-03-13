<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Orders</title>
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
                            <h2><b>Orders</b></h2>
                        </div>     
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th scope="col">Date</th>
                            <th scope="col">Image</th>
                            <th scope="col">Name</th>
                            <th scope="col">Category</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Price</th>
                            <th scope="col">Cancel</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${not empty listOrder}">
                            <c:forEach var="o" items="${listOrder}">
                                <tr>
                                    <td style="padding-right: 100px;width: 215px;">${o.date}</td>
                                    <td>
                                        <img src="${o.image}">
                                    </td>
                                    <td>${o.name}</td>                                    
                                    <td>
                                        <c:choose>
                                            <c:when test="${o.cid eq 1}">DOG</c:when>
                                            <c:when test="${o.cid eq 2}">CAT</c:when>
                                            <c:when test="${o.cid eq 3}">HAMSTER</c:when>
                                            <c:when test="${o.cid eq 4}">RABBIT</c:when>
                                            <c:when test="${o.cid eq 5}">PARROT</c:when>
                                            <c:when test="${o.cid eq 6}">TURTLE</c:when>
                                            <c:otherwise>Unknown</c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>${o.quantity}</td>
                                    <td>${o.price}</td>
                                    <td><a class="btn btn-sm btn-danger" href="cancelorder?id=${o.orderId}" style="color: white">Cancel Order</a></td>
                                </tr>
                            </c:forEach>
                        </c:if>
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
        <script src="js/manage.js" type="text/javascript"></script>
        <div><a href="home"><button type="button" class="btn btn-info" style="margin-left: 10%; margin-bottom: 5%;">Back to home</button></div>       
    </body>
</html>

