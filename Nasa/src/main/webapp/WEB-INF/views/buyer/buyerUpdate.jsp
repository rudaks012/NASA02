<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    window.onload = function() {
	        document.getElementById("searchAdderess").addEventListener("click", function() {
            new daum.Postcode({
                oncomplete: function(data) {
                    document.getElementById("b_zipcode").value = data.zonecode;
                    document.getElementById("b_address").value = data.address;
                    document.getElementById("b_detailaddress").focus();
                }
            }).open();
        });
    }
</script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<!-- Hero Start-->
<div class="hero-area2short  slider-height2 hero-overly2 d-flex align-items-center ">
</div>
<!--Hero End -->

<!-- buyerUpdate Start -->

	<section>
		<div class="row justify-content-center" style="margin-top: 50px;">
			<div style="width:550px;">
				<form method="post" id = "profilefrm" action="profileUpdate.do" onsubmit="return passwordCheck()" enctype="multipart/form-data">
					<div id="profileThumnail" class="justify-content-center" style="text-align: center;">
						<c:choose>
							<c:when test="${empty buyerinfo.b_img }">
			                    <img id="prvimg" src="resources/user/assets/img/profile/search-default-profile.jpg" alt="" style="width: 150px; height:150px; border-radius: 70%; overflow: hidden;"><br>
							</c:when>
							<c:otherwise>
								<img id="prvimg" src="${buyerinfo.b_img }" alt="" style="width: 150px; height:150px; border-radius: 70%; overflow: hidden;"><br>
							</c:otherwise>
						</c:choose>
	                    <input type="file" id="imgupload" name="imgupload" accept="image/*" style="display:none;">
	                    <label class="genric-btn primary radius" for="imgupload" style="margin-top: 7px;">?????? ??????</label>
                    </div>
				
					<div style="margin-top: 20px;">
						<p>?????????</p>
						<div class="form-group">
							<input class="form-control" name="b_nickname" id="b_nickname" type="text" placeholder="${buyerinfo.b_nickname }" value="${buyerinfo.b_nickname }" required>
						</div>
					</div>
				
					<div style="margin-top: 20px;">
						<p>?????????</p>
						<div class="form-group">
							<input class="form-control" name="b_email" id="b_email" type="text" placeholder="${buyerinfo.b_email }" value="${buyerinfo.b_email }" readonly required>
						</div>
					</div>
				
					<div class="single-element-widget mt-30">
                        <p>????????????</p>
                        <p style="font-size:15px;">?????? ???????????? : 
                        	<c:forEach items="${subcategoryList }" var="subcategory">
                        		<c:if test="${subcategory.sub_no eq buyerinfo.field_code}">
                        			<c:forEach items="${categoryList }" var="category">
                        				<c:if test="${category.cat_no eq subcategory.cat_no }">
                        					${category.cat_name } - ${subcategory.sub_name }
                        				</c:if>
                        			</c:forEach>
                        		</c:if>
                        	</c:forEach>
                        </p>
                        <div class="d-flex">
                        	<div class="categorysel mr-4" id="categorysel">
                                <select id="categoryselect" required>
                                	<option>???????????????</option>
                                   <c:forEach items="${categoryList }" var="category">
                                    	<option value="${category.cat_no }">${category.cat_name }</option>
                                    </c:forEach>
                                </select>
                            </div>
    
                            <div>
                                <select class="subcategoryselect" id="subcategoryselect"  name="field_code">
                                </select>
                            </div>
                        </div>
                    </div>
				
					<div style="margin-top: 20px;">
						<p>??????</p>
						<div class="form-group">
							<input class="form-control col-8" name="b_zipcode" id="b_zipcode" type="text" placeholder="${buyerinfo.b_zipcode }" value="${buyerinfo.b_zipcode }" style="display: inline;" readonly required>
							<label id="searchAdderess" class="genric-btn primary radius col-lg-3">????????????</label>
							<input class="form-control col-lg-8" name="b_address" id="b_address" type="text" placeholder="${buyerinfo.b_address }" value="${buyerinfo.b_address }" style="display: inline;margin-top: 5px;" readonly required>
							<input class="form-control col-lg-3" name="b_detailaddress" id="b_detailaddress" type="text" placeholder="${buyerinfo.b_detailaddress }" value="${buyerinfo.b_detailaddress }" style="display: inline;margin-top: 5px;" required>
						</div>
					</div>

					<div style="margin-top: 20px;">
						<p>???????????? ??????</p>
						<input type="radio" name="pwCheck" id="basic" value="basic" checked="checked">?????? ???????????? 
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="pwCheck" id="new" value="new">????????? ????????????
					</div>
					<div style="display: none;" id="newpwdiv">
						<div style="margin-top: 20px;" id="pwdiv">
							<p>????????? ????????????</p>
							<div class="form-group">
								<input class="form-control" name="b_password" id="b_password"
									type="password" placeholder="????????? ????????????">
							</div>
						</div>
	
						<div style="margin-top: 20px;" id="pwchkdiv">
							<p>????????? ???????????? ??????</p>
							<div class="form-group">
								<input class="form-control" name="pwchk" id="pwchk"
									type="password" placeholder="????????? ????????????">
							</div>
						</div>
					</div>
				
					<!-- <div id="pwdiv" style="margin-top: 20px;">
						<p>????????? ????????????</p>
						<div class="form-group">
							<input class="form-control" name="b_password" id="b_password" type="password" value=${buyerinfo.b_password } required>
						</div>
					</div>
				
					<div id="pwchkdiv" style="margin-top: 20px;">
						<p>????????? ???????????? ??????</p>
						<div class="form-group">
							<input class="form-control" name="newpassword" id="newpassword2" type="password" value=${buyerinfo.b_password } required>
						</div>
					</div> -->
				
					<div class="row justify-content-center" style="margin-bottom: 50px; margin-top: 50px;">
						<button type="submit" class="genric-btn info-border">??????</button>
						<!-- onclick="updateProfile()" -->
						<a href="goBuyerMypage.do" class="genric-btn danger-border" style="margin-left: 10px;">??????</a>
					</div>
				</form>
			</div>
		</div>
	</section>
      
	<script>

		$("input[name=pwCheck]").click(function(e){
			console.log($(e.target).val());
			if($(e.target).val() == 'new'){
				$("input:radio[id='new']").attr("checked", true); 
				$("input:radio[id='basic']").attr("checked", false);
				$('#newpwdiv').attr('style','display: block;');
				$("#b_password").val("");
				$("#pwchk").val("");
				$("#b_password").attr("required", true);
				$("#pwchk").attr("required", true);
			}else{
				$("input:radio[id='basic']").attr("checked", true); 
				$("input:radio[id='new']").attr("checked", false);
				$('#newpwdiv').attr('style','display: none;');
				$("#b_password").val("");
				$("#pwchk").val("");
				$("#b_password").removeAttr("required");
				$("#pwchk").removeAttr("required");
			}
		})
		function readImage(input) {
			if(input.files && input.files[0]) {
				const reader = new FileReader();
				
				reader.onload = e => {
					const previewImage = document.getElementById("prvimg");
					previewImage.src = e.target.result;
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		
		const inputImage = document.getElementById("imgupload");
		inputImage.addEventListener("change", e => {
			readImage(e.target);
		});
		
		function passwordCheck() {
			var pwc = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
			var pwck = pwc.test($("#b_password").val());
			if($("#basic").is(':checked')) {
				console.log('chkif');
				return true;
			}

			if(!pwck) {
				window.alert("??????????????? ??????,??????,???????????? ?????? 8?????? ??????????????? ?????????.");
				return false;
			}

			var newpwd1 = document.getElementById("b_password").value;
			var newpwd2 = document.getElementById("pwchk").value; 
			
			if(newpwd1 != newpwd2) {
				window.alert("????????? ??????????????? ???????????? ????????????.");
				return false;
			}
		}
		$(function() {
			$("#categoryselect").on("change", function() {
				$.ajax({
					type : "POST",
					url : "subcategoryCall.do",
					data : {cat_no : $('#categoryselect').val()},
					dataType : "json",
					success : function(datas) {
						$('#subcategoryselect').empty();
						let ul = document.getElementsByClassName('list')[1];
						while(ul.hasChildNodes()){
							ul.removeChild(ul.firstChild);
						}
						ul.innerHTML = "<li data-value class='option selected'>???????????????.</li>";
						for(data of datas){
							$('#subcategoryselect').append("<option value='"+ data.sub_no+"'>" + data.sub_name + "</option>");
							
							let ul = document.getElementsByClassName('list')[1];
							
							ul.innerHTML += "<li data-value='"+data.sub_no+"' class='option'>"+data.sub_name+"</li>";
						}
						document.getElementsByClassName('current')[1].innerHTML='???????????????.';
					},
					error : function(xhr, status, error) {
						alert("??????????????? ????????????????????????. ?????? ??? ?????? ?????????????????? ????????????.");
						return false;
					}
				});
			})
			
		})

	/* // ???????????? ??????
	var pwreg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;

	$("#b_password")
		.blur(
			function () {
				var pwchk = pwreg.test($("#b_password").val());
				if (!pwchk) {
					$("label").remove('#pwlabel');
					$("#pwdiv")
						.append(
							'<label id="pwlabel">??????????????? ??????+?????? ?????? 8?????? ??????????????? ?????????.</label>');
					$("#pwlabel").css("color", "red");
				} else {
					$("label").remove('#pwlabel');
					$("#pwchk").attr("disabled", false);
					$('#pwchk').focus();
				}
		})

	// ???????????? ??????
		$("#newpassword2").blur(
			function () {
				if ($("#b_password").val() == $("#newpassword2").val()) {
					$("label").remove('#pwchklabel');
					$("label").remove('#pwchklabelok');
					$("#pwchkdiv").append(
						'<label id="pwchklabelok">??????????????? ?????????????????????.</label>');
				} else {
					$("label").remove('#pwchklabel');
					$("label").remove('#pwchklabelok');
					$("#pwchkdiv").append(
						'<label id="pwchklabel">??????????????? ???????????? ????????????.</label>');
					$("#pwchklabel").css("color", "red");
				}
	}) */
		
		/* function updateProfile() {
			var newpwd1 = document.getElementById("b_password").value;
			var newpwd2 = document.getElementById("newpassword2").value;
			
			var b_email = document.getElementById("b_email").value;
			console.log(b_email);
			var b_nickname = document.getElementById("b_nickname").value;
			var b_zipcode = document.getElementById("b_zipcode").value;
			var b_address = document.getElementById("b_address").value;
			var b_detailaddress = document.getElementById("b_detailaddress").value;
			var b_password = document.getElementById("b_password").value;
			
			if(newpwd1 != newpwd2) {
				window.alert("????????? ??????????????? ???????????? ????????????.");
				return;
			}
			
			 $.ajax({
	 			url:"profileUpdate.do",
        		type:"get",
        		data: {
        			b_email : b_email,
        			b_nickname : b_nickname,
        			b_zipcode : b_zipcode,
        			b_address : b_address,
        			b_detailaddress : b_detailaddress,
        			b_password : b_password
        		},
        		success: function() {
        			alert("?????????????????????.");
        			location.href="goBuyerMypage.do"
        		} 
        		
	 		});
	 		console.log("dd");

		} */
	</script>

<!-- buyerUpdate End -->
</body>
</html>