<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<page:template>

    <jsp:attribute name="title">Добавление новой книги</jsp:attribute>

    <jsp:body>

        <c:url value="/jdbcSelectAllBooks" var="jdbcQueryAllBooks" />
        <c:url value="/jdbcDelete" var="jdbcDelete" />

        <!-- Page Content -->
        <div class="container">

            <!-- Page Heading/Breadcrumbs -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Добавление новой книги
                        <small></small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="../index.html">На главную</a>
                        </li>
                        <li><a href="/jdbcSelectAllBooks">Коллекция книг</a>
                        </li>
                        <li class="active">Добавление новой книги</li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <div class="row">
                <!-- Sidebar Column-->
                <div class="col-md-2">

                    <div class="list-group">
                        <a href="../index.html" class="list-group-item">На главную</a>
                        <a href="${jdbcQueryAllBooks}" class="list-group-item">Коллекция книг</a>
                        <a href="/addNew.html" class="list-group-item active"><img src="/resources/images/add.png" width="20" height="20"> Добавить книгу</a>
                    </div>

                </div>

            <!-- BOOK Item Row -->
            <div class="row">
                <!-- Related Projects Row -->
                <div class="col-md-8">
                    <c:if test="${not empty message}">
                    <div class="well">
                        <div class="row">
                            <div class="col-md-12">
                                <p><c:out value="${message}"/></p>
                            </div>
                        </div>
                    </div>
                    </c:if>
                    <h2>Внесите данные о книге:</h2>
                    <form:form name="addNewBook" id="addNewForm" action="/add"
                               method="post" modelAttribute="book" novalidate="true" accept-charset="UTF-8" enctype="multipart/form-data" >

                        <div class="control-group form-group">
                            <div class="controls">
                                <label>Название книги:</label>
                                <input type="text" class="form-control" id="name" name="name"
                                       required="required" data-validation-required-message="Внесите название книги." >
                                <p class="help-block"></p>
                            </div>
                        </div>

                        <div class="control-group form-group">
                            <div class="controls">
                                <label>Автор:</label>
                                <input type="text" class="form-control" id="author" name="author"
                                       required="required" data-validation-required-message="Введите автора.">
                                <p class="help-block"></p>
                            </div>
                        </div>

                        <div class="control-group form-group">
                            <div class="controls">
                                <label>Описание книги:</label>
                                <textarea rows="10" cols="100" class="form-control" id="description" name="description"
                                          required="required" data-validation-required-message="Введите описание книги" maxlength="999" style="resize:none"></textarea>
                            </div>

                            <div class="controls">
                                <label>Обложка книги:</label>
                                <input type="file" accept="image/*" class="form-control" id="multipartFile" name="multipartFile"
                                       required data-validation-required-message="Выберите обложку книги." >
                                <p class="help-block"></p>
                            </div>

                        </div>
                        <button type="submit" class="btn btn-primary">Добавить</button>

                    </form:form>
                </div>
            </div>

            </div>

        </div>

        <!-- jQuery -->
        <script src="../resources/js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../resources/js/bootstrap.min.js"></script>
    </jsp:body>

</page:template>
