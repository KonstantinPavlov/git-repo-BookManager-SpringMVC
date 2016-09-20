<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>

<page:template>

  <jsp:attribute name="title">Book manager Spring MVC</jsp:attribute>

  <jsp:body>

<!-- Header Carousel -->
<header id="myCarousel" class="carousel slide">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class=""></li>
    <li data-target="#myCarousel" data-slide-to="1" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item">
      <div class="fill" style="background-image:url('${pageContext.request.contextPath}/resources/images/java.png');"></div>
      <div class="carousel-caption">
        <h2></h2>
      </div>
    </div>
    <div class="item active">
      <div class="fill" style="background-image:url('${pageContext.request.contextPath}/resources/images/spring.jpg');"></div>
      <div class="carousel-caption">
        <h2></h2>
      </div>
    </div>
    <div class="item">
      <div class="fill" style="background-image:url('${pageContext.request.contextPath}/resources/images/mysql-backup.jpg');"></div>
      <div class="carousel-caption">
        <h2></h2>
      </div>
    </div>
    <div class="item">
      <div class="fill" style="background-image:url('${pageContext.request.contextPath}/resources/images/hibernate.png');"></div>
      <div class="carousel-caption">
        <h2></h2>
      </div>
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="icon-prev"></span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="icon-next"></span>
  </a>
</header>

<!-- Page Content -->
<div class="container">

  <!-- Portfolio Section -->
  <div class="row">
    <div class="col-lg-12">
      <h1 class="page-header">Добро пожаловать в Book Manager Spring MVC Project</h1>
    </div>
    <div class="col-md-4 col-sm-6">
      <a href="/jdbcSelectAllBooks">
        <img class="img-responsive img-portfolio img-hover" src='${pageContext.request.contextPath}/resources/images/books.png' alt="">
      </a>
    </div>
  </div>
  <!-- /.row -->

  <!-- Marketing Icons Section -->
  <div class="row">
    <div class="col-lg-12">
      <h2 class="page-header">
        Использованные технологии
      </h2>
    </div>
    <div class="col-md-4">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4><i class="fa fa-fw fa-check"></i>Загрузка файла</h4>
        </div>
        <div class="panel-body">
          <p>Здесь находится пример по загрузке файлов на сервер. Также есть пример по созданию файла Excel PDF с заполненеим тестовыми данными</p>
          <a href="file.html" class="btn btn-default">Попробовать</a>

        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4><i class="fa fa-fw fa-gift"></i>Bootstrap v3.2.0</h4>
        </div>
        <div class="panel-body">
          <p>Предназначен для всех, во всем мире.
            Bootstrap - интуитивно простой и в тоже время мощный интерфейсный фрейморк, повышающий скорость и облегчающий разработку web-приложений.</p>
          <a href="http://bootstrapdocs.com/v3.2.0/docs/" class="btn btn-default">Подробнее</a>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4><i class="fa fa-fw fa-compass"></i>Spring Framework</h4>
        </div>
        <div class="panel-body">
          <p>Универсальный фреймворк с открытым исходным кодом для Java-платформы. Также существует форк для платформы .NET Framework, названный Spring.NET. Первая версия была написана Родом Джонсоном, который впервые опубликовал её вместе с изданием своей книги «Expert One-on-One Java EE Design and Development».</p>
          <a href="http://docs.spring.io/spring/docs/4.3.x/spring-framework-reference/html/mvc.html" class="btn btn-default">Подробнее</a>
        </div>
      </div>
    </div>
  </div>
  <!-- /.row -->



  <!-- Features Section -->
  <div class="row">
    <div class="col-lg-12">
      <h2 class="page-header">Modern Business Features</h2>
    </div>
    <div class="col-md-6">
      <p>The Modern Business template by Start Bootstrap includes:</p>
      <ul>
        <li><strong>Bootstrap v3.2.0</strong>
        </li>
        <li>jQuery v1.11.0</li>
        <li>Font Awesome v4.1.0</li>
        <li>Working PHP contact form with validation</li>
        <li>Unstyled page elements for easy customization</li>
        <li>17 HTML pages</li>
      </ul>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis, omnis doloremque non cum id reprehenderit, quisquam totam aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis quia dolorum ducimus unde.</p>
    </div>
    <div class="col-md-6">
      <img class="img-responsive" src="http://placehold.it/700x450" alt="">
    </div>
  </div>
  <!-- /.row -->

  <hr>

  <!-- Call to Action Section -->
  <div class="well">
    <div class="row">
      <div class="col-md-8">
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p>
      </div>
      <div class="col-md-4">
        <a class="btn btn-lg btn-default btn-block" href="#">Call to Action</a>
      </div>
    </div>
  </div>

  <hr>


</div>
<!-- /.container -->

<!-- jQuery -->
<script src="/resources/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/resources/js/bootstrap.min.js"></script>

<!-- Script to Activate the Carousel -->
<script>
  $('.carousel').carousel({
    interval: 5000 //changes the speed
  })
</script>


  </jsp:body>

</page:template>
