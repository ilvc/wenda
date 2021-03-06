<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>帐号设置 - ${currentUser.username}</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/modules/layer/default/layer.css">

</head>
<body>


  <jsp:include page="../common/header.jsp"/>
<div class="main fly-user-main layui-clear">


<jsp:include page="../common/user-nav.jsp"/>

  <div class="fly-panel fly-panel-user" pad20>
    <div class="layui-tab layui-tab-brief" lay-filter="user">
      <ul class="layui-tab-title" id="LAY_mine">
        <li class="layui-this" hash="info">我的资料</li>
        <li hash="avatar">头像</li>
        <li hash="pass">密码</li>
        <li hash="bind">帐号绑定</li>
      </ul>
      <div class="layui-tab-content" style="padding: 20px 0;">
        <div class="layui-form layui-form-pane layui-tab-item layui-show">
          <form method="post" action="${pageContext.request.contextPath}/user/set/base">
            <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">邮箱</label>
              <div class="layui-input-inline">
                <input type="text" id="L_email" name="email" required lay-verify="email" autocomplete="off" value="${currentUser.email }" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">如果您在邮箱已激活的情况下，变更了邮箱，需<a href="/user/activate/" style="font-size: 12px; color: #4f99cf;">重新验证邮箱</a>。</div>
            </div>
            <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">昵称</label>
              <div class="layui-input-inline">
                <input type="text" id="L_username" name="username" required lay-verify="required" autocomplete="off" value="${currentUser.username }" class="layui-input">
              </div>
              <div class="layui-inline">
                <div class="layui-input-inline">
                  <input type="radio" name="sex" value="1" <c:if test="${currentUser.sex==1}"> checked="checked"   </c:if>  title="男">
                  <input type="radio" name="sex" value="2"  <c:if test="${currentUser.sex==0}"> checked="checked"   </c:if>  title="女">
                </div>
              </div>
            </div>
            <div class="layui-form-item">
              <label for="L_city" class="layui-form-label">城市</label>
              <div class="layui-input-inline">
                <input type="text" id="L_city" name="city" autocomplete="off" value="${currentUser.city }" class="layui-input">
              </div>
            </div>
            <div class="layui-form-item layui-form-text">
              <label for="L_sign" class="layui-form-label">签名</label>
              <div class="layui-input-block">
                <textarea placeholder="随便写些什么刷下存在感" id="L_sign"  name="sign" autocomplete="off" class="layui-textarea" style="height: 80px;">${currentUser.signature }</textarea>
              </div>
            </div>
            <div class="layui-form-item">
              <button class="layui-btn" key="set-mine" lay-filter="*" lay-submit>确认修改</button>
            </div>
         </form>
          </div>
          
          <div class="layui-form layui-form-pane layui-tab-item">
            <div class="layui-form-item">
              <div class="avatar-add">
                <p>建议尺寸168*168，支持jpg、png、gif，最大不能超过30KB</p>
                <div class="upload-img">
                  <input type="file" name="file" id="LAY-file" lay-title="上传头像">
                </div>
                <img id="avatar"  src="${currentUser.avtar}">
                <span class="loading"></span>
              </div>
            </div>
          </div>
          
          <div class="layui-form layui-form-pane layui-tab-item">
            <form action="/user/repass" method="post">
              <!-- {{# if(!user.weibo_id && !user.qq_id){ }} -->
              <div class="layui-form-item">
                <label for="L_nowpass" class="layui-form-label">当前密码</label>
                <div class="layui-input-inline">
                  <input type="password" id="L_nowpass" name="nowpass" required lay-verify="required" autocomplete="off" class="layui-input">
                </div>
              </div>
             <!--  {{# } }} -->
              <div class="layui-form-item">
                <label for="L_pass" class="layui-form-label">新密码</label>
                <div class="layui-input-inline">
                  <input type="password" id="L_pass" name="pass" required lay-verify="required" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">6到16个字符</div>
              </div>
              <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label">确认密码</label>
                <div class="layui-input-inline">
                  <input type="password" id="L_repass" name="repass" required lay-verify="required" autocomplete="off" class="layui-input">
                </div>
              </div>
              <div class="layui-form-item">
                <button class="layui-btn" key="set-mine" lay-filter="*" lay-submit>确认修改</button>
              </div>
            </form>
          </div>
          
          <div class="layui-form layui-form-pane layui-tab-item">
            <ul class="app-bind">
              <li class="fly-msg  {{user.qq_id ? 'app-havebind' :''}}">
               <%--  <i class="iconfont icon-qq"></i>
                 <c:if test="${ currentUser.qq_id}">
                <span>已成功绑定，您可以使用QQ帐号直接登录Fly社区，当然，您也可以</span>
                <a href="javascript:;" class="acc-unbind" type="qq_id">解除绑定</a>
                </c:if>
                <c:if test="${currentUser.qq_id==null}">
                 <a href="http://fly.layui.com:8098/app/qq" onclick="layer.msg('正在绑定微博QQ', {icon:16, shade: 0.1, time:0})" class="acc-bind" type="qq_id">立即绑定</a>
                 <span>，即可使用QQ帐号登录Fly社区</span>
                </c:if>
              </li>
              <li class="fly-msg {{user.weibo_id ? 'app-havebind' :''}}">
                <i class="iconfont icon-weibo"></i>
               <c:if test="${currentUser.web_id =null }">
                <span>已成功绑定，您可以使用微博直接登录Fly社区，当然，您也可以</span>
                <a href="javascript:;" class="acc-unbind" type="weibo_id">解除绑定</a>
                </c:if>
                <c:if test="${currentUser.web_id!=null }">
                <a href="http://fly.layui.com:8098/app/weibo/" class="acc-weibo" type="weibo_id"  onclick="layer.msg('正在绑定微博', {icon:16, shade: 0.1, time:0})" >立即绑定</a>
                <span>，即可使用微博帐号登录Fly社区</span>
                </c:if> --%>
              </li>
            </ul>
          </div>
        </div>

      </div>
    </div>
  </div>



<jsp:include page="../common/footer.jsp"/>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
  <script type="text/javascript">
  	layui.use(['form','element'], function(){
	  var element = layui.element(),form = layui.form() ,upload=layui.upload();
	  
	});
  
  	layui.use('upload', function(){
  	  layui.upload({
  		 url: '${pageContext.request.contextPath}/qiuniuupload'
 		    ,elem: '#LAY-file' //指定原始元素，默认直接查找class="layui-upload-file"
 		    ,method: 'post' //上传接口的http类型
 		    ,success: function(res){
 		    	avatar.src = res.url;
 		    }

  	  });
  	});
  
  </script>
</body>
</html>