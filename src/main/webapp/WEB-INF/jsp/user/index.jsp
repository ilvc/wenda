<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  



<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>用户中心 - {{lay.base.name}}</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/modules/layer/default/layer.css">
 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
</head>
<body>

<jsp:include page="../common/header.jsp"/>

<div class="main fly-user-main layui-clear">

  <jsp:include page="../common/user-nav.jsp"/>
  <div class="fly-panel fly-panel-user" pad20>
    <div class="layui-tab layui-tab-brief" lay-filter="user" id="LAY_uc">
     <c:if test="${currentUser.isActivate==0}">
      <div class="fly-msg">
		        您的邮箱尚未验证，这比较影响您的帐号安全，<a href="${pageContext.request.contextPath}/user/activate/">立即去激活？</a>
      </div>
     </c:if>
     
      <ul class="layui-tab-title" id="LAY_mine">
        <li data-type="mine-jie" hash="index" class="layui-this">我发的帖（<span>${currentUser.q4user.size()}</span>）</li>
        <li data-type="collection" data-url="/collection/find/" hash="collection">我收藏的帖（<span>0</span>）</li>
      </ul>
      <div class="layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
        <div class="layui-tab-item layui-show">
          <ul class="mine-view jie-row">
          <c:forEach var="q" items="${currentUser.q4user }">
          	 <li>
	         <c:if test="${q.isJing==1 }"><span class="fly-jing">精</span></c:if>
	        <a href="${pageContext.request.contextPath}/jie/detail/${q.questionId}" class="jie-title">${q.questionTiltle}</a>
	        <i> <fmt:formatDate value="${q.addTime }" type="date" pattern="yyyy-MM-dd "/></i>
	        <em>${q.viewCount}阅/${q.anwerCount}答</em>
	        </li>
	     	</c:forEach>
      
    	 <c:if test="${currentUser.q4user==null }">
	    	  <div class="fly-none" style="min-height: 50px; padding:30px 0; height:auto;"><i style="font-size:14px;">没有发表任何求解</i></div>
    	 </c:if>
          
          </ul>
          <div id="LAY_page"></div>
        </div>
        <div class="layui-tab-item">
          <ul class="mine-view jie-row">
          	<c:if test="${homeUser.a4user==null }">
		      <div class="fly-none" style="min-height: 50px; padding:30px 0; height:auto;"><i style="font-size:14px;">没有收藏任何帖子</i></div>
	    	 </c:if>
          </ul>
          <div id="LAY_page1"></div>
          
          
        </div>
      </div>
    </div>
  </div>

</div>
	
  <jsp:include page="../common/footer.jsp"/>
 
 
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
  <script type="text/javascript">
  layui.use(['form','element'], function(){
	  var element = layui.element(),form = layui.form();
	});
	      
  </script>
</body>
</html>