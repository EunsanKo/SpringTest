/**
 *
 */
package com.swaa.service;

import java.util.List;

import com.swaa.dwr.domain.Member;

/**
 * @author ��⼱(whiteship2000@gmail.com)
 *
 */
public interface MemberService {

	public List<Member> get(String name);
}
