<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='resources/user/fullcalendar-5.10.1/lib/main.js'></script>
<link href='resources/user/fullcalendar-5.10.1/lib/main.css' rel='stylesheet' />
<style>
* {
	margin: 0;
	padding: 0
}

html {
	height: 100%
}

p {
	color: grey
}

#heading {
	text-transform: uppercase;
	color: #673AB7;
	font-weight: normal
}

#msform {
	text-align: center;
	position: relative;
	margin-top: 20px
}

#msform fieldset {
	background: white;
	border: 0 none;
	border-radius: 0.5rem;
	box-sizing: border-box;
	width: 100%;
	margin: 0;
	padding-bottom: 20px;
	position: relative
}

.form-card {
	text-align: left
}

#msform fieldset:not(:first-of-type) {
	display: none
}

#msform input,
#msform textarea {
	padding: 8px 15px 8px 15px;
	border: 1px solid #ccc;
	border-radius: 0px;
	margin-bottom: 25px;
	margin-top: 2px;
	width: 100%;
	box-sizing: border-box;
	font-family: montserrat;
	color: #2C3E50;
	background-color: #ECEFF1;
	font-size: 16px;
	letter-spacing: 1px
}
#msform input[type='radio']{
	padding: 8px 15px 8px 15px;
	border: 1px solid #ccc;
	border-radius: 0px;
	margin-top: 2px;
	box-sizing: border-box;
	font-family: montserrat;
	color: #2C3E50;
	background-color: #ECEFF1;
	font-size: 16px;
	letter-spacing: 1px
}
#msform input:focus,
#msform textarea:focus {
	-moz-box-shadow: none !important;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
	border: 1px solid #673AB7;
	outline-width: 0
}

#msform .action-button {
	width: 100px;
	background: #673AB7;
	font-weight: bold;
	color: white;
	border: 0 none;
	border-radius: 0px;
	cursor: pointer;
	padding: 10px 5px;
	margin: 10px 0px 10px 5px;
	float: right
}

#msform .action-button:hover,
#msform .action-button:focus {
	background-color: #311B92
}

#msform .action-button-previous {
	width: 100px;
	background: #616161;
	font-weight: bold;
	color: white;
	border: 0 none;
	border-radius: 0px;
	cursor: pointer;
	padding: 10px 5px;
	margin: 10px 5px 10px 0px;
	float: right
}

#msform .action-button-previous:hover,
#msform .action-button-previous:focus {
	background-color: #000000
}

.card {
	z-index: 0;
	border: none;
	position: relative
}

.fs-title {
	font-size: 25px;
	color: #673AB7;
	margin-bottom: 15px;
	font-weight: normal;
	text-align: left
}

.purple-text {
	color: #673AB7;
	font-weight: normal
}

.steps {
	font-size: 25px;
	color: gray;
	margin-bottom: 10px;
	font-weight: normal;
	text-align: right
}

.fieldlabels {
	color: gray;
	text-align: left
}

#progressbar {
	margin-bottom: 30px;
	overflow: hidden;
	color: lightgrey
}

#progressbar .active {
	color: #673AB7
}

#progressbar li {
	list-style-type: none;
	font-size: 15px;
	width: 25%;
	float: left;
	position: relative;
	font-weight: 400
}

#progressbar #account:before {
	font-family: FontAwesome;
	content: "\f13e"
}

#progressbar #personal:before {
	font-family: FontAwesome;
	content: "\f007"
}

#progressbar #payment:before {
	font-family: FontAwesome;
	content: "\f030"
}

#progressbar #confirm:before {
	font-family: FontAwesome;
	content: "\f00c"
}

#progressbar li:before {
	width: 50px;
	height: 50px;
	line-height: 45px;
	display: block;
	font-size: 20px;
	color: #ffffff;
	background: lightgray;
	border-radius: 50%;
	margin: 0 auto 10px auto;
	padding: 2px
}

#progressbar li:after {
	content: '';
	width: 100%;
	height: 2px;
	background: lightgray;
	position: absolute;
	left: 0;
	top: 25px;
	z-index: -1
}

#progressbar li.active:before,
#progressbar li.active:after {
	background: #673AB7
}

.progress {
	height: 20px
}

.progress-bar {
	background-color: #673AB7
}

.fit-image {
	width: 100%;
	object-fit: cover
}

.btn {
	background: lightgray;
	border: none;
	border-radius: 3px;
	padding: 6px 12px;
}
.home-blog-area{
	margin-top : 100px;
}

.hr{
 	background-color : #d5c9ea !important;
   	margin: 10px !important;
}
.first img{
	width: 250px;
	height: 183px;
}
.promotiona {
	width: 210px;
	overflow: hidden;
	text-overflow: ellipsis;
	display: block;
	white-space: nowrap;
}
.promotiona2 {
	width: 308px;
	overflow: hidden;
	text-overflow: ellipsis;
	display: block;
	white-space: nowrap;
}
</style>
<script>
    // ????????? ???...
    document.addEventListener('DOMContentLoaded', function () {
        let xhtp = new XMLHttpRequest();
        xhtp.open('get', 'CalendarList.do');
        xhtp.send();
        xhtp.onload = function () {
            let dbData = JSON.parse(xhtp.responseText);
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                dayMaxEvents: true, // allow "more" link when too many events
                events: dbData
            });
            calendar.render();
        }
    });
</script>
</head>
<body>
	<div
		class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="hero-cap text-center pt-50">
						<h2>???????????? ??????</h2>
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
									<p >????????? ??????</p>
								</a></li>
								<li><a href="sellerPromotion.do" class="d-flex">
										<p style="font-weight: bold;">???????????? ??????</p>
								</a></li>
								<li><a href="powerservice.do" class="d-flex">
										<p>??????????????? ??????</p>
								</a></li>
								<li><a href="sellerCalendar.do" class="d-flex">
										<p>?????? ??????</p>
								</a></li>
								<li><a href="sellerReview.do?scode=0" class="d-flex">
										<p>?????? ??????</p>
								</a></li>
								<li><a href="sellerPayment.do" class="d-flex">
										<p>?????? ??????</p>
								</a></li>
								<li><a href="sellerSales.do" class="d-flex">
										<p>?????? ??????</p>
								</a></li>
								<li><a href="sellerReport.do" class="d-flex">
										<p>?????? ??????</p>
								</a></li>
								<li><a href="sellerKnowhow.do" class="d-flex">
										<p>????????? ?????????</p>
								</a></li>
							</ul>
						</aside>
					</div>
				</div>


				<div class="col-9">
					<a class="d-inline-block">
						<h2>???????????? ??????</h2>
					</a>
					<hr class="hr" />
					<div class="blog_left_sidebar">
						<article class="blog_item">
							<div class="justify-content-center">
								<div class="container-fluid">
									<div>
										<div>
											<div>
												<form id="msform">
													<!-- progressbar -->
													<ul id="progressbar">
														<li class="active" id="account"><strong>???????????????</strong></li>
														<li id="personal"><strong>??????/????????????</strong></li>
														<li id="payment"><strong>?????? ??????</strong></li>
														<li id="confirm"><strong>Finish</strong></li>
													</ul>
													<div class="progress">
														<div class="progress-bar progress-bar-striped progress-bar-animated"
															role="progressbar" aria-valuemin="0" aria-valuemax="100">
														</div>
													</div> <br> <!-- fieldsets -->
													<fieldset>
														<div class="form-card">
															<div class="row">

															</div> 
															<jsp:useBean id="now" class="java.util.Date" />
															<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
															<div class="listing-details-area proservice">
																<div class="container">
																	<div class="row">
																	<c:forEach items="${serviceList }" var="service">
																		
																				<div class="col-lg-4">
																					<div class="single-listing mb-30">
																						<div class="list-img first">
																							<img src="${service.ser_img }" alt="" class="${service.ser_code }">
																						</div>
																						<div class="list-caption">
																							<h3>
																								<a href=""  class="${service.ser_code } promotiona">${service.ser_title }</a>
																							</h3>
																							<p>???????????????: s${service.ser_code }</p>
																							<input type="hidden" id="st${service.ser_code }" value="${service.ser_start }">
																							<input type="hidden" id="en${service.ser_code }" value="${service.ser_end }">
																							<div class="list_footer" style="text-align: center;">
																								<input type="radio" name="pro_service" class="pro_service" value="${service.ser_code }" >
																							</div>
																						</div>
																					</div>
																				</div>
																			
																		</c:forEach>
																	</div>
																</div>
															</div>
															
														</div> 
														<input type="button" name="next" id="firstnext" class="next action-button" value="Next" />
													</fieldset>
													<fieldset>
														<div class="form-card">
															<div class="row">

															</div> 
															<label class="fieldlabels1">???????????? ????????????: *</label>
															<input type="date" name="startdate" id="startdate" />
															<label class="fieldlabels2">???????????? ????????????: *</label>
															<input type="date" name="enddate" id="enddate"/>
															<label class="fieldlabels">?????????(%): *</label> 
															<input type="number" name="fdiscount" id="discount" />
															
														</div> 
														<input type="button" name="next" class="next action-button" value="Next" id="seconnext" /> 
														<input type="button" name="previous" class="previous action-button-previous" value="Previous" />
													</fieldset>
													<fieldset id="form3">
														<div class="form-card">
															<div class="row">
																
															</div>
															<br/> 
															<div class="listing-details-area proser" >
																<div class="row justify-content-center">
																	<div class="col-lg-6">
																			<div class="single-listing mb-30">
																				<div class="list-img">
																					<img src="assets/img/gallery/list1.png" alt="" id="finalimg">
																					<!-- <span>Open</span> -->
																				</div>
																				<div class="list-caption final">
																					<h3>
																						<a href="" id="finaltitle" class="promotiona2"></a>
																					</h3>
																					<p id="finalno"></p>
																					<p id="finaldate"></p>
																				</div>
																			</div>
																		</div>
																	</div>
															</div>
														</div> <input type="button" name="next" class="next action-button" value="Submit" /> 
														<input type="button" name="previous" class="previous action-button-previous " value="Previous" id="thirdnext"/>
													</fieldset>
													<fieldset id="form4">
														<div class="form-card">
															<div class="row">

															</div> <br><br>
															<h2 class="purple-text text-center">
																<strong class="strong"></strong></h2> <br>
															<div class="row justify-content-center">
																<div class="col-3"> 
																	<img src="assets/img/promotion/GwStPmg.png" class="fit-image"> 
																</div>
															</div> <br><br>
															<div class="row justify-content-center">
																<div class="col-7 text-center">
																	<h5 class="purple-text text-center form4h"></h5>
																	<br/><br/>
																</div>
															</div>
															<input type="button" class="action-button" value="????????????" onclick="location.href='sellerPromotion.do'" style="float: none; display: block; margin: auto;"/> 
														</div>
													</fieldset>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</article>
					</div>
				</div>


			</div>
		</div>

	</section>
	
	<script>
	$(document).ready(function () {

		var current_fs, next_fs, previous_fs; //fieldsets
		var opacity;
		var current = 1;
		var steps = $("fieldset").length;
	
		setProgressBar(current);

		$(".next").click(function () {

			current_fs = $(this).parent();
			next_fs = $(this).parent().next();
			
			console.log($(this).attr('id'));
			if($(this).attr('id') == "firstnext"){
				var listVar = $('input[name=pro_service]').is(":checked");
				console.log(listVar);
				if(!listVar){
					alert('???????????? ??????????????????!');
					return;
				}
			}else if($(this).attr('id') == "seconnext"){
				if($('#startdate').val() == ''){
					alert('??????????????? ??????????????????!');
					return;
				}else if($('#enddate').val() == ''){
					alert('??????????????? ??????????????????!');
					return;
				}else if($('#startdate').val() > $('#enddate').val()){
					alert('??????????????? ?????????????????? ??? ??? ????????????.');
					return;
				}else if($('#discount').val() == ''){
					alert('???????????? ??????????????????!');
					return;
				}
			}
			
			
			
			//Add Class Active
			$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

			//show the next fieldset
			next_fs.show();
			//hide the current fieldset with style
			current_fs.animate({
				opacity: 0
			}, {
				step: function (now) {
					// for making fielset appear animation
					opacity = 1 - now;

					current_fs.css({
						'display': 'none',
						'position': 'relative'
					});
					next_fs.css({
						'opacity': opacity
					});
				},
				duration: 500
			});
			setProgressBar(++current);
		});

		$(".previous").click(function () {

			current_fs = $(this).parent();
			previous_fs = $(this).parent().prev();

			//Remove class active
			$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

			//show the previous fieldset
			previous_fs.show();

			//hide the current fieldset with style
			current_fs.animate({
				opacity: 0
			}, {
				step: function (now) {
					
					// for making fielset appear animation
					opacity = 1 - now;

					current_fs.css({
						'display': 'none',
						'position': 'relative'
					});
					previous_fs.css({
						'opacity': opacity
					});
				},
				duration: 500
			});
			setProgressBar(--current);
		});

		function setProgressBar(curStep) {
			if(curStep == 2){
				$("#startdate").val('');
				$("#enddate").val('');
				
				let id = $("input[name=pro_service]:checked").val();
				console.log(id);
				let start = 'st'+id;
				let end = 'en'+id;
				start = document.getElementById(start).value;
				end = document.getElementById(end).value;
				end = end.substr(0,10);
				console.log(start);
				console.log(end);
				
				var today = new Date();
				var year = today.getFullYear();
				var month = ('0' + (today.getMonth() + 1)).slice(-2);
				var day = ('0' + today.getDate()).slice(-2);
				var dateString = year + '-' + month  + '-' + day;
				console.log(dateString);
				
				$("#startdate").attr('min', dateString);
				$("#startdate").attr('max', end);
				$("#enddate").attr('min', dateString);
				$("#enddate").attr('max', end);
			}
			else if(curStep == 3){
				let id = $("input[name=pro_service]:checked").val();
				let img = document.getElementsByClassName(id)[0].getAttribute('src');
				$("#finalimg").attr("src", img);
				let title = document.getElementsByClassName(id)[1].innerHTML;

				$("#finaltitle").text(title);
				$("#finalno").text("????????? ??????: s"+id);
				$("#finaldate").text("???????????? ??????: "+$("#startdate").val()+" - "+ $("#enddate").val());
				$(".final").append($("<p>").text("????????? : " + $("#discount").val() + "%"));
			}else if(curStep == 4){
				let discount = $('#discount').val();
				let pro_start = $('#startdate').val();
				let pro_end = $('#enddate').val();
				let pro_service = $("input[name=pro_service]:checked").val();
				let pro_status = 'N';
				
				var today = new Date();
				var year = today.getFullYear();
				var month = ('0' + (today.getMonth() + 1)).slice(-2);
				var day = ('0' + today.getDate()).slice(-2);
				var dateString = year + '-' + month  + '-' + day;
				
				if(pro_start > dateString){
					pro_status = 'U';
				}
				
				 $.ajax({
					url: "promoInsert.do",
					data : {discount: discount, pro_start:pro_start, 
						pro_end:pro_end, pro_service:pro_service,pro_status:pro_status},
					type : "post",
					dataType : "text",
					success : function(result) {
						console.log(result);
						if(result == "OK"){
							$(".strong").text("SUCCESS!");	
							$(".form4h").text("???????????????????????????.");
							$(".fit-image").attr("src","assets/img/promotion/GwStPmg.png");							
						}else if(result == "FAIL2"){
							$(".strong").text("FAIL!!!!");	
							$(".form4h").text("?????? ????????? ????????? ??????????????? ?????? ????????????.");
							$(".fit-image").attr("src","assets/img/promotion/x-mark.png");
						}else{
							$(".strong").text("FAIL!!!!");	
							$(".form4h").text("????????? ????????? ?????? ?????????????????????.");
							$(".fit-image").attr("src","assets/img/promotion/x-mark.png");
						}
					},
					error: function(err){
						console.log(err);
						$(".strong").text("FAIL!!!");	
						$(".form4h").text("????????? ????????? ?????? ?????????????????????.");	
						$(".fit-image").attr("src","assets/img/promotion/x-mark.png");
					}
				}); 
				
			}
			var percent = parseFloat(100 / steps) * curStep;
			percent = percent.toFixed();
			$(".progress-bar").css("width", percent + "%")
			
		}

		$(".submit").click(function () {
			return false;
		})
		
	
	});
		
	</script>
</body>
</html>