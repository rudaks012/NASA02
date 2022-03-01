package co.Nasa.prj.notice.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Nasa.prj.comm.VO.NoticeVO;
import co.Nasa.prj.notice.service.NoticeMapper;
import co.Nasa.prj.notice.service.NoticeService;

@Repository("NoticeDao")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	NoticeMapper map;

	@Override
	public int noticeInsert(NoticeVO vo) {
		// TODO Auto-generated method stub
		return map.noticeInsert(vo);
	}

	@Override
	public int knowhowInsert(NoticeVO vo) {
		return map.knowhowInsert(vo);
	}

	@Override
	public List<NoticeVO> knowhowSelectList(String no_id) {
		return map.knowhowSelectList(no_id);
	}

	@Override
	public NoticeVO knowhowSelect(String no_code) {
		return map.knowhowSelect(no_code);
	}

	@Override
	public int knowhowDelete(String no_code) {
		return map.knowhowDelete(no_code);
	}

}
