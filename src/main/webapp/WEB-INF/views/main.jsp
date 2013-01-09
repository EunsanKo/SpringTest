<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Spring Study</title>
<script type='text/javascript' src='dwr/engine.js'></script>
<script type='text/javascript' src='dwr/interface/MemberService.js'></script>
<script type='text/javascript' src='dwr/interface/MapService.js'></script>
<script type='text/javascript' src='dwr/util.js'></script>
<script type="text/javascript">//<![CDATA[
function inputChanged() {
	var name = document.memberForm.name.value;
	if(name.length > 1) {
		MemberService.get(name, updateTable);
	} else {
		DWRUtil.removeAllRows("memberTable");
	}
}

function updateTable(results) {
	DWRUtil.removeAllRows("memberTable");
	DWRUtil.addRows("memberTable", results, cellFuncs);
}

var cellFuncs = [
	function(data) { return data.name; },
	function(data) { return data.email; }
];


function getGoogleGeocode(){
	var dong = document.getElementById("dong").value;
	var newComment = {
		addr: dong
	};
	MapService.getGeoCode(newComment,onGetComments);
}

var onGetComments = function(data){
	alert(data);
}
//]]></script>
<!--[if IE]><link rel="stylesheet" type="text/css" media="screen" href="http://www.epril.com/wp-content/themes/CnM/ie.css" /><![endif]-->
</head>

<body>
<c:import url="/WEB-INF/jsp/include/header.jsp" />
<h1>Spring Ajax Sample Application</h1>
회원 검색
<br />
<form name="memberForm">
	<input type="text" name="name" maxlength="10" onkeyup="inputChanged();" />
</form>
<table border="1">
	<thead>
		<tr>
			<td>Name</td>
			<td>Email</td>
		</tr>
	</thead>
	<tbody id="memberTable"></tbody>
</table>
Google Geocoding API : 
<input type="text" name="dong" id="dong"/>
<input type="button" value="Test2" onclick="getGoogleGeocode();"/>
<c:import url="/WEB-INF/jsp/include/footer.jsp" />
</body>
</html>
