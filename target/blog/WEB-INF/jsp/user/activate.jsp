<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>激活邮箱 - iLvc社区</title>
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
    <div class="layui-tab layui-tab-brief" lay-filter="user">
      <ul class="layui-tab-title">
        <li class="layui-this">
          <a href="/user/activate/">激活邮箱</a>
        </li>
      </ul>
      <div class="layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
        <ul class="layui-form">
          <li class="layui-form-li">
            <label for="activate">您的邮箱：</label>
            <span class="layui-form-text"> ${currentUser.email}
           <c:if test="${currentUser.isActivate==1}">
	            <em style="color:#999;">（已成功激活）</em>
           </c:if>
             <c:if test="${currentUser.isActivate==0}">
	             <em style="color:#c00;">（尚未激活）</em>
           </c:if>
            </span>
          </li>
          
          <c:if test="${currentUser.isActivate==0}">
	           
          <li class="layui-form-li" style="margin-top: 20px; line-height: 26px;">
            <div>
              1. 如果您未收到邮件，或激活链接失效，您可以
              <a class="layui-form-a" style="color:#4f99cf;" id="LAY-activate" href="javascript:;" >重新发送邮件</a>，或者
              <a class="layui-form-a" style="color:#4f99cf;" href="${pageContext.request.contextPath}/user/set/">更换邮箱</a>；
            </div>
            <div>
              2. 如果您始终没有收到 Fly 发送的邮件，请注意查看您邮箱中的垃圾邮件；
            </div>
            <div>
              3. 如果你实在无法激活邮件，您还可以联系：xianxin@layui.com
            </div>
          </li>
           </c:if>
        </ul>
      </div>
    </div>
  </div>

</div>

  <jsp:include page="../common/footer.jsp"/>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
  <script type="text/javascript">
  layui.use(['form','jquery','element','layer'], function(){
	  var element = layui.element(),form = layui.form(), $ = layui.jquery;
	  var layer = layui.layer;
	 
	  $('#LAY-activate').click(function(){
		 $.get("${pageContext.request.contextPath}/ajax/activate","id=${md5}",function(data){
				if(data.code=1){
					layer.msg("激活邮件已发送成功！请查收--iLvc 社区");
				}else{
					layer.msg("激活邮件发送失败！请联系管理员");
				}
		 });
	  });
	  
	 
	});
  
	      
  </script>
</body>
</html>