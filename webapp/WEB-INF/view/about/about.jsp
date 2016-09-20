<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>

<page:template>

    <jsp:attribute name="title">О проекте</jsp:attribute>

    <jsp:body>

        <!-- Page Content -->
        <div class="container">

            <!-- Page Heading/Breadcrumbs -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">О проекте
                        <small>Основные цели</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a>
                        </li>
                        <li class="active">О проекте</li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <!-- Intro Content -->
            <div class="row">
                <div class="col-md-6">
                    <img class="img-responsive" src='${pageContext.request.contextPath}/resources/images/java.jpg' alt="">
                </div>
                <div class="col-md-6">
                    <h3>О проекте Book Manager Spring MVC Project</h3>
                    <p>Проект создается по мотивам задания для собеседования на должность стажера Java в компанию <a href="http://www.masterdata.ru/">MASTERDATA</a> . Было принято решение переделать существующий проект на фреймворк Spring MVC. Вот кстати ссылка на репозиторий прошлого проекта на <a href="https://github.com/KonstantinPavlov/git-repo-BookManager">github.com</a></p>
                    <p>В процессе поиска информации наткнулся на курс: <a href="http://javastudy.ru/spring-mvc/review-mvc-angularjs-bootstrap-html5/">http://javastudy.ru/</a> по данному фреймворку. Этот цикл заданий и лег в основу проекта. </p>
                    <p>В общем то текст задания звучит следующим образом:
                        <br>Создать электронную библиотеку с простейшим web-интерфейсом, позволяющим:
                        <ul>
                            <li>Добавлять информацию о новых книгах через форму</li>
                            <li>Хранить данные в базе (В нашем случае это база на MySQL)</li>
                            <li>Просматривать список книг с основными данными</li>
                            <li>Осуществлять поиск книги по названию или автору</li>
                            <li>Переходить к детальному описанию книги с возможностью редактирования</li>
                            <li>Удалять книги из списка</li>
                            <li>Описание книги должно содержать изображение (обложку)</li>
                        </ul>
                    </p>
                </div>
            </div>
            <!-- /.row -->

            <!-- Team Members -->
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">Команда проекта <small>Как громко звучит то...</small></h2>

                </div>
                <div class="col-md-4 text-center">
                    <div class="thumbnail">
                        <img class="img-responsive" src='${pageContext.request.contextPath}/resources/images/developer.png' alt="">
                        <div class="caption">
                            <h3>Konstantin Pavlov<br>
                                <small>Разработчик</small>
                            </h3>
                            <p>Собственно первый и единственный разработчик</p>
                            <ul class="list-inline">
                                <li><a href="#"><i class="fa fa-2x fa-facebook-square"></i></a>
                                </li>
                                <li><a href="#"><i class="fa fa-2x fa-linkedin-square"></i></a>
                                </li>
                                <li><a href="#"><i class="fa fa-2x fa-twitter-square"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!--
                 <div class="col-md-4 text-center">
                     <div class="thumbnail">
                         <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                         <div class="caption">
                             <h3>John Smith<br>
                                 <small>Job Title</small>
                             </h3>
                             <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste saepe et quisquam nesciunt maxime.</p>
                             <ul class="list-inline">
                                 <li><a href="#"><i class="fa fa-2x fa-facebook-square"></i></a>
                                 </li>
                                 <li><a href="#"><i class="fa fa-2x fa-linkedin-square"></i></a>
                                 </li>
                                 <li><a href="#"><i class="fa fa-2x fa-twitter-square"></i></a>
                                 </li>
                             </ul>
                         </div>
                     </div>
                 </div>
                 <div class="col-md-4 text-center">
                     <div class="thumbnail">
                         <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                         <div class="caption">
                             <h3>John Smith<br>
                                 <small>Job Title</small>
                             </h3>
                             <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste saepe et quisquam nesciunt maxime.</p>
                             <ul class="list-inline">
                                 <li><a href="#"><i class="fa fa-2x fa-facebook-square"></i></a>
                                 </li>
                                 <li><a href="#"><i class="fa fa-2x fa-linkedin-square"></i></a>
                                 </li>
                                 <li><a href="#"><i class="fa fa-2x fa-twitter-square"></i></a>
                                 </li>
                             </ul>
                         </div>
                     </div>
                 </div>
                 <div class="col-md-4 text-center">
                     <div class="thumbnail">
                         <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                         <div class="caption">
                             <h3>John Smith<br>
                                 <small>Job Title</small>
                             </h3>
                             <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste saepe et quisquam nesciunt maxime.</p>
                             <ul class="list-inline">
                                 <li><a href="#"><i class="fa fa-2x fa-facebook-square"></i></a>
                                 </li>
                                 <li><a href="#"><i class="fa fa-2x fa-linkedin-square"></i></a>
                                 </li>
                                 <li><a href="#"><i class="fa fa-2x fa-twitter-square"></i></a>
                                 </li>
                             </ul>
                         </div>
                     </div>
                 </div>
                 <div class="col-md-4 text-center">
                     <div class="thumbnail">
                         <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                         <div class="caption">
                             <h3>John Smith<br>
                                 <small>Job Title</small>
                             </h3>
                             <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste saepe et quisquam nesciunt maxime.</p>
                             <ul class="list-inline">
                                 <li><a href="#"><i class="fa fa-2x fa-facebook-square"></i></a>
                                 </li>
                                 <li><a href="#"><i class="fa fa-2x fa-linkedin-square"></i></a>
                                 </li>
                                 <li><a href="#"><i class="fa fa-2x fa-twitter-square"></i></a>
                                 </li>
                             </ul>
                         </div>
                     </div>
                 </div>
                 <div class="col-md-4 text-center">
                     <div class="thumbnail">
                         <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                         <div class="caption">
                             <h3>John Smith<br>
                                 <small>Job Title</small>
                             </h3>
                             <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste saepe et quisquam nesciunt maxime.</p>
                             <ul class="list-inline">
                                 <li><a href="#"><i class="fa fa-2x fa-facebook-square"></i></a>
                                 </li>
                                 <li><a href="#"><i class="fa fa-2x fa-linkedin-square"></i></a>
                                 </li>
                                 <li><a href="#"><i class="fa fa-2x fa-twitter-square"></i></a>
                                 </li>
                             </ul>
                         </div>
                     </div>
                 </div>
                 -->
             </div>
             <!-- /.row -->

            <!-- Our Customers -->
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">Our Customers</h2>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6">
                    <img class="img-responsive customer-img" src="http://placehold.it/500x300" alt="">
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6">
                    <img class="img-responsive customer-img" src="http://placehold.it/500x300" alt="">
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6">
                    <img class="img-responsive customer-img" src="http://placehold.it/500x300" alt="">
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6">
                    <img class="img-responsive customer-img" src="http://placehold.it/500x300" alt="">
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6">
                    <img class="img-responsive customer-img" src="http://placehold.it/500x300" alt="">
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6">
                    <img class="img-responsive customer-img" src="http://placehold.it/500x300" alt="">
                </div>
            </div>
            <!-- /.row -->


        </div>
        <!-- /.container -->

        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>



    </jsp:body>

</page:template>
