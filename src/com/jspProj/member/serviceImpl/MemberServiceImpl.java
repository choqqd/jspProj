package com.jspProj.member.serviceImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jspProj.common.DAO;
import com.jspProj.member.service.MemberService;
import com.jspProj.member.vo.MemberVO;

public class MemberServiceImpl extends DAO implements MemberService {

	PreparedStatement psmt;
	ResultSet rs;
	String sql;

	// Id 체크
	public boolean idCheck(String id) {
		boolean exist = false;
		sql = "select member_id from member where member_id = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			if (rs.next()) {
				exist = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return exist;
	}

	// Member 테이블에 id와 password가 일치하는지 체크하는 메소드
	public MemberVO checkMember(MemberVO vo) {
		sql = "select * from member where member_id = ? and member_pwd = ?";
		MemberVO mvo = null;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getMemberId());
			psmt.setString(2, vo.getMemberPwd());
			rs = psmt.executeQuery();
			if (rs.next()) {
				mvo = new MemberVO();
				mvo.setMemberId(rs.getString("member_id"));
				mvo.setMemberPwd(rs.getString("member_pwd"));
				mvo.setMemberName(rs.getString("member_name"));
				mvo.setMemberMail(rs.getString("member_mail"));
				mvo.setMemberTel(rs.getString("member_tel"));
				mvo.setMemberAddr(rs.getString("member_addr"));
				mvo.setMemberReq(rs.getString("member_req"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return mvo;
	}
	
	// 페이징
	public List<MemberVO> noticeListPaging(int page){
		String sql = "select b.*\r\n"//
				+ "from(select rownum m, a.*\r\n"//
				+ "      from (select * from member n where n.member_id not like '%admin%' order by n.member_id)a) b\r\n"//
				+ "where b.m between ? and ?";//
		List<MemberVO> list = new ArrayList<MemberVO>();
		int firstCnt =0, lastCnt = 0;
		firstCnt = (page-1)*5 +1; // 1
		lastCnt = (page * 5); //5
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, firstCnt);
			psmt.setInt(2, lastCnt);
			rs = psmt.executeQuery();
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setMemberId(rs.getString("member_id"));
				vo.setMemberPwd(rs.getString("member_pwd"));
				vo.setMemberName(rs.getString("member_name"));
				vo.setMemberMail(rs.getString("member_mail"));
				vo.setMemberTel(rs.getString("member_tel"));
				vo.setMemberAddr(rs.getString("member_addr"));
				vo.setMemberReq(rs.getString("member_req"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close();
		}
		return list;
	}
	
	// 어드민 멤버 리스트
	@Override
	public List<MemberVO> selectMemberList() {
		sql="select * from member where member_id not like '%admin%' order by 3";
		List<MemberVO> list = new ArrayList<MemberVO>();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setMemberId(rs.getString("member_id"));
				vo.setMemberPwd(rs.getString("member_pwd"));
				vo.setMemberName(rs.getString("member_name"));
				vo.setMemberMail(rs.getString("member_mail"));
				vo.setMemberTel(rs.getString("member_tel"));
				vo.setMemberAddr(rs.getString("member_addr"));
				vo.setMemberReq(rs.getString("member_req"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	@Override
	public MemberVO selectMember(String id) {
		sql = "select * from member where member_id = ?";
		MemberVO mvo = null;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if (rs.next()) {
				mvo = new MemberVO();
				mvo.setMemberId(rs.getString("member_id"));
				mvo.setMemberPwd(rs.getString("member_pwd"));
				mvo.setMemberName(rs.getString("member_name"));
				mvo.setMemberMail(rs.getString("member_mail"));
				mvo.setMemberTel(rs.getString("member_tel"));
				mvo.setMemberAddr(rs.getString("member_addr"));
				mvo.setMemberReq(rs.getString("member_req"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return mvo;
	}

	// 회원가입
	@Override
	public int insertMember(MemberVO vo) {
		sql = "insert into member values(?,?,?,?,?,?,?)";
		int insert = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getMemberId());
			psmt.setString(2, vo.getMemberPwd());
			psmt.setString(3, vo.getMemberName());
			psmt.setString(4, vo.getMemberMail());
			psmt.setString(5, vo.getMemberTel());
			psmt.setString(6, vo.getMemberAddr());
			psmt.setString(7, vo.getMemberReq());

			insert = psmt.executeUpdate();
			if (insert != 0) {
				System.out.println(insert + "건 가입완료");
			} else {
				System.out.println("가입실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return insert;
	}

	@Override
	public int updateMember(MemberVO vo) {
		sql = "update member set member_pwd = ?, member_name = ?, member_mail = ?, member_tel = ?, member_addr = ?, member_req = ? where member_id = ?";
		int n = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getMemberPwd());
			psmt.setString(2, vo.getMemberName());
			psmt.setString(3, vo.getMemberMail());
			psmt.setString(4, vo.getMemberTel());
			psmt.setString(5, vo.getMemberAddr());
			psmt.setString(6, vo.getMemberReq());
			psmt.setString(7, vo.getMemberId());
			n = psmt.executeUpdate();
			if(n != 0) {
				System.out.println("업데이트 성공");
			} else {
				System.out.println("업데이트 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}

	@Override
	public int deleteMember(MemberVO vo) {
		sql = "delete from member where member_id = ?";
		int n = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getMemberId());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}

	public void close() {

		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (psmt != null) {
			try {
				psmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
