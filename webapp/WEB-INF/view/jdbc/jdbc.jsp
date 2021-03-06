<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>

<page:template>

    <jsp:attribute name="title">Коллекция книг</jsp:attribute>

    <jsp:body>

        <c:url value="/jdbcSelectAllBooks" var="jdbcQueryAllBooks" />
        <c:url value="/jdbcDelete" var="jdbcDelete" />


        <!-- Page Content -->
        <div class="container">

            <!-- Page Heading/Breadcrumbs -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Коллекция книг
                        <small>с использованием JDBC</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="../index.html">На главную</a>
                        </li>
                        <li class="active">Коллекция книг</li>
                    </ol>
                </div>
            </div>

            <!-- /.row -->

            <!-- Content Row -->
            <div class="row">
                <!-- Sidebar Column-->
                <div class="col-md-2">

                        <div class="list-group">
                            <a href="../index.html" class="list-group-item">На главную</a>
                            <a href="${jdbcQueryAllBooks}" class="list-group-item active">Коллекция книг</a>
                            <a href="/addNew.html" class="list-group-item"><img src="/resources/images/add.png" width="20" height="20"> Добавить книгу</a>
                        </div>

                        <!--Search field -->
                        <form action="${jdbcQueryAllBooks}" method="get">
                            <div class="control-group form-group">
                                <div class="controls">
                                    <input type="text" class="form-control" id="searchText" name="searchText" value="${searchText}"
                                           data-validation-required-message="Введите строку поиска книги."  >
                                    <p class="help-block"></p>
                                </div>
                                <button type="submit" class="btn btn-primary">Поиск</button>
                            </div>
                        </form>


                </div>
                <!-- Content Column -->
                <div class="col-md-10">

                    <!--Search field -->
                    <c:if test="${not empty books}">
                        <!--Если коллекция книг не пустая то выводим  книги-->
                        <c:forEach items="${books}" var="book">
                    <div class="col-md-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <a href="/book/${book.id}"><h4><i class="fa fa-fw fa-check"></i><c:out value ="${book.name}"/></h4></a>
                            </div>
                            <div class="panel-body">
                                <p><c:out value="Автор: ${book.author}"/></p>
                                <a href="/book/${book.id}" class="btn btn-default">Просмотреть</a>
                                <a href="/jdbcDelete/${book.id}" class="btn btn-default">Удалить</a>
                            </div>
                         </div>
                    </div>
                            </c:forEach>
                    </c:if>
                    <c:if test="${empty books}">
                        <c:if test="${empty searchText}">
                    <p><em>В коллекцию не добавлено ни одной книги, Добавьте книгу</em></p>
                        </c:if>
                        <c:if test="${not empty searchText}">
                            <p><em>Не найдено ни одной книги удовлетворяющей запросу</em></p>
                        </c:if>
                    </c:if>
                </div>

            </div>


            <!-- /.row -->

            <hr>
        </div>
        <!-- /.container -->

        <!-- jQuery -->
        <script src="../resources/js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../resources/js/bootstrap.min.js"></script>

    </jsp:body>

</page:template>
