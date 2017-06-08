<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<!-- {{# 
var rows = d.rows;
}} -->



<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
<title>${question.questionTiltle } - iLvc社区</title>
<meta name="description" content="{{= d.description }}">

</head>
<body>

 <jsp:include page="../common/header.jsp"/>



<div class="main layui-clear">
  <div class="wrap">
    <div class="content detail">
      <div class="fly-panel detail-box">
        <h1>${question.questionTiltle }</h1>
        <div class="fly-tip fly-detail-hint" data-id="{{rows.id}}">
          
         <c:if test="${question.isStick==1 }">
	            	<span class="fly-tip-stick">置顶</span>
	            </c:if>
	         	<c:if test="${question.isJing==1 }">
	           		 <span class="fly-tip-jing">精帖</span>
	           	</c:if>
	           	<c:if test="${question.isAccept==0 }">
	           		   <span>未结贴</span>
	           	</c:if>
	           	<c:if test="${question.isAccept==1 }">
	           		    <span class="fly-tip-jie">已采纳</span>
	           	</c:if>
         
          	<c:if test="${currentUser.uid==quesiton.publishedUid }">
	           		  
        		  <span class="layui-btn layui-btn-mini jie-admin" type="del" style="margin-left: 20px;">删除</span>
	           	</c:if>
      
          <!-- 管理员权限操作  -->
         <!--  {{# if(user.auth == 1 || user.auth == 2){ }}
            {{# if(rows.stick > 0){ }}
              <span class="layui-btn layui-btn-mini jie-admin" type="set" field="stick" rank="0" style="background-color:#ccc;">取消置顶</span>
            {{# } else { }}
              <span class="layui-btn layui-btn-mini jie-admin" type="set" field="stick" rank="1">置顶</span> 
            {{# };
            if(rows.status == 1){ }}
              <span class="layui-btn layui-btn-mini jie-admin" type="set" field="status" rank="0" style="background-color:#ccc;">取消加精</span>
            {{# } else { }}
              <span class="layui-btn layui-btn-mini jie-admin" type="set" field="status" rank="1">加精</span> 
            {{# }; 
          } }} -->
          
          <div class="fly-list-hint"> 
            <i class="iconfont" title="回答">&#xe60c;</i> ${question.anwerCount}
            <i class="iconfont" title="人气">&#xe60b;</i>  ${question.viewCount}
          </div>
        </div>
        <div class="detail-about">
          <a class="jie-user" href="${pageContext.request.contextPath}/u/${question.user.username}">
            <img src="${question.user.avtar}" alt="${question.user.username}">
            <cite>
            	${question.user.username}
            
             <!-- VIP
               <em style="padding:0 5px; color: #FF7200;">{{ lay.util.vip(rows.user.rmb) > 99 ? 'SVIP' : ('VIP' + lay.util.vip(rows.user.rmb))}}</em>
              -->
              <em>发布于  <fmt:formatDate value="${question.addTime }" type="date" pattern="yyyy-MM-dd HH:mm"/></em>
             
            </cite>
          </a>
          <div class="detail-hits" id="LAY_jieAdmin" data-id="{{rows.id}}">

            <span style="color:#FF7200">悬赏： 10 飞吻</span>
            
           <c:if test="${currentUser.uid==quesiton.publishedUid }">           
             <span class="layui-btn layui-btn-mini jie-admin" type="edit"><a href="${pageContext.request.contextPath}/jie/edit/${question.questionId}">编辑此贴</a></span>
           </c:if>
           
              
          </div>
        </div>
        
        <div class="detail-body photos" style="margin-bottom: 20px;">
          ${question.questionContent }
        </div>
      </div>

     
      
      <div class="fly-panel detail-box" style="padding-top: 0;">
        <a name="comment"></a>

        <ul class="jieda photos" id="jieda">
      <!--   {{# jieda.forEach(function(item, index){ 
          var myda = item.user.username === user.username;
        }} -->
        <c:forEach var="qa" items="${question.qAnswer }">
        
        
       
          <li data-id="{{item.id}}" {{item.id == rows.accept ? 'class="jieda-daan"' : '' }}>
            <a name="item-{{item.time}}"></a>
            <div class="detail-about detail-about-reply">
              <a class="jie-user" href="${pageContext.request.contextPath}/u/${qa.formuser.username }">
                <img src="${qa.formuser.avtar }" alt="${qa.formuser.username }">
                <cite>
                  <i>${qa.formuser.username}</i>
                 <!--  {{# if(item.user.rmb) { }}
                  <em style="padding:0 ; color: #FF7200;">{{ lay.util.vip(item.user.rmb) > 99 ? 'SVIP' : ('VIP' + lay.util.vip(item.user.rmb))}}</em>
                  {{# } }} -->
                  <c:if test="${currentUser.uid==quesiton.publishedUid }">           
	                  <em>(楼主)</em>
          		  </c:if>
                  <!-- 
                  {{# } else if(item.user.auth == 1) { }}
                  <em style="color:#5FB878">(管理员)</em>
                  {{# } else if(item.user.auth == 2) { }}
                  <em style="color:#FF9E3F">（社区之光）</em>
                  {{# } else if(item.user.auth == -1) { }}
                  <em style="color:#999">（该号已被封）</em>
                  {{# } }} -->
                </cite>
              </a>
              <div class="detail-hits">
                <span><fmt:formatDate value="${qa.addTime }" type="date" pattern="yyyy-MM-dd HH:mm"/></span>
              </div>
              <c:if test="${qa.isAccept==1 }">           
            	  <i class="iconfont icon-caina" title="最佳答案"></i>
          	  </c:if>
            </div>
            <div class="detail-body jieda-body">
              	${qa.answerContent}
            </div>
            <div class="jieda-reply">
            <span class="jieda-zan {{d.session['zan'+item.id] ? 'zanok' : ''}}" type="zan">
              <i class="iconfont icon-zan"></i>
              <em>赞</em>
            </span>
            <span type="reply">
              <i class="iconfont icon-svgmoban53"></i> 回复 </span>
       <!--      {{# if(user.auth == 1 || user.auth == 2 || (user.username && myself && !myda)){ }} -->
             <c:if test="${currentUser.uid==quesiton.publishedUid }">           
              <div class="jieda-admin">
             <!--  {{# if(user.auth == 1 || (user.auth == 2 && item.accept != 1)){ }}
                <span type="edit">编辑</span>
                <span type="del">  删除 </span> -->
                <c:if test="${qa.isAccept==0 }">   
                	<span class="jieda-accept" type="accept">  采纳  </span>
               </c:if>
              <!-- {{# } else if(rows.accept == -1 && !myda){ }}
                <span class="jieda-accept" type="accept">  采纳  </span>
              {{# } }} -->
              </div>
            </c:if>
            </div>
          </li>
          </c:forEach>
        <c:if test="${question.qAnswer==null}">
          <li class="fly-none">没有任何回答</li>
        </c:if>
      
        </ul>


					<div class="fly-panel detail-box" style="padding-top: 0;">
						<ul class="jieda photos" id="jieda">
							<li data-id="36594"><a name="item-1496830707891"></a>
								<div class="detail-about detail-about-reply">
									<a class="jie-user" href=""> <img
										src="http://res.layui.com/images/fly/avatar/2.jpg" alt="狠狠亲一口"
										layer-index="3"> <cite> <i>狠狠亲一口</i>
									</cite>
									</a>
									<div class="detail-hits">
										<span>6小时前</span>
									</div>
								</div>
								<div class="detail-body jieda-body">换个浏览器试试</div>
								<div class="jieda-reply">
									<span class="jieda-zan " type="zan"> <i
										class="iconfont icon-zan"></i> <em>0</em>
									</span> <span type="reply"> <i class="iconfont icon-svgmoban53"></i>
										回复
									</span>
								</div></li>
						</ul>
						<div class="layui-form layui-form-pane">
							<form action="/jie/reply/" method="post">
								<div class="layui-form-item layui-form-text">
									<a name="comment"></a>
									<div class="layui-input-block">
										<div class="layui-unselect fly-edit">
											<span type="face" title="插入表情"><i
												class="iconfont icon-yxj-expression" style="top: 1px;"></i></span><span
												type="picture" title="插入图片：img[src]"><i
												class="iconfont icon-tupian"></i></span><span type="href"
												title="超链接格式：a(href)[text]"><i
												class="iconfont icon-lianjie"></i></span><span type="code"
												title="插入代码或引用"><i class="iconfont icon-emwdaima"
												style="top: 1px;"></i></span><span type="hr" title="插入水平线">hr</span><span
												type="yulan" title="预览"><i
												class="iconfont icon-yulan1"></i></span>
										</div>
										<textarea id="L_content" name="content" required=""
											lay-verify="required" placeholder="我要回答"
											class="layui-textarea fly-editor" style="height: 150px;"></textarea>
									</div>
								</div>
								<div class="layui-form-item">
									<input type="hidden" name="jid" value="10648"> <input
										type="hidden" name="daPages" value="1">
									<button class="layui-btn" lay-filter="*" lay-submit="">提交回答</button>
								</div>
							</form>
						</div>
					</div>

					<!--  <div class="layui-form layui-form-pane">
          <form action="/jie/reply/" method="post">
            <div class="layui-form-item layui-form-text">
              <div class="layui-input-block">
                <textarea id="L_content" name="content" required lay-verify="required" placeholder="我要{{myself ? '自问自答' : '回答'}}"  class="layui-textarea fly-editor" style="height: 150px;">{{d.edit ? d.edit.content : ''}}</textarea>
              </div>
            </div>
            <div class="layui-form-item">
              <input type="hidden" name="jid" value="{{rows.id}}">
              <input type="hidden" name="daPages" value="{{rows.jieda.pages}}">
              <button class="layui-btn" lay-filter="*" lay-submit>提交回答</button>
            </div>
          </form>
        </div> -->
      </div>

    </div>
  </div>
  <div class="edge">

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

 <!--    <div style="">
      <script type="text/javascript">
          /*336*280*/
          var cpro_id = "u2482656";
      </script>
      <script type="text/javascript" src="http://cpro.baidustatic.com/cpro/ui/c.js"></script>
    </div> -->
    
  </div>
</div>
	<c:if test="">
		<h2 class="page-title">404</h2>
		<div class="fly-none">该问题并不存在，可能已被删除</div>
	</c:if>



 <jsp:include page="../common/footer.jsp"/>
 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
 	<script>
		layui.use('layedit', function(){
		  var layedit = layui.layedit;
		  // layedit.build('L_content'); //建立编辑器
		  
		  layedit.build('L_content', {
			  height: 180 //设置编辑器高度
			});
					  
		
		});
		</script>
 
</body>
</html>