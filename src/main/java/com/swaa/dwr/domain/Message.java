/**
 *
 */
package com.swaa.dwr.domain;

/**
 * @author ¹é±â¼±(whiteship2000@gmail.com)
 *
 */
public class Message {

	private String text = "";
	private long id = System.currentTimeMillis();
	
	public Message(String newText) {
		this.text = newText;
		if(text.length()>256){
			text = text.substring(0,256);
		}
		text = text.replace("<", "[").replace("&", "_");
	}

	public long getId() {
		return id;
	}


	public String getText() {
		return text;
	}


}
