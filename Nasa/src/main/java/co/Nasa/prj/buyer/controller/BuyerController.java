package co.Nasa.prj.buyer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BuyerController {
	@RequestMapping("/reportHistory.do")
	public String reportHistory() {
		return "buyer/reportHistory";
	}
	
}
