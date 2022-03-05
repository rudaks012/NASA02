<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.hr{
 	background-color : #d5c9ea !important;
   	margin: 10px !important;
}
.table thead th{
	background-color : #e0d6f2 !important;
}
</style>
</head>
<body>
	<div class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center ">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="hero-cap text-center pt-50">
						<h2>신고 내역</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<section class="blog_area section-padding">
	    <div class="container">
	        <div class="row">
	        	<div class="col-3">
	        		<div class="blog_right_sidebar">
	                    <aside class="single_sidebar_widget post_category_widget">
	                        <h4 class="widget_title">MYPAGE MENU</h4>
	                        <ul class="list cat-list">
								<li><a href="sellerService.do" class="d-flex">
										<p>서비스관리</p>
								</a></li>
								<li><a href="sellerPromotion.do" class="d-flex">
										<p>프로모션관리</p>
								</a></li>
								<li><a href="sellerCalendar.do" class="d-flex">
										<p>일정관리</p>
								</a></li>
								<li><a href="sellerReview.do" class="d-flex">
										<p>리뷰관리</p>
								</a></li>
								<li><a href="sellerPayment.do" class="d-flex">
										<p>결제조회</p>
								</a></li>
								<li><a href="sellerSales.do" class="d-flex">
										<p>매출확인</p>
								</a></li>
								<li><a href="sellerReport.do" class="d-flex">
										<p style="font-weight: bold;">신고관리</p>
								</a></li>
								<li><a href="sellerKnowhow.do" class="d-flex">
										<p>판매자 노하우</p>
								</a></li>
							</ul>
	                    </aside>                            
	                </div>
	        	</div>
	        	<div class="col-9">
	        		<div class="blog_left_sidebar">
                    	<article class="blog_item">
							<div class="justify-content-center">
								<a class="d-inline-block" style="margin-top:20px;">
										<h3>신고내역</h3>
									</a>
								<hr class="hr"/>
								<table class="table caption-top table-bordered thead-light  text-center" style="margin-top:40px;">
									<thead class="thead-light">
										<tr>
											<th>순번</th>
											<th>신고일</th>
											<th>신고대상</th>
											<th>신고유형</th>
											<th>신고내용</th>
											<th>신고결과</th>
											<th>신고처리날짜</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${reports }" var="report" varStatus="status">
										<tr>
											<th scope="row">${fn:length(reports)-status.index }</th>
											<td>${fn:substring(report.re_date,0,11) }</td>
											<td>${report.re_res }</td>
											<td>${report.re_type }</td>
											<td>${report.re_subject }</td>
											<td>${report.re_result }</td>
											<td>${report.re_rpoertdate }</td>
										</tr>
									</c:forEach>
										
									</tbody>
								</table>
							</div>
                    	</article>
                    </div>
	        	</div>
	        </div>
	    </div>
	</section>
	
	
            
                
</body>
</html>