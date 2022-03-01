<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .blog-author{
      padding: 0px 0px 0px 0px !important;
      margin-top: 20px !important;
   }
   .startbtn{
      border-radius: 20px;
   }
   .blog_details{
      margin-bottom: 20px;
   }
</style>
</head>
<body>
	<div class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center">
         <div class="container">
            <div class="row">
               <div class="col-xl-12">
                  <div class="hero-cap text-center pt-50">
                     <h2>판매자의 노하우 Detail</h2>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <section class="blog_area single-post-area section-padding">
         <div class="container">
            <div class="row justify-content-center">
               <div class="col-lg-8 posts-list">
                  <div class="single-post">

                        <div class="feature-img">
                           <img class="img-fluid" src="fileupload/${knowhowDetail.no_img }" alt="">
                        </div>
                     
                        <div class="blog_details">
                           <h2 class="center">${knowhowDetail.no_title }</h2>
                           <ul class="blog-info-link mt-3 mb-4">
                              <li><a href="#"><i class="fa fa-user"></i> ${knowhowDetail.no_id }</a></li>
                              <li><a href="#"><i class="fa fa-calendar"></i>${knowhowDetail.no_date }</a></li>
                           </ul>
                           <p class="excert">
                              ${knowhowDetail.no_subject }
                           </p>
                           <p>
                              MCSE boot camps have its supporters and its detractors. Some people do not understand why
                              you
                              should have to spend money on boot camp when you can get the MCSE study materials yourself
                              at a
                              fraction of the camp price. However, who has the willpower to actually sit through a
                              self-imposed MCSE training. who has the willpower to actually
                           </p>
                           <div class="quote-wrapper">
                              <div class="quotes">
                                 MCSE boot camps have its supporters and its detractors. Some people do not understand
                                 why you
                                 should have to spend money on boot camp when you can get the MCSE study materials
                                 yourself at
                                 a fraction of the camp price. However, who has the willpower to actually sit through a
                                 self-imposed MCSE training.
                              </div>
                           </div>
                           <p>
                              MCSE boot camps have its supporters and its detractors. Some people do not understand why
                              you
                              should have to spend money on boot camp when you can get the MCSE study materials yourself
                              at a
                              fraction of the camp price. However, who has the willpower
                           </p>
                           <p>
                              MCSE boot camps have its supporters and its detractors. Some people do not understand why
                              you
                              should have to spend money on boot camp when you can get the MCSE study materials yourself
                              at a
                              fraction of the camp price. However, who has the willpower to actually sit through a
                              self-imposed MCSE training. who has the willpower to actually
                           </p>
                         
                           <div style="text-align: center;">
                              <button id="knowUpdate" class="genric-btn primary small startbtn">수정</button>
                              <button id="knowDelete" class="genric-btn primary small startbtn">삭제</button>
                           </div>
                          
                        </div>
                     
                  </div>

                  <div class="navigation-top">
                     <div class="blog-author">
                        <div class="media align-items-center">
                           <img src="assets/img/blog/author.png" alt="">
                           <div class="media-body">
                              <a href="#">
                                 <h4>${knowhowDetail.no_id }</h4>
                              </a>
                              <button class="genric-btn primary small startbtn" id="stbtn" style="float: right;" data-toggle="modal" data-target="#chatModal">견적 요청</button>
                              <p>Second divided from form fish beast made. Every of seas all gathered use saying you're, he
                                 our dominion twon Second divided from</p>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <script>
      	$('#knowDelete').on('click', function(){
      		if(confirm('삭제하시겠습니까?')){
      			$.ajax({
      				url: "knowhowDelete.do",
      				dataType: "text",
      				type:"post",
      				data: {no_code: ${knowhowDetail.no_code }},
      				success: function (result) {
      					console.log(result);
      					if(result){
	      					alert('삭제되었습니다.'); 
	      					location.href='sellerKnowhow.do';
      					}else{
      						alert('일시적인 장애로 삭제 실패하였습니다. \n잠시 후 다시 시도해주세요.');
      					}
      				},
      				error: function(err){
      					alert('일시적인 장애로 삭제 실패하였습니다. \n잠시 후 다시 시도해주세요.');
      				}
      			});
      		}
      	})
      </script>
</body>
</html>