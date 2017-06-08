<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>求解答 - </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
<style type="text/css">

.logo1 {
    position: absolute;
    top: 13px;
    left: 0;
    width: 135px;
    height: 37px;
    text-indent: -666px;
    background: url(${pageContext.request.contextPath}/resources/images/logo.png) no-repeat;
}

</style>
</head>
<body>


 <jsp:include page="../common/header.jsp"/>
 
<div class="main layui-clear">
  <div class="wrap">
    <div class="content" style="margin-right:0">
      <div class="fly-tab">
        <span>
          <a href="${pageContext.request.contextPath}/jie/" <c:if test="${pageType=='jie' }"> class="tab-this" </c:if> >全部</a>
          <a href="${pageContext.request.contextPath}/jie/unsolved/" <c:if test="${pageType=='unsolved' }"> class="tab-this" </c:if> >未结帖</a>
          <a href="${pageContext.request.contextPath}/jie/solved/" <c:if test="${pageType=='solved' }"> class="tab-this" </c:if>>已采纳</a>
          <a href="${pageContext.request.contextPath}/jie/wonderful/" <c:if test="${pageType=='wonderful' }"> class="tab-this" </c:if>>精帖</a>
     	<c:if test="${currentUser.uid!=null }">
          <a href="${pageContext.request.contextPath}/user/">我的帖</a>
     	</c:if>
        
        </span>
        <form action="http://cn.bing.com/search" class="fly-search">
          <i class="iconfont icon-sousuo"></i>
          <input class="layui-input" autocomplete="off" placeholder="搜索内容，回车跳转" type="text" name="q">
        </form>
        <a href="${pageContext.request.contextPath}/jie/add/" class="layui-btn jie-add">发布问题</a>
      </div>
    
    <ul class="fly-list">
    	<c:forEach var="q" items="${questions}" >
    	
    		 <li class="fly-list-li">
				 <a href="${pageContext.request.contextPath}/u/${q.user.username }" class="fly-list-avatar">
				       <img src="http://tp4.sinaimg.cn/1345566427/180/5730976522/0" alt="${q.user.username }">
				 </a>
				  <h2 class="fly-tip">
				   <a href="${pageContext.request.contextPath}/jie/detail/${q.questionId}">${q.questionTiltle }</a>
				       <c:if test="${q.isStick==1 }">
					      	<span class="fly-tip-stick">置顶</span>
					    </c:if>
					   	<c:if test="${q.isJing==1 }">
					         <span class="fly-tip-jing">精帖</span>
					    </c:if>
					           
				     </h2>
				       <p>
				         <span><a href="${pageContext.request.contextPath}/u/${q.user.username}">${q.user.username}</a></span>
	          			 <span> <fmt:formatDate value="${q.addTime }" type="date" pattern="yyyy-MM-dd HH:mm"/></span>
	         			 <span>${q.qCategory.categoryName }</span>
				           <span class="fly-list-hint"> 
				             <i class="iconfont" title="回答">&#xe60c;</i> ${q.anwerCount }
				             <i class="iconfont" title="人气">&#xe60b;</i> ${q.viewCount}
				            </span>
				         </p>
				  </li>
      
     </c:forEach>
      </ul>

				<div style="text-align: center">
					<div class="laypage-main">
						
						${navPage}
					</div>
				</div>

			</div>
    
  </div>
</div>
  <jsp:include page="../common/footer.jsp"/>



</body>
</html>