package co.Nasa.prj.admin.member.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Nasa.prj.admin.member.service.AdminMemberMapper;
import co.Nasa.prj.admin.member.service.AdminMemberService;
import co.Nasa.prj.admin.service.AdminAuthorVO;
import co.Nasa.prj.admin.service.Criteria;
import co.Nasa.prj.comm.VO.BuyerVO;
import co.Nasa.prj.comm.VO.SellerVO;

@Repository("memberDao")
public class AdminMemberServiceImpl implements AdminMemberService{
	
	@Autowired
	AdminMemberMapper map;

//	@Override
//	public List<BuyerVO> buyerList() {
//		// TODO Auto-generated method stub
//		return map.buyerList();
//	}
	

	@Override
	public AdminAuthorVO selectBuyer(String id) {
		// TODO Auto-generated method stub
		return map.selectBuyer(id);
	}

	@Override
	public List<SellerVO> sellerList() {
		// TODO Auto-generated method stub
		return map.sellerList();
	}


//	@Override
//	public List<AdminAuthorVO> selectBuyerPayment(String id, Criteria cri) {
//		// TODO Auto-generated method stub
//		return map.selectBuyerPayment(id,cri);
//	}


	@Override
	public List<BuyerVO> getListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return map.getListWithPaging(cri);
	}

	@Override
	public int getBuyerTotal() {
		// TODO Auto-generated method stub
		return map.getBuyerTotal();
	}

	@Override
	public List<AdminAuthorVO> selectBuyerPayment(String id, Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}



	
	
}
