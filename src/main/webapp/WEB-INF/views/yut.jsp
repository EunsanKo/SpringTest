<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Spring Study</title>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/interface/ChatService.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>
<script type="text/javascript">//<![CDATA[
function hitEnterKey(){
	if(event.keyCode==13){
		document.getElementById("send").click();
	}
}
                                          
function sendMessage()
{
    var text = DWRUtil.getValue("text");
    //DWRUtil.setValue("text", "");
    //서버쪽의 Chat 에 있는 addMessage 를 호출했습니다.
    //text는 callback 입니다.
    //즉, addMessage 는 getMessages()펑션의 리턴값으로 공용 메시지 리스트를 체워주고,
    //체우고 난 결과값을 text로 callback 합니다.
    //10개가 넘으면 여기서 1개 지워지겠죠?
    ChatService.addMessage(text, gotMessages);
}
function checkMessages()
{
    //공용 메시지 리스트를 체크합니다.
    //다른 클라이언트가 공용메시지를 건드리게 되면, 여기서 반영되겠죠?
    //이 함수는 아래의 setTimeout 을 통해 계속 반복 호출됩니다.
    //물론 이것도 서버에 접근하는 ajax 코드입니다.
    ChatService.getMessages(gotMessages);
}
function gotMessages(messages)
{
    var chatlog = "";
    for (var data in messages)
    {
        chatlog = messages[data].text + "\n" + chatlog;
    }
    DWRUtil.setValue("chatlog", chatlog);
    //스크립트죠? 1000초 쉬고.. 시계만들때 많이 보셨지요?
    //단, 차이점이라면 checkMessages()로 서버에 접근해 메시지 리스트를 얻어오지욤?
    setTimeout("checkMessages()", 1000);
}
       
//]]></script>
<!--[if IE]><link rel="stylesheet" type="text/css" media="screen" href="http://www.epril.com/wp-content/themes/CnM/ie.css" /><![endif]-->
</head>

<body>
<c:import url="/WEB-INF/jsp/include/header.jsp" />
<h1>Yut nori</h1>
<span id="chatlog"></span>
<input type="text" name="text1" id="text1" onkeypress="hitEnterKey();"/>
<input type="text" name="text2" id="text2" onkeypress="hitEnterKey();"/>
<input type="button" id="send" value="SEND" onclick="sendMessage();"/>
<c:import url="/WEB-INF/jsp/include/footer.jsp" />
</body>
</html>
