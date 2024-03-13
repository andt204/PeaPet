<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/header.css">
    </head>
    <body>
        <nav class="navbar navbar-expand-md">
            <div class="container">
                <a class="navbar-brand" href="home"><i class="fa fa-home"></i> PeaPet</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
                    <ul class="navbar-nav m-auto">
                        <c:if test="${sessionScope.acc.isAdmin == 1}">
                            <li class="nav-item">
                                <a class="nav-link" href="manageaccount">Manager Account</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.acc.isSell == 1}">
                            <li class="nav-item">
                                <a class="nav-link" href="manageproduct">Manager Product</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.acc != null}">
                            <li class="nav-item">
                                <a class="nav-link" href="order">Order List</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Hello ${sessionScope.acc.lastName} ${sessionScope.acc.firstName}</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="logout">Logout</a>
                            </li> 
                        </c:if>
                        <c:if test="${sessionScope.acc == null}">
                            <li class="nav-item">
                                <a class="nav-link" href="Login.jsp">Login</a>
                            </li>
                        </c:if>
                    </ul>
                    <form action="search" method="post" class="form-inline my-2 my-lg-0">
                        <div class="input-group input-group-sm">
                            <input oninput="searchByName(this)" value="${txtS}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-secondary btn-number">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>                       
                    </form>
                            <a class="btn btn-dark btn-sm ml-3" href="cart">
                            <i class="fa fa-shopping-cart"></i> Cart
                            <span class="badge badge-light">${cart_list.size()}</span>
                        </a>
                </div>
            </div>
        </nav>
        <div class="jumbotron text-center">
            <img src="images/PEAPET.jpg" ">
            <h1><b>PEAPET</b></h1>
            <h2><b>Pets For Animal Lovers</b></h2>
            <p class="lead text-muted mb-0">PeaPet is the ideal destination for pet 
                lovers. Our website specializes in providing all kinds of adorable 
                pets, from dogs, cats, rabbits to parrots, hamsters and many other 
                species. With a professional and passionate team, PeaPet is 
                committed to bringing you perfect friends. Experience the happiness 
                of pet ownership with PeaPet today!</p>
        </div>
    </body>
</html>