<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
.servnav {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	border: 1px solid #e7e7e7;
	background-color: #f3f3f3;
}

.nav-item {
	float: left;
}

.nav-item a {
	display: block;
	color: #666;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

.nav-item a:hover:not(.active) {
	background-color: #ddd;
}

.genric-btn.danger-border {
	color: #9e68ff;
	border: 1px solid #8a2fdb;
}

.powertb td {
	width: 120px;
	height: 50px;
	font-size: 12px;
}

.endservtb td {
	width: 180px;
	height: 50px;
	font-size: 12px;
}

.powerbtn, .modal-header {
	background-color: #d5c9ea !important;
}

.modal-footer {
	display: block !important;
	text-align: center;
}

.powerp {
	color: red;
	font-size: 8px;
	border-bottom: 1px solid #999294;
}

.endp {
	padding: 30px 0px 20px 0px;
}

.br {
	border-top: 1px solid #999294;
	margin-top: 20px;
	padding-top: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid #999294;
}

.paytb td {
	width: 120px;
	height: 50px;
	font-size: 12px;
}

.paytb td:nth-child(2) {
	width: 200px;
}

.category-listing {
	height: 350px !important;
}

.fables-single-item {
	color: rgb(64, 64, 64);
}

.fables-single-item:hover {
	background-color: #d5c9ea;
}

.nav-link.active {
	background-color: #d5c9ea !important;
	color: white !important;
}

input[type=date] {
	border: 1px solid lightgray;
	color: lightgray;
	margin-right: 10px;
}

.paybtn {
	margin-right: 10px;
}

.hr {
	background-color: #d5c9ea !important;
	margin: 10px !important;
}

.pt-70 {
	padding-top: 0px;
}

.blog_details img {
	width: 354px;
	height: 256px;
}

.genric-btn.danger-border:hover {
	background-color: #d5c9ea !important;
	color: white;
}

.pl-md-5, .px-md-5 {
	padding-left: 2rem !important;
	padding-right: 2rem !important;
}

/* .listing-details-area .single-listing .list-footer ul{
	justify-content: right;
} */

.price{
	text-align: right;
	font-size: 25px !important;
	font-weight: bold;
}
.category{
	font-size: 13px;
	color: gray;
}
.line{
	text-align: right;
	color: gray;
	font-size: 13px;
}
.price img{
	width: 100px;
	height: 28px;
}
</style>
</head>
<body>
	<!-- ?????? -->
	<div
		class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="hero-cap text-center pt-50">
						<h2>????????? ??????</h2>
					</div>
				</div>
			</div>
		</div>
	</div>



	<section class="blog_area section-padding">
		<div class="container">
			<div class="row">
				<!-- Left content -->
				<div class="col-3">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">MYPAGE MENU</h4>
							<ul class="list cat-list">
								<li><a href="sellerService.do" class="d-flex">
										<p style="font-weight: bold;">???????????????</p>
								</a></li>
								<li><a href="sellerPromotion.do" class="d-flex">
										<p>??????????????????</p>
								</a></li>
								<li><a href="sellerCalendar.do" class="d-flex">
										<p>????????????</p>
								</a></li>
								<li><a href="sellerReview.do" class="d-flex">
										<p>????????????</p>
								</a></li>
								<li><a href="sellerPayment.do" class="d-flex">
										<p>????????????</p>
								</a></li>
								<li><a href="sellerSales.do" class="d-flex">
										<p>????????????</p>
								</a></li>
								<li><a href="sellerReport.do" class="d-flex">
										<p>????????????</p>
								</a></li>
								<li><a href="sellerKnowhow.do" class="d-flex">
										<p>????????? ?????????</p>
								</a></li>
							</ul>
						</aside>
					</div>
				</div>
				
				
				<!-- Right content -->
				<div class="col-9">
					<jsp:useBean id="now" class="java.util.Date" />
					<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
					<div class="blog_left_sidebar">
						<article class="blog_item">
							<div class="justify-content-center">
								<a class="d-inline-block" style="margin-top: 20px;">
									<h3>????????? ??????</h3>
								</a>
								<hr class="hr" />
								<a href="serviceInsert.do" class="genric-btn danger">????????? ??????</a>
								<!-- <a href="" class="genric-btn danger" data-toggle="modal"
									data-target="#PowerModal">??????????????? ??????</a>  -->
								<!-- <a href="" class="genric-btn danger" data-toggle="modal"
									data-target="#payModal">?????? ??????</a> -->

								<div class="blog_details">
									<div class="container">
										<nav class="fables-single-nav">
											<div class="nav nav-tabs" id="nav-tab" role="tablist">
												<a
													class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-forth-after px-3 px-md-5 font-15 semi-font border-0 active rounded-0 py-3"
													id="nav-desc-tab" data-toggle="tab" href="#nav-desc"
													role="tab" aria-controls="nav-desc" aria-selected="true">????????????
													?????????</a> <a
													class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-forth-after border-0 px-3 px-md-5 font-15 semi-font rounded-0 py-3"
													id="nav-info-tab" data-toggle="tab" href="#nav-info"
													role="tab" aria-controls="nav-info" aria-selected="false">?????????
													?????????</a> <a
													class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-forth-after border-0 px-3 px-md-5 font-15 semi-font rounded-0 py-3"
													id="nav-end-tab" data-toggle="tab" href="#nav-end"
													role="tab" aria-controls="nav-end" aria-selected="false">????????????
													?????????</a> 
											</div>
										</nav>
										<br /> <br />
										<div class="tab-content" id="nav-tabContent">
											<div class="tab-pane fade show active" id="nav-desc"
												role="tabpanel" aria-labelledby="nav-desc-tab">
											
													<div class="listing-details-area">
														<div class="container">
															<div class="row">

																<c:forEach items="${sellerMainServiceList }" var="service">
																	<c:if
																		test="${service.ser_status eq 'N' && empty service.ser_end}">
																		<div class="col-lg-6">
																			<div class="single-listing mb-30">
																				<div class="list-img">
																					<img src="fileupload/${service.ser_img }"
																						id="prvimg" alt="">
																				</div>
																				<div class="list-caption">
																				<span style="cursor: pointer;" onclick="location.href='serviceDetail.do?ser_code=${service.ser_code  }'">Open</span>
																					<div class="category">* ${service.category } > ${service.sub_category }</div>
																					<div class="line"> ${service.ser_line }</div>
																					<br/>
																					<h3>
																						<a
																							href="serviceDetail.do?ser_code=${service.ser_code }">${service.ser_title }</a>
																							 
																					</h3>
																					<div>??????????????? : s${service.ser_code }</div>
																					<br/>
																					<c:if test="${not empty service.prodiscount }">
																						<div class="price">??? <del><fmt:formatNumber value="${service.ser_price }" pattern="###,###"/></del> </div>
																						<div class="price" style="color:red;"><img src="resources/user/assets/img/promotion.png"> ???<fmt:formatNumber value="${service.prodiscount }" pattern="###,###"/></div>
																			
																					</c:if>
																					<c:if test="${empty service.prodiscount }">
																						<div class="price"> ??? ${service.ser_price }</div>
																					</c:if>
																					<div class="list-footer">
																						<ul>
																							<li >
																								<button type="button"
																									onclick="location.href='serviceUpdateForm.do?ser_code=${service.ser_code }'"
																									class="genric-btn danger-border circle">??????</button>
																							</li>
																							<li>
																								<button type="button"
																									class="genric-btn danger-border circle"
																									data-toggle="modal" data-target="#endModal"
																									data-sercode="${service.ser_code }"
																									data-sertitle="${service.ser_title }"
																									data-end="${service.pay_enddate }"
																									data-promax="${service.pro_max }"
																									data-powermax="${service.power_max }">??????</button>

																							</li>
																						</ul>
																					</div>
																				</div>
																			</div>
																		</div>
																	</c:if>
																</c:forEach>
															</div>
														</div>
													</div>
												
											</div>
											<div class="tab-pane fade show" id="nav-end" role="tabpanel"
												aria-labelledby="nav-end-tab">
											
													<div class="listing-details-area">
														<div class="container">
															<div class="row">

																<c:forEach items="${sellerMainServiceList }" var="service">
																	<c:if
																		test="${service.ser_status eq 'N' && not empty service.ser_end}">
																		<div class="col-lg-6">
																			<div class="single-listing mb-30">
																				<div class="list-img">
																					<img src="fileupload/${service.ser_img }"
																						id="prvimg" alt="">
																				</div>
																				<div class="list-caption">
																				<span style="cursor: pointer;" onclick="location.href='serviceDetail.do?ser_code=${service.ser_code  }'">Open</span>
																					<div class="category">* ${service.category } > ${service.sub_category }</div>
																					<div class="line"> ${service.ser_line }</div>
																					<br/>
																					<h3>
																						<a
																							href="serviceDetail.do?ser_code=${service.ser_code }">${service.ser_title }</a>
																					</h3>
																					<div>??????????????? : s${service.ser_code }</div>
																					<br/>
																					<c:if test="${not empty service.prodiscount }">
																						<div class="price">??? <del><fmt:formatNumber value="${service.ser_price }" pattern="###,###"/></del> </div>
																						<div class="price" style="color:red;"><img src="resources/user/assets/img/promotion.png"> ???<fmt:formatNumber value="${service.prodiscount }" pattern="###,###"/></div>
																						
																					</c:if>
																					<c:if test="${empty service.prodiscount }">
																						<div class="price"> ??? ${service.ser_price }</div>
																					</c:if>
																					<div class="list-footer" style="display: block;">
																						<ul>
																							<li >
																								<button type="button"
																									onclick="location.href='serviceUpdateForm.do?ser_code=${service.ser_code }'"
																									class="genric-btn danger-border circle">??????</button>
																							</li>

																						</ul>
																					</div>
																				</div>
																			</div>
																		</div>
																	</c:if>
																</c:forEach>
															</div>
														</div>
													</div>
												
											</div>
											<div class="tab-pane fade" id="nav-info" role="tabpanel"
												aria-labelledby="nav-info-tab">
													<div class="listing-details-area">
														<div class="container">
															<div class="row">

																<c:forEach items="${sellerMainServiceList }" var="service">
																	<c:if test="${service.ser_status eq 'Y'}">

																		<div class="col-lg-6">
																			<div class="single-listing mb-30">
																				<div class="list-img">
																					<img src="fileupload/${service.ser_img }" alt="">
																				</div>
																				<div class="list-caption">
																					<div class="category">* ${service.category } > ${service.sub_category }</div>
																					<div class="line"> ${service.ser_line }</div>
																					<br/>
																					<h3>
																						<a href="serviceDetail.do?ser_code=${service.ser_code }">${service.ser_title }</a>
																					</h3>
																					<div>??????????????? : s${service.ser_code }</div>
																					<br/>
																					<div class="price"> ??? ${service.ser_price }</div>
																					<div class="list-footer">
																						<ul>
																							<li>
																								<!-- <div style="margin-left: 210px;">
																							<a href="#" class="genric-btn danger-border circle" data-toggle="modal" data-target="#endModal">??????</a>
																						</div> -->
																								<div>* ????????? ??????????????????.</div>
																							</li>
																						</ul>
																					</div>
																				</div>
																			</div>
																		</div>
																	</c:if>
																</c:forEach>
															</div>
														</div>
													</div>
												
											</div>
											
										</div>
										 
									</div>
								</div>
							</div>
						</article>
					</div>
					<div class="row justify-content-center mt-10">
						<nav aria-label="Page navigation example">
						  <ul class="pagination">
							  <c:if test="${paging.prev }">
								  <li class="page-item"><a class="page-link" href="sellerService.do?pageNum=${paging.startPage - 1 }&amount=${paging.amount}">&lt;</a></li>
							  </c:if>
							  <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
								  <c:choose>
									  <c:when test="${p == paging.pageNum }">
										  <li class="page-item"><b class="page-link">${p }</b></li>
									  </c:when>
									  <c:when test="${p != paging.pageNum }">
										  <li class="page-item"><a class="page-link" href="sellerService.do?pageNum=${p }&amount=${paging.amount}">${p }</a></li>
									  </c:when>
								  </c:choose>
							  </c:forEach>
							  <c:if test="${paging.next }">
								  <li class="page-item"><a class="page-link" href="sellerService.do?pageNum=${paging.endPage+1 }&amount=${paging.amount}">&gt;</a></li>
							  </c:if>
						  </ul>
						</nav>
					</div>
					<!--Pagination End  -->
				</div>
			</div>
		</div>
	</section>
	<!-- ?????? -->
	<div class="modal fade" id="PowerModal" tabindex="-1" role="dialog"
		aria-labelledby="PowerModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"
						style="text-align: center;">??????????????? ??????</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form id="frm" action="powerserviceInsert.do" method="post">
					<div class="modal-body">
						<p>
							??????????????????? <br /> ????????? ????????? ????????????! <br /> ????????? ???????????? ?????? ????????? ????????? ????????? ???
							????????????. <br /> ????????? ???????????? ?????? ????????? ???????????? ???????????? ???????????????.
						</p>
						<p class="powerp">
							*???????????????????????? ???????????? ???????????????. <br /> *?????? ?????? ??? ?????? ???????????????.<br /> <br />
						</p>

						<table class="powertb">
							<tr>
								<td>???????????????</td>
								<td><div class="default-select" id="default-select">
										<select id="powerS"  name="ser_code" >
											<c:forEach items="${sellerMainServiceList }" var="service">
											<c:if test="${service.ser_status eq 'N'}">
												<option value="${service.ser_code }">${service.ser_title}</option>
												
											</c:if>
											</c:forEach>
										</select>
									</div>
									<c:forEach items="${sellerMainServiceList }" var="service">
										<c:if test="${service.ser_status eq 'N'}">
											<input type="hidden" id="${service.ser_code }" value="${fn:substring(service.ser_end,0,10) }">
										</c:if>
									</c:forEach>
								</td>
							</tr>
							<tr>
								<td>???????????????</td>
								<td><input type="date" name="power_start" id="powerdate" min="" max="" step="7"></td>
							</tr>
							<tr>
								<td>??????</td>
								<td><input type="text" value="500000" disabled>
								<input type="hidden" name="power_price" value="500000">
								</td>
							</tr>
						</table>

					</div>
					<div class="modal-footer">
						<a href="#" class="genric-btn primary  radius powerbtn"
							id="check_module" data-toggle="modal">??????</a> <a href="#"
							class="genric-btn primary  radius powerbtn" data-dismiss="modal">??????</a>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="modal fade" id="endModal" tabindex="-1" role="dialog"
		aria-labelledby="endModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"
						style="text-align: center;">????????? ??????</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<p class="endp">????????????(?????????1)??? ?????????????????????????</p>

					<table class="endservtb">
						<tr>
							<td>?????????????????????</td>
							<td><textarea cols="30" rows="3" id="ser_reason"></textarea></td>
						</tr>
						<tr>
							<td>?????? ?????? ?????? ??????</td>
							<td><input type="text" id="ser_end" disabled></td>
						</tr>
						<!-- <tr>
							<td>???????????? ?????? ??????</td>
							<td><input type="text" id="ser_proend" disabled></td>
						</tr> -->
						<tr>
							<td>??????????????? ?????? ??????</td>
							<td><input type="text" id="ser_powerend" disabled></td>
						</tr>
						<tr>
							<td>?????? ?????????</td>
							<td><input type="date" id="ser_cal"></td>
						</tr>
					</table>

				</div>
				<div class="modal-footer">
					<a href="#" class="genric-btn primary  radius powerbtn" id="endbtn"
						data-toggle="modal">??????</a> <a href="#"
						class="genric-btn primary  radius powerbtn" data-dismiss="modal">??????</a>
				</div>
			</div>
		</div>
	</div>


	<script>
		$(function() { // actvie ????????? 
			$(".nav-item > .active").css("color", "white");
			$('.nav-link').click(function() {
				// .nav-link ????????? ????????? active ??? ?????? ???, 
				$(".nav-item > .active").css("color", "#666");
				$('.nav-link').removeClass('active'); // ????????? ?????? active ?????? 
				$(this).addClass('active');
				$(".nav-item > .active").css("color", "white");
			});

			$("#ydate").click(function() {
				console.log($("#conference").attr("style", "display: block;"))
			})
			$("#ndate").click(function() {
				console.log($("#conference").attr("style", "display: none;"))
			})

			/* enddate(); */
			var paramDate = new Date();
			var day = paramDate.getDay();
			var diff = paramDate.getDate() - day + (day == 0 ? -6 : 1);
			var mon = new Date(paramDate.setDate(diff)).toISOString().substring(0, 10);
			$("#powerdate").attr('min', mon);
		});

		$("#nav-tab a").on("click", function(event) {
			event.preventDefault();
			$(this).tab("show");
		})

		$(document).ready(
				function() {

					$("#endModal").on(
							"show.bs.modal",
							function(event) {

								sercode = $(event.relatedTarget).data("sercode");
								sertitle = $(event.relatedTarget).data("sertitle");
								serend = $(event.relatedTarget).data("end");
								promax = $(event.relatedTarget).data("promax");
								powermax = $(event.relatedTarget).data("powermax");
								
								if (serend == '') {
									$("#ser_end").val('-');
								}else{
									$("#ser_end").val(serend.substr(0, 10));
								}
								
								/* if(promax == ''){
									$("#ser_proend").val('-');
								}else{
									$("#ser_proend").val(promax.substr(0, 10));
								} */
								
								if(powermax == ''){
									$("#ser_powerend").val('-');
								}else{
									$("#ser_powerend").val(powermax.substr(0, 10));
								}
								
								console.log(sercode);
								console.log(sertitle);
								console.log(serend);
								console.log(promax);
								console.log(powermax);
								
								/* $.ajax({
									url : "endPromotion.do",
									dataType : "text",
									type : "post",
									data : {
										sercode : sercode
									},
									success : function(result) {
										console.log(result);
										if (result == '') {
											$("#ser_proend").val('-');
										} else {
											$("#ser_proend").val(result.substr(0, 10));
										}
									},
									error : function(err) {
										console.log(err);
									}
								})

								$.ajax({
									url : "endPower.do",
									dataType : "text",
									type : "post",
									data : {
										sercode : sercode
									},
									success : function(result) {
										console.log(result);
										if (result == '') {
											$("#ser_powerend").val('-');
										} else {
											$("#ser_powerend").val(result.substr(0, 10));
										}
									},
									error : function(err) {
										console.log(err);
									}
								}) */
								
								var reason = document.getElementById("ser_reason");
								reason.value = '';
								var end = document.getElementById("ser_cal");
								end.value = '';
								
								//????????? ??????
								if (serend >= powermax) {
								 	var today = new Date(serend.substr(0, 10));
									today.setMonth(today.getMonth() + 1);
									today.setDate(today.getDate());

									var year = today.getFullYear();
									var month = (today.getMonth() < 10 ? '0' : '') + today.getMonth();
									var day = (today.getDate() < 10 ? '0' : '') + today.getDate();
									date = year + '-' + month + '-' + day
									console.log(date);
									$("#ser_cal").attr('min', date);
									console.log(serend.substr(0, 10))
								} else if(serend < powermax){
									var today = new Date(powermax.substr(0, 10));
									today.setMonth(today.getMonth() + 1);
									today.setDate(today.getDate());

									var year = today.getFullYear();
									var month = (today.getMonth() < 10 ? '0' : '') + today.getMonth();
									var day = (today.getDate() < 10 ? '0' : '')	+ today.getDate();
									date = year + '-' + month + '-' + day
									console.log(date);
									$("#ser_cal").attr('min', date);
								}else{
									var today = new Date();
									today.setMonth(today.getMonth() + 1);
									today.setDate(today.getDate());

									var year = today.getFullYear();
									var month = (today.getMonth() < 10 ? '0' : '') + today.getMonth();
									var day = (today.getDate() < 10 ? '0' : '')	+ today.getDate();
									date = year + '-' + month + '-' + day
									console.log(date);
									$("#ser_cal").attr('min', date);
								}
								$(".endp").text(sertitle + '???(???) ?????????????????????????');
								$(".endp").attr('id', sercode);
								

							});
				});

		$("#endbtn").on("click", function() {
			let ser_code = $(".endp").attr('id');
			let ser_reason = $("#ser_reason").val();
			let ser_end = $("#ser_cal").val();

			if (ser_reason == '') {
				alert('??????????????? ??????????????????.');
				$("#ser_reason").focus();
				return;
			} else if (ser_end == '') {
				alert('?????? ??????????????? ??????????????????.');
				return;
			}
			
			
			$.ajax({
				url : "endService.do",
				dataType : "text",
				type : "post",
				data : {
					ser_code : ser_code,
					ser_reason : ser_reason,
					ser_end : ser_end
				},
				success : function(result) {
					if (result == "T") {
						alert('?????? ?????????????????????.\n'+ser_end+'??? ???????????? ??????????????? ?????? ???????????????.');
						location.href = "sellerService.do";
					} else{
						alert('????????? ????????? ?????? ?????????????????????.');
						return;
					}
				}
			})
		})

		/* function enddate() {
			console.log($("#powerS option:selected").val());
			var powerno = $("#powerS option:selected").val();
			
			var paramDate = new Date();
			var day = paramDate.getDay();
			var diff = paramDate.getDate() - day + (day == 0 ? -6 : 1);
			var mon = new Date(paramDate.setDate(diff)).toISOString().substring(0, 10);
			$("#powerdate").attr('min', mon);
			
			var powerend = document.getElementById(powerno).value;
			console.log(powerend);
			if(powerend != ''){
				console.log()
				$("#powerdate").attr('max', powerend);			
			}else{
				$("#powerdate").attr('max', '');
			}
			
		} */

		$("#check_module").click(
			
			function() {
				if($("#powerdate").val() == ''){
					alert('???????????? ??????????????????.');
					return;
				}
				//??????????????? ?????????
				var powerstart= $("#powerdate").val();
				
				var powerno = $("#powerS option:selected").val();
				//????????? ???????????????
				var powerend = document.getElementById(powerno).value;
				
				//??????????????? ?????????
				var paramDate = new Date($("#powerdate").val());
				var day = paramDate.getDay();
				var diff = paramDate.getDate()+6;
				var dateString = new Date(paramDate.setDate(diff)).toISOString().substring(0, 10);
				
				if(powerend !='' && powerend < dateString){
					alert('????????? ?????? ????????? : '+powerend+'\n?????? ????????? ????????? : '+dateString+'\n????????? ?????? ???????????? ??????????????? ??????????????? ????????????.');
					return;
				}
				
				$.ajax({
					url: "powerServiceCount.do",
					data: {power_start : powerstart, ser_code : powerno},
					dataType: "text",
					type:"post",
					success: function(result){
						if(result == 'full'){
							alert('????????? ??? ????????????. ?????? ????????? ??????????????????.');
							return;
						}else if(result == 'overlap'){
							alert('?????? ??????????????? ????????????????????????.');
							return;
						}else{

							var IMP = window.IMP; // ????????????
							IMP.init('imp49718054');
							// 'iamport' ?????? ???????????? "????????? ????????????"??? ??????
							// i'mport ????????? ????????? -> ????????? -> ?????????????????????
							IMP.request_pay({
								pg : 'inicis', // version 1.1.0?????? ??????.
								/*
								'kakao':???????????????,
								html5_inicis':????????????(???????????????)
								'nice':???????????????
								'jtnet':????????????
								'uplus':LG????????????
								'danal':??????
								'payco':?????????
								'syrup':????????????
								'paypal':?????????
								 */
								pay_method : 'card',
								/*
								'samsung':????????????,
								'card':????????????,
								'trans':?????????????????????,
								'vbank':????????????,
								'phone':?????????????????????
								 */
								merchant_uid : 'merchant_'
										+ new Date().getTime(),
								/*
								merchant_uid??? ??????
								https://docs.iamport.kr/implementation/payment
								?????? url??? ??????????????? ?????? ??? ?????? ????????? ????????????.
								???????????????.
								????????? ????????? ????????????.
								 */
								name : '?????????:???????????????',
								//??????????????? ????????? ??????
								amount : 500000,
								//??????
								//bank_name : null,
								buyer_email : 'iamport@siot.do',
								buyer_name : '???????????????',
								buyer_tel : '010-1234-5678',
								buyer_addr : '??????????????? ????????? ?????????',
								buyer_postcode : '123-456',
								m_redirect_url : 'https://www.yourdomain.com/payments/complete',
							/*
							????????? ?????????,
							????????? ????????? ???????????? URL??? ??????
							(???????????????, ?????????, ????????? ????????? ????????????. PC??? ??????????????? callback????????? ????????? ?????????)
							 */
							}, function(rsp) {
								console.log(rsp);
								if (rsp.success) {
									//$("#or_uid").val(rsp.imp_uid);
									$("#frm").submit();
									var msg = '????????? ?????????????????????.';
									msg += '??????ID : '
											+ rsp.imp_uid;
									/* msg += '?????? ??????ID : ' + rsp.merchant_uid;
									msg += '?????? ?????? : ' + rsp.paid_amount;
									msg += '?????? ???????????? : ' + rsp.apply_num; */
								} else {
									var msg = '????????? ?????????????????????.';
									/*msg += '???????????? : ' + rsp.error_msg;
									msg += '??????' + rsp.amount;
									msg += rsp.imp_uid; */
								}
								alert(msg);
							});
						}
					},error: function(){
						alert("????????? ????????? ?????????????????????.");
						return;
					}
				})
				
			});
	</script>
</body>
</html>
