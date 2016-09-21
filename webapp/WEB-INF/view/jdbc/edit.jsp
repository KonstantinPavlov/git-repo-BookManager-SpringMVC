<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
                        <li><a href="../index.html">На главную</a>
                        </li>
                        <li><a href="../jdbcSelectAllBooks">Коллекция книг</a>
                        </li>
                        <li><a href="../book/${book.id}">${book.name}</a>
                        </li>
                        <li class="active">Редактирование
                        </li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <!-- BOOK Item Row -->
            <div class="row">
                <!-- Related Projects Row -->
                <div class="row">
                    <div class="col-md-6">
                        <img class="img-responsive img-hover img-related" src="${book.image}" alt="">
                    </div>

                    <div class="col-md-6">
                        <form:form name="updateBook" id="updateBook" action="/update/${book.id}"
                                   method="post" modelAttribute="book" novalidate="true" accept-charset="UTF-8" enctype="multipart/form-data" >

                            <div class="control-group form-group">
                                <div class="controls">
                                    <h4><label>Название книги:</label></h4>
                                    <input type="text" class="form-control" id="name" name="name" value="${book.name}"
                                           required="required" data-validation-required-message="Внесите название книги." >
                                    <p class="help-block"></p>
                                </div>
                            </div>


                                <div class="control-group form-group">
                                    <div class="controls">
                                        <label>Описание книги:</label>
                                        <textarea rows="10" cols="100" class="form-control" id="description" name="description"
                                                 required="required" data-validation-required-message="Введите описание книги" maxlength="999" style="resize:none"><c:out value="${book.description}"></c:out></textarea>
                                    <p class="help-block"></p>
                                    </div>
                                </div>


                            <div class="control-group form-group">
                                <div class="controls">
                                    <label>Автор:</label>
                                    <input type="text" class="form-control" id="author" name="author" value="${book.author}"
                                           required="required" data-validation-required-message="Введите автора.">
                                    <p class="help-block"></p>
                                </div>

                                <div class="controls">
                                    <label>Обложка книги:</label>
                                    <input type="file" accept="image/*" class="form-control" id="multipartFile" name="multipartFile"
                                           required data-validation-required-message="Выберите обложку книги." >
                                    <p class="help-block"></p>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Готово</button>

                        </form:form>


                    </div>
                </div>
            </div>

        </div>


        <!-- /.container -->

        <!-- jQuery -->
        <script src="../resources/js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../resources/js/bootstrap.min.js"></script>
    </jsp:body>

</page:template>
