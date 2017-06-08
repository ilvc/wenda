<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
<title>${homeUser.username}的主页  -iLvc社区</title>

</head>
<body class="fly-full">

  <jsp:include page="../common/header.jsp"/>

<div class="fly-home" style="background-image: url();">
  <img src="{{info.avatar}}" alt="{{info.username}}">
  <h1>
    	${homeUser.username}

    <i class="iconfont <c:if test="${homeUser.sex eq 1}" >icon-nan</c:if>  <c:if test="${homeUser.sex eq 2}">icon-nv </c:if> "></i> 

   <c:if test="" >
      <span style="color: #FF7200;"><!-- vip --></span>
    </c:if> 
    
	<c:if test="" >
      <span style="color:#c00;">（管理员）</span>
   </c:if>
   <c:if test="" >
      <span style="color:#5FB878;">（社区之光）</span>
   </c:if>
   <c:if test="" >
      <span>（该号已被封）</span>
    </c:if>
  </h1>

  <p class="fly-home-info">
    <i class="iconfont icon-zuichun" title="飞吻"></i><span style="color: #FF7200;"> 9999 飞吻</span>
    <i class="iconfont icon-shijian"></i><span>${homeUser.jointime} 加入</span>
    <i class="iconfont icon-chengshi"></i><span>来自 ${homeUser.city}<c:if test="${homeUser.city==null }">中国某城</c:if></span>
  </p>

  <p class="fly-home-sign">${homeUser.signature}<c:if test="${homeUser.signature==null }">这家伙懒得留签名</c:if></p>

 <!--  {{# if(user.id !== info.id && d.res === 'http://local.res.layui.com/'){ 
    var userinfo = JSON.stringify({
      uid: 168*info.id
      ,avatar: info.avatar
      ,type: 'friend'
      ,username: info.username
    });
  }} 
  <div class="fly-sns" data-user="{{ encodeURIComponent(userinfo) }}">
    <a href="javascript:;" class="layui-btn layui-btn-primary fly-imActive" data-type="addFriend">加为好友</a>
    <a href="javascript:;" class="layui-btn layui-btn-normal fly-imActive" data-type="chat">发起会话</a>
  </div>
  -->

</div>

<div class="main fly-home-main">
  <div class="layui-inline fly-home-jie">
    <div class="fly-panel">
      <h3 class="fly-panel-title">${homeUser.username} 最近的提问</h3>
      <ul class="jie-row">
      	<c:forEach var="q" items="${homeUser.q4user }">
        <li>
         <c:if test="${q.isJing==1 }"><span class="fly-jing">精</span></c:if>
        <a href="${pageContext.request.contextPath}/jie/detail/${q.questionId}" class="jie-title">${q.questionTiltle}</a>
        <i> <fmt:formatDate value="${q.addTime }" type="date" pattern="yyyy-MM-dd "/></i>
        <em>${q.viewCount}阅/${q.anwerCount}答</em>
        </li>
     	</c:forEach>
      
    	 <c:if test="${homeUser.q4user.size()==0 }">
	      <div class="fly-none" style="min-height: 50px; padding:30px 0; height:auto;"><i style="font-size:14px;">没有发表任何求解</i></div>
    	 </c:if>
    
      </ul>
    </div>
  </div>
  
  <div class="layui-inline fly-home-da">
    <div class="fly-panel">
      <h3 class="fly-panel-title">${homeUser.username} 最近的回答</h3>
      <ul class="home-jieda">
      	<c:forEach var="a" items="${homeUser.a4user }">
      <li>
        <p>
        <span> <i> <fmt:formatDate value="${a.addTime }" type="date" pattern="MM-dd "/></i></span>
     	   在<a href="${pageContext.request.contextPath}/jie/detail/${a.qustionId}" target="_blank">${a.qtitle}</a>中回答：
        </p>
        <div class="home-dacontent">${a.answerContent}</div>
      </li>
      	</c:forEach>
      
       <c:if test="${homeUser.a4user.size()==0 }">
	        <div class="fly-none" style="min-height: 50px; padding:30px 0; height:auto;"><span>没有回答任何问题</span></div>
    	 </c:if>
    
      </ul>
    </div>
  </div>

</div>


  <jsp:include page="../common/footer.jsp"/>
</body>
</html>