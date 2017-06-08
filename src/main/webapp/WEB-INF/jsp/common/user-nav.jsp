<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<ul class="layui-nav layui-nav-tree layui-inline" lay-filter="user">
  <li class="layui-nav-item">
    <a href="${pageContext.request.contextPath}/u/${currentUser.username}">
      <i class="layui-icon">&#xe609;</i>
      我的主页
    </a>
  </li>
<li class="layui-nav-item	<c:if test="${pageType=='index'}"> layui-this </c:if> ">
    <a href="${pageContext.request.contextPath}/user/index">
      <i class="layui-icon">&#xe612;</i>
      用户中心
    </a>
  </li>
  <li class="layui-nav-item	<c:if test="${pageType=='set'}"> layui-this </c:if>">
    <a href="${pageContext.request.contextPath}/user/set/">
      <i class="layui-icon">&#xe620;</i>
      基本设置
    </a>
  </li>
  <li class="layui-nav-item	<c:if test="${pageType=='message'}"> layui-this </c:if> ">
    <a href="${pageContext.request.contextPath}/user/message/">
      <i class="layui-icon">&#xe611;</i>
      我的消息
    </a>
  </li>
<%--  <li class="layui-nav-item	<c:if test="${pageType==get}"> </c:if> ">
    <a href="${pageContext.request.contextPath}/auth/get/">
      <i class="layui-icon">&#xe61e;</i>
      产品授权
    </a>
  </li> --%>
</ul>

<div class="site-tree-mobile layui-hide">
  <i class="layui-icon">&#xe602;</i>
</div>
<div class="site-mobile-shade"></div>