<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.nice-select {
		width: 300px;
	}
	
	.fables-counter {
		position: relative;
		z-index: 1;
		color: #fff;
		text-align: center;
	}
	
	.fables-forth-text-color {
		color: #5C6A77;
	}
	
	.fables-second-border-color {
		border-color: #E54D42 !important;
	}
	
	.font-40 {
		font-size: 40px;
	}
</style>
</head>
<body>
	<div class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="hero-cap text-center pt-50">
						<h2>매출 확인</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row justify-content-center">
		<div class="col-xl-8" style="margin-top:40px;">
			<div class="card mb-4">
				<div class="card-body">
					<table class="table caption-top table-bordered  text-center">
						<tbody>

							<tr>
								<th class="align-middle table-primary">서비스 선택</th>
								<td>
									<select>
										<option selected="">웹개발1</option>
										<option value="1">웹개발2</option>
										<option value="2">Jun 19</option>
									</select>
								</td>

							</tr>
							<tr>
								<th class="align-middle table-primary">날짜 선택</th>
								<td style="text-align: left;">
									<input type="radio" name="chk_info" value="day" checked="checked">일일 매출
									<input type="date"><br />
									<input type="radio" name="chk_info" value="daily">일간 매출
									<input type="date"> ~ <input type="date"><br />
									<input type="radio" name="chk_info" value="month">월간 매출
									<input type="date"> ~ <input type="date"><br />
									<input type="radio" name="chk_info" value="year">연간 매출
									<input type="date"> ~ <input type="date"><br />
								</td>
							</tr>
						</tbody>
					</table>
					

					<div class="d-flex justify-content-end my-4">
						<button class="btn btn-outline-secondary">검색<i class="ml-2 icon-magnifier search"></i></button>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div class="row justify-content-center">
		<div class="col-xl-8" style="margin-top:40px;">
			<div class="card mb-4">
				<div class="container pb-0 py-lg-5">
					<div class="row">
						<div class="col-6 col-md-6">
							<div class="fables-counter">
								<h2 class="fables-counter-value font-40 font-weight-bold mb-3 fables-forth-text-color border fables-second-border-color d-inline-block px-4 py-2 mb-4"
									data-count="307">123</h2>
								<h3 class="font-14 semi-font fables-forth-text-color">총 매출액</h3>
							</div>
						</div>
						<div class="col-6 col-md-6">
							<div class="fables-counter">
								<h2 class="fables-counter-value font-40 font-weight-bold mb-3 fables-forth-text-color border fables-second-border-color d-inline-block px-4 py-2 mb-4"
									data-count="95">12312</h2>
								<h3 class="font-14 semi-font fables-forth-text-color">총 수수료</h3>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row justify-content-center">
		<div class="col-xl-8" style="margin-top:40px;">
			차트차트
		</div>
	</div>
</body>
</html>