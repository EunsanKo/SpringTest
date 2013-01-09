/**
 *
 */
package com.swaa.service;

import java.util.LinkedList;
import java.util.List;

import com.swaa.dwr.domain.Message;

/**
 * @author ¹é±â¼±(whiteship2000@gmail.com)
 *
 */
public class ChatServiceImpl implements ChatService {

	private static LinkedList messages = new LinkedList();
	public List addMessage(String text){
		if(text!=null && text.trim().length()>0){
			messages.addFirst(new Message(text));
			while(messages.size()>20){
				messages.removeLast();
			}
		}
		return messages;
	}
		
	public List getMessages(){
		return messages;
	}

}
