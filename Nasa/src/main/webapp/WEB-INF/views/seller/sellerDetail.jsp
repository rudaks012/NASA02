<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <style>
      .serviceinfo {
         font-size: 20px;
         font-weight: bold;
         border-bottom: 2px solid rgb(242 243 247);
         margin-bottom: 8px;
         color: #2f1f48;
      }

      .serviceinfoo {
         margin-left: 10px;
         margin-bottom: 70px;
      }

      .serdtail {
         padding-bottom: 10px;
      }

      .single_sidebar_widget {
         margin-bottom: 0px !important;
      }

      .br {
         margin-bottom: 0px !important;
      }

      .fables-single-item {
         color: rgb(64, 64, 64);
      }

      .fables-single-item:hover {
         background-color: tomato;
      }

      .nav-link.active {
         background-color: #1f2b7b  !important;
         color: white !important;
      }

      .revtext {
         color: #777777;
      }

      .comments-area {
         margin-top: 30px;
      }

      .revimg {
         width: 200px;
         height: 100px;
      }

      .btn-reply1 {
         background-color: transparent;
         color: #888888;
         font-size: 14px;
         font-weight: 400;
      }

      .col-lg-6 {

         max-width: 100%;
      }

      /* .blog-author {
         background-color: rgb(240, 239, 239) !important;
      } */

      .br {
         border-top: 1px solid #999294;
         margin-top: 20px;
         padding-top: 20px;
         padding-bottom: 20px;
         border-bottom: 1px solid #999294;
      }

      .star {
         font-size: 14px;
         color: #999999;
         margin-bottom: 0;
         margin-left: 20px;
      }

      .list-caption {
         border: 1px solid #e1ebf7;
         padding: 15px;
         border-top: 0;
         position: relative;
         z-index: 0;
      }

      .sercimg {
         width: 236px;
         height: 251px;
      }

      .serctitle {
         color: #1c1930;
         font-size: 18px;
         font-weight: bold;
      }

      .wishplus {
         color: pink;
         cursor: pointer;
      }

      .wishplus:hover {
         color: black;
      }

      .wishminus:hover {
         color: black;
      }

      #knohowlink {
         color: black !important;
      }

      .modal-open {
         padding-right: 0px !important;
      }
   </style>
</head>

<body>
   <div class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center">
      <div class="container">
         <div class="row">
            <div class="col-xl-12">
               <div class="hero-cap text-center pt-50">
                  <h2>판매자 Details</h2>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!--Hero End -->
   <!--================Blog Area =================-->
   <section class="blog_area single-post-area section-padding">
      <div class="container">
         <div class="col-lg-12" style="padding: 0px;">
            <div class="blog-author col-lg-6" style="padding: 25px; margin: 0px;">
               <div class="media align-items-center">
                  <img src="resources/user/assets/img/search-default-profile-s.jpg" alt=""
                     style="width: 230px; height: 230px; border-radius: 8px; margin-right: 30px;">
                  <!-- <img src="${sellerInfo.s_img }" alt=""> -->
                  <div class="media-body">
                     <div class="d-flex">
                        <div class="position-relative" style="font-size: 45px; bottom: 10px;">
                           <h4 id="detailname" class="sellernick">${sellerInfo.s_nickname }</h4>
                        </div>
                        <div class="position-relative" style="font-size: 25px; top: 4px; left: 10px;">
                           <c:if test="${author eq 'B'}">
                              <c:if test="${wish eq 'exist'}">
                                 <i class="fa fa-heart wishplus" data-toggle="tooltip" data-placement="top"
                                    title="위시리스트 추가" onclick="wishplus(this, '${sellerInfo.s_nickname}')"
                                    style="display:none"></i>
                                 <i class="fa fa-heart wishminus" data-toggle="tooltip" data-placement="top"
                                    title="위시리스트 제거" onclick="wishminus(this, '${sellerInfo.s_nickname}')"></i>
                              </c:if>
                              <c:if test="${wish eq 'no'}">
                                 <i class="fa fa-heart wishplus" data-toggle="tooltip" data-placement="top"
                                    title="위시리스트 추가" onclick="wishplus(this, '${sellerInfo.s_nickname}')"></i>
                                 <i class="fa fa-heart wishminus" data-toggle="tooltip" data-placement="top"
                                    title="위시리스트 제거" onclick="wishminus(this, '${sellerInfo.s_nickname}')"
                                    style="display:none"></i>
                              </c:if>
                           </c:if>
                        </div>
                     </div>                     
                     <c:choose>
                        <c:when test="${sellerInfo.s_rank eq '1' }">
                           <p class="serdtail">・등 급 : 별</p>
                        </c:when>
                        <c:when test="${sellerInfo.s_rank eq '2' }">
                           <p class="serdtail">・등 급 : 달</p>
                        </c:when>
                        <c:when test="${sellerInfo.s_rank eq '3' }">
                           <p class="serdtail">・등 급 : 태양</p>
                        </c:when>
                        <c:when test="${sellerInfo.s_rank eq '4' }">
                           <p class="serdtail">・등 급 : 지구</p>
                        </c:when>
                        <c:otherwise>
                           <p class="serdtail">・등 급 : 등급확인 불가</p>
                        </c:otherwise>
                     </c:choose>
                     <p class="serdtail">・회원구분 : ${sellerInfo.s_author }</p>
                     <p class="serdtail">・가 입 일 : ${sellerInfo.s_dates }</p>
                  </div>
               </div>
            </div>
         </div>

         <!-- <div class="col-lg-12" style="border: 1px solid rgb(223, 223, 223); background-color: rgb(240, 239, 239);">
            <div class="blog-author col-lg-6" style="margin: 0 auto; margin-top: 20px; ">
               <div class="media align-items-center">
                  <img src="${sellerInfo.s_img }" alt="">
                  <div class="media-body">
                     <a href="#">


                        <h4 style="display: inline;" id="detailname" class="sellernick">${sellerInfo.s_nickname }</h4>

                     </a>

                     <div class="col-2" style="display: inline;"></div>
                     <h4 style="display: inline; margin-left: 140px;">${sellerInfo.s_address }</h4>
                     <div>

                        <c:choose>
                           <c:when test="${sellerInfo.s_rank eq '1' }">
                              등급 : 별
                           </c:when>
                           <c:when test="${sellerInfo.s_rank eq '2' }">
                              <p>등급 : 달</p>
                           </c:when>
                           <c:when test="${sellerInfo.s_rank eq '3' }">
                              <p>등급 : 태양</p>
                           </c:when>
                           <c:when test="${sellerInfo.s_rank eq '4' }">
                              <p>등급 : 지구</p>
                           </c:when>
                           <c:otherwise>
                              <p>등급 : 등급확인 불가</p>
                           </c:otherwise>
                        </c:choose>

                        </h4>
                     </div>

                  </div>
               </div>
            </div>
         </div> -->
         <div class="row">
            <div class="col-lg-8 posts-list">
               <div class="single-post">
                  <div class="blog_details">
                     <nav class="fables-single-nav">
                        <c:choose>
                           <c:when test="${tabcode eq 'r'}">
                              <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                 <a class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-forth-after px-3 px-md-5 font-15 semi-font border-0 rounded-0 py-3"
                                    id="nav-desc-tab" data-toggle="tab" href="#nav-desc" role="tab"
                                    aria-controls="nav-desc" aria-selected="false">소개</a>
                                 <a class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-forth-after border-0 px-3 px-md-5 font-15 semi-font rounded-0 py-3 active"
                                    id="nav-info-tab" data-toggle="tab" href="#nav-info" role="tab"
                                    aria-controls="nav-info" aria-selected="true">받은평가</a>
                                 <a class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-forth-after border-0 px-3 px-md-5 font-15 semi-font rounded-0 py-3"
                                    id="nav-review-tab" data-toggle="tab" href="#nav-review" role="tab"
                                    aria-controls="nav-review" aria-selected="false">서비스</a>
                              </div>
                           </c:when>
                           <c:otherwise>
                              <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                 <a class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-forth-after px-3 px-md-5 font-15 semi-font border-0 rounded-0 py-3 active"
                                    id="nav-desc-tab" data-toggle="tab" href="#nav-desc" role="tab"
                                    aria-controls="nav-desc" aria-selected="true">소개</a>
                                 <a class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-forth-after border-0 px-3 px-md-5 font-15 semi-font rounded-0 py-3"
                                    id="nav-info-tab" data-toggle="tab" href="#nav-info" role="tab"
                                    aria-controls="nav-info" aria-selected="false">받은평가</a>
                                 <a class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-forth-after border-0 px-3 px-md-5 font-15 semi-font rounded-0 py-3"
                                    id="nav-review-tab" data-toggle="tab" href="#nav-review" role="tab"
                                    aria-controls="nav-review" aria-selected="false">서비스</a>
                              </div>
                           </c:otherwise>
                        </c:choose>
                     </nav>
                     <div class="tab-content" id="nav-tabContent">
                        <c:choose>
                           <c:when test="${tabcode eq 'r'}">
                              <div class="tab-pane fade" id="nav-desc" role="tabpanel" aria-labelledby="nav-desc-tab">
                           </c:when>
                           <c:otherwise>
                              <div class="tab-pane fade show active" id="nav-desc" role="tabpanel"
                                 aria-labelledby="nav-desc-tab">
                           </c:otherwise>
                        </c:choose>

                        <div style="margin-top: 50px;">
                           <div class="serviceinfoo">
                              <p>${sellerInfo.s_me }</p>
                           </div>
                        </div>

                        <!-- <div class="row justify-content-center">

                           <p class="excert">
                              <p style="margin-top: 20px;">${sellerInfo.s_me }</p>
                           </p>
                        </div> -->
                     </div>
                     <c:choose>
                        <c:when test="${tabcode eq 'r'}">
                           <div class="tab-pane fade show active" id="nav-info" role="tabpanel"
                              aria-labelledby="nav-info-tab">
                        </c:when>
                        <c:otherwise>
                           <div class="tab-pane fade" id="nav-info" role="tabpanel" aria-labelledby="nav-info-tab">
                        </c:otherwise>
                     </c:choose>


                     <br><br>
                     <c:choose>
                        <c:when test="${cntReviews > 0}">
                           <div class="revtext" style="margin-top:20px;">
                              <div class="serviceinfo">서비스 리뷰</div>
                              <!--<i class="fa fa-star" style="color: gold;"></i>-->
                              <c:set var="sum" value="0"></c:set>
                              <c:forEach items="${reviewList}" var="calc">
                                 <c:set var="sum" value="${sum + calc.rev_rate}"></c:set>
                              </c:forEach>
                              평점 : <fmt:formatNumber type="number" pattern="0.00"
                                 value="${ (((sum/fn:length(reviewList))*100) - (((sum/fn:length(reviewList))*100)%1)) * (1/100)   }">
                              </fmt:formatNumber> 점
                              || 총 ${cntReviews}개의 리뷰
                           </div>
                        </c:when>
                        <c:otherwise>
                           <div class="revtext" style="margin-top:20px;">
                              <div class="serviceinfo">서비스 리뷰</div>
                              <!--<i class="fa fa-star" style="color: gold;"></i>-->
                              등록된 리뷰가 없습니다.
                           </div>
                        </c:otherwise>
                     </c:choose>

                     <div class="comments-area">
                        <c:forEach items="${reviewList}" var="review">
                           <div id="rvcode-${review.rev_code }" class="comment-list">
                              <div class="single-comment justify-content-between d-flex">
                                 <div class="user justify-content-between d-flex">
                                    <c:choose>
                                       <c:when test="${not empty review.b_img }">
                                          <div class="thumb">
                                             <img class="profileimg" src="${review.b_img }" alt=""
                                                style="width:70px; height:70px;">
                                          </div>
                                       </c:when>
                                       <c:otherwise>
                                          <div class="thumb">
                                             <img class="profileimg"
                                                src="resources/user/assets/img/profile/search-default-profile.jpg"
                                                alt="" style="width:70px; height:70px;">
                                          </div>
                                       </c:otherwise>
                                    </c:choose>
                                    <div class="desc" style="width:450px;">
                                       <span>${review.rev_ser_name }</span><br>
                                       <span>${review.rev_name }</span>
                                       <span class="ml-4">평점 : ${review.rev_rate }</span>
                                       <span class="date">${fn:substring(review.rev_date,0,10) } </span>
                                       <div style="word-break:break-all;">
                                          <p class="comment">${review.rev_sub }</p>
                                       </div>
                                       <c:if test="${not empty author && review.rev_id ne id}">
                                          <span class="btn-reply1" data-toggle="modal" data-target="#reportModal"
                                             data-revtp="r" data-report_code="${review.rev_code }"
                                             style="cursor: pointer;">신고</span>
                                       </c:if>
                                    </div>
                                 </div>
                                 <c:if test="${not empty review.rev_img }">
                                    <div style="width:200px;height:100px; margin-left:10px;">
                                       <img class="revimg" src="${review.rev_img }" style="width:200px;height:100px;">
                                    </div>
                                 </c:if>
                              </div>
                           </div>
                           <c:if test="${not empty review.rere_code }">
                              <div id="rvcode-${review.review_code }" class="comment-list left-padding">
                                 <div class="single-comment justify-content-between d-flex">
                                    <div class="user justify-content-between d-flex">
                                       <c:choose>
                                          <c:when test="${not empty sellerInfo.s_img }">
                                             <div class="thumb">
                                                <img src="${sellerInfo.s_img}" class="profileimg" alt="">
                                             </div>
                                          </c:when>
                                          <c:otherwise>
                                             <div class="thumb">
                                                <img src="resources/user/assets/img/profile/search-default-profile.jpg"
                                                   class="profileimg" alt="">
                                             </div>
                                          </c:otherwise>
                                       </c:choose>
                                       <div class="desc">
                                          <span>${review.rere_sel_name }</span>
                                          <span class="date">${fn:substring(review.rere_date, 0 , 10) } </span>
                                          <div style="word-break:break-all;">
                                             <p class="comment">${review.rere_sel_sub }</p>
                                          </div>
                                          <c:if test="${not empty author && review.rere_sel_id ne id}">
                                             <span class="btn-reply1" data-toggle="modal" data-target="#reportModal"
                                                data-revtp="rc" data-report_code="${review.rere_code }"
                                                style="cursor: pointer;">신고</span>
                                          </c:if>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </c:if>
                        </c:forEach>
                     </div>
                     <div class="row justify-content-center mt-10">
                        <nav aria-label="Page navigation example">
                           <ul class="pagination">
                              <c:if test="${paging.prev }">
                                 <li class="page-item"><a class="page-link"
                                       href="sellerDetail.do?s_email=${sellerInfo.s_email}&pageNum=${paging.startPage - 1 }&amount=${paging.amount}&pagestatus=r">&lt;</a>
                                 </li>
                              </c:if>
                              <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                                 <c:choose>
                                    <c:when test="${p == paging.pageNum }">
                                       <li class="page-item"><b class="page-link">${p }</b></li>
                                    </c:when>
                                    <c:when test="${p != paging.pageNum }">
                                       <li class="page-item"><a class="page-link"
                                             href="sellerDetail.do?s_email=${sellerInfo.s_email}&pageNum=${p }&amount=${paging.amount}&pagestatus=r">${p
                                             }</a></li>
                                    </c:when>
                                 </c:choose>
                              </c:forEach>
                              <c:if test="${paging.next }">
                                 <li class="page-item"><a class="page-link"
                                       href="sellerDetail.do?s_email=${sellerInfo.s_email}&pageNum=${paging.endPage+1 }&amount=${paging.amount}&pagestatus=r">&gt;</a>
                                 </li>
                              </c:if>
                           </ul>
                        </nav>
                     </div>
                  </div>
                  <div class="tab-pane fade" id="nav-review" role="tabpanel" aria-labelledby="nav-info-tab">
                     <br /><br />
                     <div class="row justify-content-center">
                        <div class="container">
                           <div class="row">
                              <c:forEach items="${serviceList }" var="service">
                                 <c:if test="${service.ser_status eq 'N'}">
                                    <div class="col-lg-4">
                                       <div class="single-listing mb-30">
                                          <div class="list-img">
                                             <img src="fileupload/${service.ser_img}" alt="" class="sercimg">
                                          </div>
                                          <div class="list-caption">
                                             <a href="serviceDetail.do?ser_code=${service.ser_code }"
                                                   class="serctitle">${service.ser_title}</a>
                                             <div style="margin-top: 30px;">
                                                <div>서비스 코드 : s${service.ser_code}</div>
                                                <div>₩ <fmt:formatNumber value="${service.ser_price}" pattern="###,###" /> ~</div>
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
      <div class="col-lg-4">
         <div class="blog_right_sidebar">
            <aside class="category-listing mb-50" style="margin-top: 26px;">               
               <h5 style="font-size: 20px; font-weight: bold;">활동정보</h5><br>
               <div class="media contact-info">
                  <span class="contact-info__icon"><i class="ti-home"></i></span>
                  <div class="media-body">
                     <h3>Address</h3>
                     <p style="font-size: 12px;">${sellerInfo.s_address }</p>
                  </div>
               </div>
               <div class="media contact-info">
                  <span class="contact-info__icon"><i class="ti-email"></i></span>
                  <div class="media-body">
                     <h3>E-Mail</h3>
                     <p style="font-size: 12px;">${sellerInfo.s_email }</p>
                  </div>
               </div>
               <h5 style="font-size: 20px; font-weight: bold;">경력사항</h5>
               <div style="white-space:pre-line;">${sellerInfo.s_carrer }</div>
               <div style="margin-top: 80px; text-align: center;">
                  <button class="genric-btn primary e-large" onclick="chatingcheck()">문의하기</button>
               </div>
            </aside>
         </div>
      </div>
   </section>
   <div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="reportModalLabel"
      aria-hidden="true">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">신고</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <form>
                  <div class="form-group">
                     <label><input type="radio" name="reportType" value="욕설/비방" onclick="radiodisabled()">
                        욕설/비방</label><br>
                     <label><input type="radio" name="reportType" value="음란물" onclick="radiodisabled()"> 음란물</label><br>
                     <label><input type="radio" name="reportType" value="스팸/부적절한 광고" onclick="radiodisabled()"> 스팸/부적절한
                        광고</label><br>
                     <label><input type="radio" name="reportType" value="혐오/잔인한 사진" onclick="radiodisabled()"> 혐오/잔인한
                        사진</label><br>
                     <div class="form-group">
                        <label><input type="radio" name="reportType" value="기타사유" onclick="radioactive()"> 기타사유</label>
                        <textarea class="form-control" id="reportSubject" name="reportSubject" disabled></textarea>
                     </div>
                  </div>
               </form>
            </div>
            <div class="modal-footer">
               <a href="#" class="genric-btn danger radius" data-dismiss="modal" onclick="reportReview()">신고</a>
               <a href="#" class="genric-btn primary radius" data-dismiss="modal"
                  onclick="radiodisabled();disradio();">취소</a>
            </div>
         </div>
      </div>
   </div>
   <script>
      $(document).ready(function () {
         $("#reportModal").on("show.bs.modal", function (event) {
            report_code = $(event.relatedTarget).data("report_code");
            report_tcp = $(event.relatedTarget).data("revtp");
         });
      })

      function radiodisabled() {
         $("#reportSubject").attr("disabled", true);
         $("#reportSubject").val("");
      }

      function radioactive() {
         $("#reportSubject").attr("disabled", false);
      }

      function disradio() {
         $("input:radio[name='reportType']").prop("checked", false);
         console.log("disradio");
      }

      function reportReview() {
         console.log(report_code);
         var re_type = $('input[name="reportType"]:checked').val();
         console.log(re_type);
         var re_subject = $("#reportSubject").val();
         console.log(report_tcp);

         if (report_tcp == "r") {
            // reportcontroller
            $.ajax({
               url: "reportReview.do",
               type: "post",
               data: {
                  rev_code: report_code,
                  re_type: re_type,
                  re_subject: re_subject
               },
               success: function () {
                  console.log("신고함!");
                  alert("신고하였습니다.");
               },
               error: function () {
                  console.log("신고에러")
               }
            })
         }
         if (report_tcp == "rc") {
            // reportcontroller
            $.ajax({
               url: "reportReview_comment.do",
               type: "post",
               data: {
                  rere_code: report_code,
                  re_type: re_type,
                  re_subject: re_subject
               },
               success: function () {
                  console.log("신고함!");
                  alert("신고하였습니다.");
               },
               error: function () {
                  console.log("신고에러")
               }
            })
         }
      }
      //채팅이동
      function chatingcheck() {
         //판매자 닉네임
         var chatnick = document.querySelector(".sellernick").innerHTML;
         console.log(chatnick);
         //서비스코드
         var ser_code = 0;
         $.ajax({
            url: "mainchatting.do",
            type: "post",
            data: {
               chatnick: chatnick
            },
            success: function (code) {
               location.replace('chatting.do');
            }
         })
      }


      $(document).ready(function () {
         $('[data-toggle="tooltip"]').tooltip();
      });

      function wishplus(event, nickname) {
         $.ajax({
            url: "wishplus.do",
            type: "post",
            data: {
               nickname: nickname
            },
            success: function (code) {
               if (code == "plus") {
                  $(event).hide();
                  console.log(event.nextSibling);
                  $(event.nextElementSibling).show();
               }
            }
         })
      }

      function wishminus(event, nickname) {
         $.ajax({
            url: "wishminus.do",
            type: "post",
            data: {
               nickname: nickname
            },
            success: function (code) {
               if (code == "minus") {
                  $(event).hide();
                  $(event.previousElementSibling).show();
               }
            }
         })
      }
   </script>
</body>

</html>