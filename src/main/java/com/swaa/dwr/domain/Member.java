/**
 *
 */
package com.swaa.dwr.domain;

/**
 * @author ¹é±â¼±(whiteship2000@gmail.com)
 *
 */
public class Member {

	private String name;

	private String email;

	public Member(String name, String email) {
		this.name = name;
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
