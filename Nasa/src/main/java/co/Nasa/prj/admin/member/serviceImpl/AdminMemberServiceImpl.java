package co.Nasa.prj.admin.member.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Nasa.prj.admin.member.service.AdminMemberMapper;
import co.Nasa.prj.admin.member.service.AdminMemberService;
import co.Nasa.prj.comm.VO.BuyerVO;
import co.Nasa.prj.comm.VO.SellerVO;

@Repository("memberDao")
public class AdminMemberServiceImpl implements AdminMemberService{
	
	@Autowired
	AdminMemberMapper map;

	@Override
	public List<BuyerVO> buyerList() {
		// TODO Auto-generated method stub
		return map.buyerList();
	}

	@Override
	public List<SellerVO> sellerList() {
		// TODO Auto-generated method stub
		return map.sellerList();
	}
	
}
