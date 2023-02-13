package com.hosinsa.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;

import com.hosinsa.domain.MemberVO;
import com.hosinsa.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public void join(MemberVO member) {
		log.info("join...." + member);
		memberMapper.insert(member);
	}

	@DateTimeFormat
	@Override
	public boolean modify(MemberVO member) {
		log.info("modify...." + member);
		return memberMapper.update(member) == 1;
	}

	@Override
	public boolean remove(String id) {
		log.info("remove...." + id);
		return memberMapper.delete(id) == 1;
	}

	/*
	 * @Override public List<MemberVO> getList() { log.info("getList...."); return
	 * memberMapper.getList(); }
	 */

	@Override
	public MemberVO memberLogin(MemberVO member) {
		return memberMapper.memberLogin(member);
	}

	@Override
	public int idCheck(String memberId) {
		return memberMapper.idCheck(memberId);
	}

	@Override
	public int nickCheck(String memberNickname) {
		return memberMapper.nickCheck(memberNickname);
	}

	@Override
	public int introCheck(String memberIntroducer) {
		return memberMapper.introCheck(memberIntroducer);
	}
}
