<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>我的消息 - {{lay.base.name}}</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">

</head>
<body>

  <jsp:include page="../common/header.jsp"/>

<div class="main fly-user-main layui-clear">

  <jsp:include page="../common/user-nav.jsp"/>
  <div class="fly-panel fly-panel-user" pad20>
	  <div class="layui-tab layui-tab-brief" lay-filter="user" id="LAY_msg" style="margin-top: 15px;">
	    <button class="layui-btn layui-btn-danger layui-hide" id="LAY_delallmsg">清空全部消息</button>
	    <div id="LAY_minemsg" style="margin-top: 10px;"></div>
	  </div>
	</div>

</div>

<jsp:include page="../common/footer.jsp"/>

</body>
</html>