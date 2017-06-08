<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<div class="header">

<script src="${pageContext.request.contextPath}/resources/mods/index.js"></script>
 <div class="main">
    <a class="logo" href="${pageContext.request.contextPath}" title="ilvc">iLvc社区</a>
    <div class="nav">
      <a class="nav-this" href="${pageContext.request.contextPath}/jie/">
        <i class="iconfont icon-wenda"></i>问答
      </a>
      <a href="http://www.ilvc.me/" target="_blank">
        <i class="iconfont icon-ui"></i>iLvc-博客
      </a>
    </div>
    
    <div class="nav-user">
    
    <c:choose>
    	<c:when test="${currentUser!=null }">
			   
	       <a class="avatar" href="${pageContext.request.contextPath}/user/index">
	       
	      <!--   <img src="{{user.avatar}}"> -->
	      <c:if test="${currentUser.avtar!=null }">
	         <img src="${currentUser.avtar}">
	      </c:if>
	       
	       <c:if test="${currentUser.avtar==null}">
	         <i class="iconfont icon-touxiang"></i>
	      </c:if>
	        <cite>${currentUser.username }</cite>
	       
	        <i></i>
	       
	      </a> 
	      <div class="nav">
	        <a href="${pageContext.request.contextPath}/user/set/"><i class="iconfont icon-shezhi"></i>设置</a>
	        <a href="${pageContext.request.contextPath}/user/logout/"><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>退了</a>
	      </div>  	
    	</c:when>
    	<c:otherwise>
    		
		     
		      <a class="unlogin" href="${pageContext.request.contextPath}/user/login/"><i class="iconfont icon-touxiang"></i></a>
		      <span><a href="${pageContext.request.contextPath}/user/login/">登入</a><a href="${pageContext.request.contextPath}/user/reg/">注册</a></span>
		      <p class="out-login">
		        <a href="http://fly.layui.com:8098/app/qq" onclick="layer.msg('正在通过QQ登入', {icon:16, shade: 0.1, time:0})" class="iconfont icon-qq" title="QQ登入"></a>
		        <a href="http://fly.layui.com:8098/app/weibo/" onclick="layer.msg('正在通过微博登入', {icon:16, shade: 0.1, time:0})" class="iconfont icon-weibo" title="微博登入"></a>
		      </p>
    	</c:otherwise>
    </c:choose>
    
    </div>
  </div>
</div>
