<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
 <%   %>
 
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>iLvc 社区</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="resources/layui/css/layui.css">
  <link rel="stylesheet" href="resources/css/global.css">
</head>
<body>

<div class="header">
  <div class="main">
    <a class="logo"  href="${pageContext.request.contextPath}" title="iLvc">iLvc社区</a>
    <div class="nav">
      <a class="nav-this" href="${pageContext.request.contextPath}/jie/">
        <i class="iconfont icon-wenda"></i>问答
      </a>
      <a href="http://www.ilvc.me/" target="_blank">
        <i class="iconfont icon-ui"></i>iLvc-博客
      </a>
    </div>
    <div class="nav-user">
    <c:if test="${currentUser!=null}">
    	 <!-- 登入后的状态 -->
     
      <a class="avatar" href="${pageContext.request.contextPath}/user/index.html">
        <img src="${currentUser.avtar}">
        <cite>${currentUser.username}</cite>
      <!--   <i>VIP2</i> -->
      </a>
      <div class="nav">
        <a href="${pageContext.request.contextPath}/user/set/"><i class="iconfont icon-shezhi"></i>设置</a>
        <a href="${pageContext.request.contextPath}/user/logout/"><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>退了</a>
      </div>
    </c:if>
       <c:if test="${currentUser==null}">
	      <!-- 未登入状态 -->
	      <a class="unlogin" href="${pageContext.request.contextPath}/user/login"><i class="iconfont icon-touxiang"></i></a>
	      <span><a href="${pageContext.request.contextPath}/user/login">登入</a><a href="${pageContext.request.contextPath}/user/reg">注册</a></span>
	      <p class="out-login">
	        <a href="" onclick="layer.msg('正在通过QQ登入', {icon:16, shade: 0.1, time:0})" class="iconfont icon-qq" title="QQ登入"></a>
	        <a href="" onclick="layer.msg('正在通过微博登入', {icon:16, shade: 0.1, time:0})" class="iconfont icon-weibo" title="微博登入"></a>
	      </p>   
      </c:if>
     
      
    </div>
  </div>
</div>


<div class="main layui-clear">
  <div class="wrap">
    <div class="content">
      <div class="fly-tab fly-tab-index">
        <span>
         <a href="${pageContext.request.contextPath}/jie/" <c:if test=" ${pageType=='jie'}">class="tab-this" </c:if> >全部</a>
          <a href="${pageContext.request.contextPath}/jie/unsolved/" <c:if test="${pageType=='unsolved' }">class="tab-this" </c:if> >未结帖</a>
          <a href="${pageContext.request.contextPath}/jie/solved/" <c:if test="${pageType=='solved' }">class="tab-this" </c:if>>已采纳</a>
          <a href="${pageContext.request.contextPath}/jie/wonderful/" <c:if test="${pageType=='wonderful' }"> class="tab-this" </c:if>>精帖</a>
          <c:if test="${currentUser!=null}">
    	 	
          	<a href="${pageContext.request.contextPath}/user/" <c:if test="${pageType=='user' }"> class="tab-this" </c:if> >我的帖</a>
        	</c:if>
        </span>
        <form action="http://cn.bing.com/search" class="fly-search">
          <i class="iconfont icon-sousuo"></i>
          <input class="layui-input" autocomplete="off" placeholder="搜索内容，回车跳转" type="text" name="q">
        </form>
        <a href="${pageContext.request.contextPath}/jie/add"  class="layui-btn jie-add">发布问题</a>
      </div>
      
      
      <ul class="fly-list fly-list-top">
      	<c:forEach var="question" items="${qStick }">
      		
	        <li class="fly-list-li">
	          <a href="${pageContext.request.contextPath}/u/${question.user.username}" class="fly-list-avatar">
	            <img src="${question.user.avtar}" alt="${question.user.username}">
	          </a>
	          <h2 class="fly-tip">
	            <a href="${pageContext.request.contextPath}/jie/detail/${quesion.questionId }">${question.questionTiltle}</a>
	            <c:if test="${question.isStick==1 }">
	            	<span class="fly-tip-stick">置顶</span>
	            </c:if>
	           	<c:if test="${question.isJing==1 }">
	           		 <span class="fly-tip-jing">精帖</span>
	           	</c:if>
	          </h2>
	          <p>
	            <span><a href="${pageContext.request.contextPath}/u/${question.user.username}">${question.user.username}</a></span>
	            
	             <span> <fmt:formatDate value="${question.addTime }" type="date" pattern="yyyy-MM-dd HH:mm"/></span>
	            
	            <span>${question.qCategory.categoryName}</span>
	            <span class="fly-list-hint"> 
	              <i class="iconfont" title="回答">&#xe60c;</i> ${question.anwerCount}
	              <i class="iconfont" title="人气">&#xe60b;</i> ${question.viewCount}
	            </span>
	          </p>
	        </li>
      	</c:forEach>
        
      </ul>
      
      <ul class="fly-list">
        
        <c:forEach var="question" items="${q2recent}">
      		<c:if test="${question.isStick!=1}">
      		
      		
	        <li class="fly-list-li">
	          <a href="${pageContext.request.contextPath}/u/${question.user.username}" class="fly-list-avatar">
	           <img src="${question.user.avtar}" alt="${question.user.username}">
	          </a>
	          <h2 class="fly-tip">
	            <a href="${pageContext.request.contextPath}/jie/detail/${ question.questionId}">${question.questionTiltle}</a>
	           
	             <c:if test="${question.isJing==1 }">
	            	 <span class="fly-tip-jing">精帖</span>
	            </c:if>
	           
	          </h2>
	          <p>
	            <span><a href="${pageContext.request.contextPath}/u/${question.user.username}">${question.user.username}</a></span>
	            <span> <fmt:formatDate value="${question.addTime }" type="date" pattern="yyyy-MM-dd HH:mm"/></span>
	            <span>${question.qCategory.categoryName }</span>
	            <span class="fly-list-hint"> 
	              <i class="iconfont" title="回答">&#xe60c;</i> ${question.anwerCount}
	              <i class="iconfont" title="人气">&#xe60b;</i> ${question.viewCount}
	            </span>
	          </p>
	        </li>
	        </c:if>
      	</c:forEach>
        </ul>
      
      <div style="text-align: center">
        <div class="laypage-main">
          <a href="${pageContext.request.contextPath}/jie/page/2" class="laypage-next">更多求解</a>
        </div>
      </div>
      
    </div>
  </div>
  
  <div class="edge">
    <div class="fly-panel leifeng-rank"> 
      <h3 class="fly-panel-title">近一月回答榜 - TOP 12</h3>
      <dl>
        
        <c:forEach items="${ans2top}" var="user" end="12">
        	 <dd>
        	  <a href="${pageContext.request.contextPath}/u/${user.username}">
            	<img src="${user.avtar}" alt="${user.username}">
            	<cite>${user.username }</cite>
           	   <i>${user.count}次回答</i>
         	  </a>
       		 </dd>
        </c:forEach>
        
      </dl>
    </div>
    
    <dl class="fly-panel fly-list-one"> 
      <dt class="fly-panel-title">最近热帖</dt>
      
      <c:forEach items="${q2view}" var="q" end="12">
         <dd>
		    <a href="${pageContext.request.contextPath}/jie/detail/${q.questionId }">${q.questionTiltle}</a>
		    <span><i class="iconfont">&#xe60b;</i> ${q.viewCount}</span>
		  </dd>
        </c:forEach>
    </dl>
    
    <dl class="fly-panel fly-list-one"> 
      <dt class="fly-panel-title">近期热议</dt>
    
     <c:forEach items="${q2count}" var="q" end="12">
         <dd>
		    <a href="${pageContext.request.contextPath}/jie/detail/${q.questionId }">${q.questionTiltle}</a>
		    <span><i class="iconfont">&#xe60b;</i> ${q.viewCount}</span>
		  </dd>
      </c:forEach>
      
    </dl>
    
    <div class="fly-panel fly-link"> 
      <h3 class="fly-panel-title">友情链接</h3>
      <dl>
        <dd>
          <a href="http://www.layui.com/" target="_blank">layui</a>
        </dd>
        <dd>
          <a href="http://layim.layui.com/" target="_blank">LayIM</a>
        </dd>
        <dd>
          <a href="http://layer.layui.com/" target="_blank">layer</a>
        </dd>
      </dl>
    </div>


  </div>
</div>

<div class="footer">
  <p><a href="http://wenda.ilvc.me/">iLvc社区</a> 2017 &copy; <a href="http://www.layui.com/">ilvc.me</a></p>
  <p>
  
    <a href="http://fly.layui.com/jie/8157.html" target="_blank">模版来自Fly社区</a>
    <a href="http://ilvc.me" target="_blank">iLvc</a>
  </p>
</div>
<script src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
  <script type="text/javascript">
  layui.use(['form','element'], function(){
	  var element = layui.element(),form = layui.form();
	});
  </script>

</body>
</html>