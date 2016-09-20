<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>

<page:template>

    <jsp:attribute name="title">${book.name}</jsp:attribute>

    <jsp:body>

        <!-- Page Content -->
        <div class="container">

            <!-- Page Heading/Breadcrumbs -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">${book.name}
                        <small>${book.author}</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.html">На главную</a>
                        </li>
                        <li><a href="/jdbcQueryAllBooks">Коллекция книг</a>
                        </li>
                        <li class="active">${book.name}</li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <!-- BOOK Item Row -->
            <div class="row">
                <!-- Related Projects Row -->
                    <div class="row">
                        <div class="col-md-6">
                                <img class="img-responsive img-hover img-related" src="http://placehold.it/500x300" alt="">
                        </div>

                        <div class="col-md-6">
                            <h3>${book.name}</h3>
                            <p>${book.description}</p>
                            <h3>Автор</h3>
                            <ul>
                                <li>${book.author}</li>
                            </ul>
                        </div>
                    </div>
            </div>

        </div>


        <!-- /.container -->

        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
    </jsp:body>

</page:template>
