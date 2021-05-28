package com.jspProj.member.serviceImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.jspProj.common.DAO;
import com.jspProj.member.service.MemberService;
import com.jspProj.member.vo.MemberVO;

public class MemberServiceImpl extends DAO implements MemberService {
	
	PreparedStatement psmt;
	ResultSet rs;
	String sql;
	
	// Member 테이블에 id와 password가 일치하는지 체크하는 메소드
	public MemberVO checkMember(MemberVO vo) {
		sql = "select * from member where member_id = ? and member_pwd = ?";
		MemberVO mvo = null;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getMemberId());
			psmt.setString(2, vo.getMemberPwd());
			rs = psmt.executeQuery();
			if(rs.next()) {
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
	@Override
	public List<MemberVO> selectMemberList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO selectMember() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return 0;
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
