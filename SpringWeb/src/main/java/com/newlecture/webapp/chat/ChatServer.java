package com.newlecture.webapp.chat;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value="/resource/chat-server")
public class ChatServer {
	/*값을 식별하는 키의 차이
	 * Set 값 자체가 식별자 값 = 키
	 * List : 순서, 값의 입력순서가 키
	 * Map 
	 *  */
	//Map /List / Set
	private static Set<Session> sessionAll = 
			Collections.synchronizedSet(new HashSet<Session>());
	//POJO : Plain Old Java Object
	
	@OnOpen
	public void onOpen(Session session, EndpointConfig config) {
		sessionAll.add(session);
	//	this.session = session;
	//	session.getBasicRemote();
		System.out.println("누군가 접속");
	}
	@OnMessage
	public void onTextMessage(Session session, String data) throws IOException {
/*		System.out.println(sessionAll.size()+": "+data);*/
		for(Session s: sessionAll)
			s.getBasicRemote().sendText(data);
		System.out.println(sessionAll.size()+": "+data);
	}
	
	@OnClose
	public void onClose(Session session) throws IOException {
		sessionAll.remove(session);
		for(Session s: sessionAll)
			s.getBasicRemote().sendText("누군가 접속을 끊었습니다.");
	}
	
	
	
	
}
