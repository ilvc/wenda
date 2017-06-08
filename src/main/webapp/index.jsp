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
    <a class="logo" href="${pageContext.request.contextPath}" title="iLvc">iLvc社区</a>
    <div class="nav">
      <a class="nav-this" href="jie/index.html">
        <i class="iconfont icon-wenda"></i>问答
      </a>
      <a href="http://www.layui.com/" target="_blank">
        <i class="iconfont icon-ui"></i>框架
      </a>
    </div>
    
    <div class="nav-user">
      <!-- 未登入状态 -->
      <a class="unlogin" href="${pageContext.request.contextPath}/user/set"><i class="iconfont icon-touxiang"></i></a>
      <span><a href="${pageContext.request.contextPath}/user/login">登入</a><a href="${pageContext.request.contextPath}/user/reg">注册</a></span>
      <p class="out-login">
        <a href="" onclick="layer.msg('正在通过QQ登入', {icon:16, shade: 0.1, time:0})" class="iconfont icon-qq" title="QQ登入"></a>
        <a href="" onclick="layer.msg('正在通过微博登入', {icon:16, shade: 0.1, time:0})" class="iconfont icon-weibo" title="微博登入"></a>
      </p>   
      
      <!-- 登入后的状态 -->
      <!-- 
      <a class="avatar" href="user/index.html">
        <img src="http://tp4.sinaimg.cn/1345566427/180/5730976522/0">
        <cite>贤心</cite>
        <i>VIP2</i>
      </a>
      <div class="nav">
        <a href="/user/set/"><i class="iconfont icon-shezhi"></i>设置</a>
        <a href="/user/logout/"><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>退了</a>
      </div> -->
      
    </div>
  </div>
</div>


<div class="main layui-clear">
  <div class="wrap">
    <div class="content">
      <div class="fly-tab fly-tab-index">
        <span>
         <a href="${pageContext.request.contextPath}/jie/" <c:if test="${pageType==jie }">class="tab-this" </c:if> >全部</a>
          <a href="${pageContext.request.contextPath}/jie/unsolved/" <c:if test="${pageType==unsolved }">class="tab-this" </c:if> >未结帖</a>
          <a href="${pageContext.request.contextPath}/jie/solved/" <c:if test="${pageType==solved }">class="tab-this" </c:if>>已采纳</a>
          <a href="${pageContext.request.contextPath}/jie/wonderful/" <c:if test="${pageType==wonderful }"> class="tab-this" </c:if>>精帖</a>
          {{# if(user.id){ }}
          <a href="${pageContext.request.contextPath}/user/">我的帖</a>
        </span>
        <form action="http://cn.bing.com/search" class="fly-search">
          <i class="iconfont icon-sousuo"></i>
          <input class="layui-input" autocomplete="off" placeholder="搜索内容，回车跳转" type="text" name="q">
        </form>
        <a href="jie/add.html" class="layui-btn jie-add">发布问题</a>
      </div>
      
      
      <ul class="fly-list fly-list-top">
        <li class="fly-list-li">
          <a href="user/home.html" class="fly-list-avatar">
            <img src="http://tp4.sinaimg.cn/1345566427/180/5730976522/0" alt="">
          </a>
          <h2 class="fly-tip">
            <a href="jie/detail">基于 layui的轻量级问答社区页面模版 V2版本</a>
            <span class="fly-tip-stick">置顶</span>
            <span class="fly-tip-jing">精帖</span>
          </h2>
          <p>
            <span><a href="user/home.html">贤心</a></span>
            <span>刚刚</span>
            <span>layui框架综合</span>
            <span class="fly-list-hint"> 
              <i class="iconfont" title="回答">&#xe60c;</i> 317
              <i class="iconfont" title="人气">&#xe60b;</i> 6830
            </span>
          </p>
        </li>
        <li class="fly-list-li">
          <a href="user/home.html" class="fly-list-avatar">
            <img src="resources/images/avatar/00.jpg" alt="">
          </a>
          <h2 class="fly-tip">
            <a href="jie/detail.html">基于 layui的轻量级问答社区页面模版 V2版本</a>
            <span class="fly-tip-stick">置顶</span>
          </h2>
          <p>
            <span><a href="user/home.html">纸飞机</a></span>
            <span>30分钟前</span>
            <span>技术闲谈</span>
            <span class="fly-list-hint"> 
              <i class="iconfont" title="回答">&#xe60c;</i> 502
              <i class="iconfont" title="人气">&#xe60b;</i> 81689
            </span>
          </p>
        </li>
      </ul>
      
      <ul class="fly-list">
        <li class="fly-list-li">
          <a href="user/home.html" class="fly-list-avatar">
            <img src="resources/images/avatar/default.png" alt="">
          </a>
          <h2 class="fly-tip">
            <a href="jie/detail.html">关于layui 引用其他插件，扩展模块 的用法</a>
          </h2>
          <p>
            <span><a href="user/home.html">用户昵称</a></span>
            <span>1小时前</span>
            <span>layui框架综合</span>
            <span class="fly-list-hint"> 
              <i class="iconfont" title="回答">&#xe60c;</i> 8
              <i class="iconfont" title="人气">&#xe60b;</i> 106
            </span>
          </p>
        </li>
        <li class="fly-list-li">
          <a href="user/home.html" class="fly-list-avatar">
            <img src="resources/images/avatar/default.png" alt="">
          </a>
          <h2 class="fly-tip">
            <a href="jie/detail.html">关于layui 引用其他插件，扩展模块 的用法</a>
          </h2>
          <p>
            <span><a href="user/home.html">用户昵称</a></span>
            <span>1小时前</span>
            <span>layui框架综合</span>
            <span class="fly-list-hint"> 
              <i class="iconfont" title="回答">&#xe60c;</i> 8
              <i class="iconfont" title="人气">&#xe60b;</i> 106
            </span>
          </p>
        </li>
        <li class="fly-list-li">
          <a href="user/home.html" class="fly-list-avatar">
            <img src="resources/images/avatar/default.png" alt="">
          </a>
          <h2 class="fly-tip">
            <a href="jie/detail.html">关于layui 引用其他插件，扩展模块 的用法</a>
          </h2>
          <p>
            <span><a href="user/home.html">用户昵称</a></span>
            <span>1小时前</span>
            <span>layui框架综合</span>
            <span class="fly-list-hint"> 
              <i class="iconfont" title="回答">&#xe60c;</i> 8
              <i class="iconfont" title="人气">&#xe60b;</i> 106
            </span>
          </p>
        </li>
        <li class="fly-list-li">
          <a href="user/home.html" class="fly-list-avatar">
            <img src="resources/images/avatar/default.png" alt="">
          </a>
          <h2 class="fly-tip">
            <a href="jie/detail.html">关于layui 引用其他插件，扩展模块 的用法</a>
          </h2>
          <p>
            <span><a href="user/home.html">用户昵称</a></span>
            <span>1小时前</span>
            <span>layui框架综合</span>
            <span class="fly-list-hint"> 
              <i class="iconfont" title="回答">&#xe60c;</i> 8
              <i class="iconfont" title="人气">&#xe60b;</i> 106
            </span>
          </p>
        </li>
        <li class="fly-list-li">
          <a href="user/home.html" class="fly-list-avatar">
            <img src="resources/images/avatar/default.png" alt="">
          </a>
          <h2 class="fly-tip">
            <a href="jie/detail.html">关于layui 引用其他插件，扩展模块 的用法</a>
          </h2>
          <p>
            <span><a href="user/home.html">用户昵称</a></span>
            <span>1小时前</span>
            <span>layui框架综合</span>
            <span class="fly-list-hint"> 
              <i class="iconfont" title="回答">&#xe60c;</i> 8
              <i class="iconfont" title="人气">&#xe60b;</i> 106
            </span>
          </p>
        </li>
        <li class="fly-list-li">
          <a href="user/home.html" class="fly-list-avatar">
            <img src="resources/images/avatar/default.png" alt="">
          </a>
          <h2 class="fly-tip">
            <a href="jie/detail.html">关于layui 引用其他插件，扩展模块 的用法</a>
          </h2>
          <p>
            <span><a href="user/home.html">用户昵称</a></span>
            <span>1小时前</span>
            <span>layui框架综合</span>
            <span class="fly-list-hint"> 
              <i class="iconfont" title="回答">&#xe60c;</i> 8
              <i class="iconfont" title="人气">&#xe60b;</i> 106
            </span>
          </p>
        </li>
        <li class="fly-list-li">
          <a href="user/home.html" class="fly-list-avatar">
            <img src="resources/images/avatar/default.png" alt="">
          </a>
          <h2 class="fly-tip">
            <a href="jie/detail.html">关于layui 引用其他插件，扩展模块 的用法</a>
          </h2>
          <p>
            <span><a href="user/home.html">用户昵称</a></span>
            <span>1小时前</span>
            <span>layui框架综合</span>
            <span class="fly-list-hint"> 
              <i class="iconfont" title="回答">&#xe60c;</i> 8
              <i class="iconfont" title="人气">&#xe60b;</i> 106
            </span>
          </p>
        </li>
        <li class="fly-list-li">
          <a href="user/home.html" class="fly-list-avatar">
            <img src="resources/images/avatar/default.png" alt="">
          </a>
          <h2 class="fly-tip">
            <a href="jie/detail.html">关于layui 引用其他插件，扩展模块 的用法</a>
          </h2>
          <p>
            <span><a href="user/home.html">用户昵称</a></span>
            <span>1小时前</span>
            <span>layui框架综合</span>
            <span class="fly-list-hint"> 
              <i class="iconfont" title="回答">&#xe60c;</i> 8
              <i class="iconfont" title="人气">&#xe60b;</i> 106
            </span>
          </p>
        </li>
        <li class="fly-list-li">
          <a href="user/home.html" class="fly-list-avatar">
            <img src="resources/images/avatar/default.png" alt="">
          </a>
          <h2 class="fly-tip">
            <a href="jie/detail.html">关于layui 引用其他插件，扩展模块 的用法</a>
          </h2>
          <p>
            <span><a href="user/home.html">用户昵称</a></span>
            <span>1小时前</span>
            <span>layui框架综合</span>
            <span class="fly-list-hint"> 
              <i class="iconfont" title="回答">&#xe60c;</i> 8
              <i class="iconfont" title="人气">&#xe60b;</i> 106
            </span>
          </p>
        </li>
        <li class="fly-list-li">
          <a href="user/home.html" class="fly-list-avatar">
            <img src="resources/images/avatar/default.png" alt="">
          </a>
          <h2 class="fly-tip">
            <a href="jie/detail.html">关于layui 引用其他插件，扩展模块 的用法</a>
          </h2>
          <p>
            <span><a href="user/home.html">用户昵称</a></span>
            <span>1小时前</span>
            <span>layui框架综合</span>
            <span class="fly-list-hint"> 
              <i class="iconfont" title="回答">&#xe60c;</i> 8
              <i class="iconfont" title="人气">&#xe60b;</i> 106
            </span>
          </p>
        </li>
        <li class="fly-list-li">
          <a href="user/home.html" class="fly-list-avatar">
            <img src="resources/images/avatar/default.png" alt="">
          </a>
          <h2 class="fly-tip">
            <a href="jie/detail.html">关于layui 引用其他插件，扩展模块 的用法</a>
          </h2>
          <p>
            <span><a href="user/home.html">用户昵称</a></span>
            <span>1小时前</span>
            <span>layui框架综合</span>
            <span class="fly-list-hint"> 
              <i class="iconfont" title="回答">&#xe60c;</i> 8
              <i class="iconfont" title="人气">&#xe60b;</i> 106
            </span>
          </p>
        </li>
        <li class="fly-list-li">
          <a href="user/home.html" class="fly-list-avatar">
            <img src="resources/images/avatar/default.png" alt="">
          </a>
          <h2 class="fly-tip">
            <a href="jie/detail.html">关于layui 引用其他插件，扩展模块 的用法</a>
          </h2>
          <p>
            <span><a href="user/home.html">用户昵称</a></span>
            <span>1小时前</span>
            <span>layui框架综合</span>
            <span class="fly-list-hint"> 
              <i class="iconfont" title="回答">&#xe60c;</i> 8
              <i class="iconfont" title="人气">&#xe60b;</i> 106
            </span>
          </p>
        </li>
        <li class="fly-list-li">
          <a href="user/home.html" class="fly-list-avatar">
            <img src="resources/images/avatar/default.png" alt="">
          </a>
          <h2 class="fly-tip">
            <a href="jie/detail.html">关于layui 引用其他插件，扩展模块 的用法</a>
          </h2>
          <p>
            <span><a href="user/home.html">用户昵称</a></span>
            <span>1小时前</span>
            <span>layui框架综合</span>
            <span class="fly-list-hint"> 
              <i class="iconfont" title="回答">&#xe60c;</i> 8
              <i class="iconfont" title="人气">&#xe60b;</i> 106
            </span>
          </p>
        </li>
        <li class="fly-list-li">
          <a href="user/home.html" class="fly-list-avatar">
            <img src="resources/images/avatar/default.png" alt="">
          </a>
          <h2 class="fly-tip">
            <a href="jie/detail.html">关于layui 引用其他插件，扩展模块 的用法</a>
          </h2>
          <p>
            <span><a href="user/home.html">用户昵称</a></span>
            <span>1小时前</span>
            <span>layui框架综合</span>
            <span class="fly-list-hint"> 
              <i class="iconfont" title="回答">&#xe60c;</i> 8
              <i class="iconfont" title="人气">&#xe60b;</i> 106
            </span>
          </p>
        </li>
        <li class="fly-list-li">
          <a href="user/home.html" class="fly-list-avatar">
            <img src="resources/images/avatar/default.png" alt="">
          </a>
          <h2 class="fly-tip">
            <a href="jie/detail.html">关于layui 引用其他插件，扩展模块 的用法</a>
          </h2>
          <p>
            <span><a href="user/home.html">用户昵称</a></span>
            <span>1小时前</span>
            <span>layui框架综合</span>
            <span class="fly-list-hint"> 
              <i class="iconfont" title="回答">&#xe60c;</i> 8
              <i class="iconfont" title="人气">&#xe60b;</i> 106
            </span>
          </p>
        </li>
      </ul>
      
      <div style="text-align: center">
        <div class="laypage-main">
          <a href="jie/index.html" class="laypage-next">更多求解</a>
        </div>
      </div>
      
    </div>
  </div>
  
  <div class="edge">
    <div class="fly-panel leifeng-rank"> 
      <h3 class="fly-panel-title">近一月回答榜 - TOP 12</h3>
      <dl>
        <dd>
          <a href="user/home.html">
            <img src="resourcesources/images/avatar/default.png">
            <cite>纸飞机</cite>
            <i>159次回答</i>
          </a>
        </dd>
        <dd>
          <a href="user/home.html">
            <img src="resources/images/avatar/default.png">
            <cite>纸飞机</cite>
            <i>159次回答</i>
          </a>
        </dd>
        <dd>
          <a href="user/home.html">
            <img src="resources/images/avatar/default.png">
            <cite>纸飞机</cite>
            <i>159次回答</i>
          </a>
        </dd>
        <dd>
          <a href="user/home.html">
            <img src="resources/images/avatar/default.png">
            <cite>纸飞机</cite>
            <i>159次回答</i>
          </a>
        </dd>
        <dd>
          <a href="user/home.html">
            <img src="resources/images/avatar/default.png">
            <cite>纸飞机</cite>
            <i>159次回答</i>
          </a>
        </dd>
        <dd>
          <a href="user/home.html">
            <img src="resources/images/avatar/default.png">
            <cite>纸飞机</cite>
            <i>159次回答</i>
          </a>
        </dd>
        <dd>
          <a href="user/home.html">
            <img src="resources/images/avatar/default.png">
            <cite>纸飞机</cite>
            <i>159次回答</i>
          </a>
        </dd>
        <dd>
          <a href="user/home.html">
            <img src="resources/images/avatar/default.png">
            <cite>纸飞机</cite>
            <i>159次回答</i>
          </a>
        </dd>
        <dd>
          <a href="user/home.html">
            <img src="resources/images/avatar/default.png">
            <cite>纸飞机</cite>
            <i>159次回答</i>
          </a>
        </dd>
        <dd>
          <a href="user/home.html">
            <img src="resources/images/avatar/default.png">
            <cite>纸飞机</cite>
            <i>159次回答</i>
          </a>
        </dd>
        <dd>
          <a href="user/home.html">
            <img src="resources/images/avatar/default.png">
            <cite>纸飞机</cite>
            <i>159次回答</i>
          </a>
        </dd>
        <dd>
          <a href="user/home.html">
            <img src="resources/images/avatar/default.png">
            <cite>纸飞机</cite>
            <i>159次回答</i>
          </a>
        </dd>
      </dl>
    </div>
    
    <dl class="fly-panel fly-list-one"> 
      <dt class="fly-panel-title">最近热帖</dt>
      <dd>
        <a href="jie/detail.html">使用 layui 秒搭后台大布局（基本结构）</a>
        <span><i class="iconfont">&#xe60b;</i> 6087</span>
      </dd>
      <dd>
        <a href="jie/detail.html">Java实现LayIM后端的核心代码</a>
        <span><i class="iconfont">&#xe60b;</i> 767</span>
      </dd>
      <dd>
        <a href="jie/detail.html">使用 layui 秒搭后台大布局（基本结构）</a>
        <span><i class="iconfont">&#xe60b;</i> 6087</span>
      </dd>
      <dd>
        <a href="jie/detail.html">Java实现LayIM后端的核心代码</a>
        <span><i class="iconfont">&#xe60b;</i> 767</span>
      </dd>
      <dd>
        <a href="jie/detail.html">使用 layui 秒搭后台大布局（基本结构）</a>
        <span><i class="iconfont">&#xe60b;</i> 6087</span>
      </dd>
      <dd>
        <a href="jie/detail.html">Java实现LayIM后端的核心代码</a>
        <span><i class="iconfont">&#xe60b;</i> 767</span>
      </dd>
      <dd>
        <a href="jie/detail.html">使用 layui 秒搭后台大布局（基本结构）</a>
        <span><i class="iconfont">&#xe60b;</i> 6087</span>
      </dd>
      <dd>
        <a href="jie/detail.html">Java实现LayIM后端的核心代码</a>
        <span><i class="iconfont">&#xe60b;</i> 767</span>
      </dd>
    </dl>
    
    <dl class="fly-panel fly-list-one"> 
      <dt class="fly-panel-title">近期热议</dt>
      <dd>
        <a href="jie/detail.html">使用 layui 秒搭后台大布局之基本结构</a>
        <span><i class="iconfont">&#xe60c;</i> 96</span>
      </dd>
      <dd>
        <a href="jie/detail.html">使用 layui 秒搭后台大布局之基本结构</a>
        <span><i class="iconfont">&#xe60c;</i> 96</span>
      </dd>
      <dd>
        <a href="jie/detail.html">使用 layui 秒搭后台大布局之基本结构</a>
        <span><i class="iconfont">&#xe60c;</i> 96</span>
      </dd>
      <dd>
        <a href="jie/detail.html">使用 layui 秒搭后台大布局之基本结构</a>
        <span><i class="iconfont">&#xe60c;</i> 96</span>
      </dd>
      <dd>
        <a href="jie/detail.html">使用 layui 秒搭后台大布局之基本结构</a>
        <span><i class="iconfont">&#xe60c;</i> 96</span>
      </dd>
      <dd>
        <a href="jie/detail.html">使用 layui 秒搭后台大布局之基本结构</a>
        <span><i class="iconfont">&#xe60c;</i> 96</span>
      </dd>
      <dd>
        <a href="jie/detail.html">使用 layui 秒搭后台大布局之基本结构</a>
        <span><i class="iconfont">&#xe60c;</i> 96</span>
      </dd>
      <dd>
        <a href="jie/detail.html">使用 layui 秒搭后台大布局之基本结构</a>
        <span><i class="iconfont">&#xe60c;</i> 96</span>
      </dd>
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
<script src="resources/layui/layui.js"></script>
<script>
layui.cache.page = '';
layui.cache.user = {
  username: '游客'
  ,uid: -1
  ,avatar: 'resources/images/avatar/00.jpg'
  ,experience: 83
  ,sex: '男'
};
layui.config({
  version: "2.0.0"
  ,base: 'resources/mods/'
}).extend({
  fly: 'index'
}).use('fly');
</script>

</body>
</html>