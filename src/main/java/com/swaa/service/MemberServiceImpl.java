/**
 *
 */
package com.swaa.service;

import java.util.ArrayList;
import java.util.List;

import com.swaa.dwr.domain.Member;

/**
 * @author ¹é±â¼±(whiteship2000@gmail.com)
 *
 */
public class MemberServiceImpl implements MemberService {

	private List<Member> memberList = new ArrayList<Member>();

	public MemberServiceImpl() {
		memberList.add(new Member("koeunsan", "koeunsan@gmail.com"));
		memberList.add(new Member("koeunman", "koeunman@gmail.com"));
		memberList.add(new Member("koeungang", "koeungang@gmail.com"));
		memberList.add(new Member("koeunsamson", "koeunsamson@gmail.com"));
		memberList.add(new Member("kimyohan", "kimyohan@gmail.com"));
		memberList.add(new Member("kimyoman", "kimyoman@gmail.com"));
		memberList.add(new Member("kimjohn", "kimjohn@gmail.com"));
		memberList.add(new Member("kimyokgu", "kimyokgu@gmail.com"));
	}

	public List<Member> get(String name) {
		List<Member> resultList = new ArrayList<Member>();
		for(Member member : memberList){
			if(member.getName().contains(name.subSequence(0, name.length())))
				resultList.add(member);
		}
		return resultList;
	}

}
