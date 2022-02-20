package co.Nasa.prj.buyer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BuyerController {
	// 신고내역 페이지로 이동
	@RequestMapping("/reportHistory.do")
	public String reportHistory() {
		return "buyer/reportHistory";
	}
	
	// 구매내역 페이지로 이동
	@RequestMapping("/buyHistory.do")
	public String buyHistory() {
		return "buyer/buyHistory";
	}
	
	// 보유 쿠폰 페이지로 이동
	@RequestMapping("/buyerCoupons.do")
	public String buyerCoupons() {
		return "buyer/buyerCoupons";
	}
	
	// 위시 리스트 페이지로 이동
	@RequestMapping("/wishlist.do")
	public String wishlist() {
		return "buyer/wishlist";
	}
	
	// 구매자 정보 수정 페이지로 이동
	@RequestMapping("/buyerUpdate.do")
	public String buyerUpdate() {
		return "buyer/buyerUpdate";
	}
}
