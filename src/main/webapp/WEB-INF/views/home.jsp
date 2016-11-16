<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="include/header.jsp" %>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<img src="resources/hos_2.png" alt="Image">
			<div class="carousel-caption">
				<h1>THMS Project</h1>
				<p>Group2</p>
			</div>
		</div>

		<div class="item">
			<img src="resources/hos_1.png" alt="Image">
			<div class="carousel-caption">
				<h1>종합 병원 관리 시스템</h1>
				<p>Total Hospital Management System</p>
			</div>
		</div>
	</div>

	<!-- Left and right controls -->
	<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		<span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		<span class="sr-only">Next</span>
	</a>
</div>

<div class="container text-center">
	<h3>Total Hospital Management System</h3><br>
	<div class="row">
		<div class="col-sm-4">
			<label>병원 뉴스</label>
			<div class="well">
				<table class="table table-bordered">
					<tbody>
<c:forEach items="${nlist}" var="row">
						<tr>
							<td><a href="/nboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${row.bno}">${row.title}</a></td>																
						</tr>											
</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="col-sm-4">
			<label>게시판</label>
			<div class="well">
				<table class="table table-bordered">
					<tbody>
<c:forEach items="${list}" var="row">
						<tr>
							<td><a href="/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${row.bno}">${row.title}<strong>[ ${row.replycnt} ]</strong></a></td>																							
						</tr>						
</c:forEach>
					</tbody>
				</table>
			</div>			
		</div>
		<div class="col-sm-4">
			<label>찾아오시는 길</label>
			<img src="resources/root_1.jpg" class="img-responsive" style="width:100%" alt="Image">
			<br>
			<label>병원 연락처</label>
			<img src="resources/tel.png" class="img-responsive" style="width:100%" alt="Image">
						
		</div>
	</div>
</div><br>

<%@ include file="include/footer.jsp" %>