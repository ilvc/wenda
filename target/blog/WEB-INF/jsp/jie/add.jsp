<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>{{d.edit ? '编辑问题' : '发表问题'}} </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/layui/css/layui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
</head>
<body>

 <jsp:include page="../common/header.jsp"/>
<div class="main layui-clear">
  <div class="fly-panel" pad20>
    <h2 class="page-title">{{d.edit ? '编辑问题' : '发表问题'}}</h2>
  
   <!--  <div class="fly-none">并无权限</div> -->
   
    <div class="layui-form layui-form-pane">
      <form action="{{d.edit ? '/jie/edit/' : ''}}" method="post">
        <div class="layui-form-item">
          <label for="L_title" class="layui-form-label">标题</label>
          <div class="layui-input-block">
        
            <input type="text" id="L_title" name="title" required lay-verify="required" autocomplete="off" value="{{d.edit.title}}"  title="标题不可修改" class="layui-input">
            <input type="hidden" name="id" value="{{d.edit.id}}">
  
           <!--  <input type="text" id="L_title" name="title" required lay-verify="required" autocomplete="off" class="layui-input"> -->
   
          </div>
        </div>
        <div class="layui-form-item layui-form-text">
          <div class="layui-input-block">
            <textarea id="L_content" name="content" required lay-verify="required" placeholder="请输入内容" class="layui-textarea fly-editor" style="height: 260px;">{{d.edit ? d.edit.content : ''}}</textarea>
          </div>
          <label for="L_content" class="layui-form-label" style="top: -2px;">描述</label>
        </div>
        <div class="layui-form-item">
          <div class="layui-inline">
            <label class="layui-form-label">所在类别</label>
            <div class="layui-input-block">
              <select lay-verify="required" name="class">
                <option></option>
                <optgroup label="Layui相关">
             
                  <option value="{{ key }}" {{(d.edit && d.edit['class'] == key) ? 'selected' : ''}}>{{ lay.base.classes[key] }}</option>
              
                </optgroup>
                <optgroup label="其它交流">
              
             
                  <option value="{{ key }}" {{(d.edit && d.edit['class'] == key) ? 'selected' : ''}}>{{ lay.base.classes[key] }}</option>
               
                </optgroup>
              </select>
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">悬赏飞吻</label>
            <div class="layui-input-block">
              <select name="experience">
                <option value="5" {{(d.edit && d.edit.experience == 5) ? 'selected' : ''}}>5</option>
                <option value="20" {{(d.edit && d.edit.experience == 20) ? 'selected' : ''}}>20</option>
                <option value="50" {{(d.edit && d.edit.experience == 50) ? 'selected' : ''}}>50</option>
                <option value="100" {{(d.edit && d.edit.experience == 100) ? 'selected' : ''}}>100</option>
              </select>
            </div>
          </div>
        </div>
        <div class="layui-form-item">
          <label for="L_vercode" class="layui-form-label">人类验证</label>
          <div class="layui-input-inline">
            <input type="text" id="L_vercode" name="vercode" required lay-verify="required" placeholder="请回答后面的问题" autocomplete="off" class="layui-input">
          </div>
          <div class="layui-form-mid">
            <span style="color: #c00;">{{d.vercode}}</span>
          </div>
        </div>
        <div class="layui-form-item">
          <button class="layui-btn" lay-filter="*" lay-submit>立即发布</button>
        </div>
      </form>
    </div>
   
  </div>

</div>
 <jsp:include page="../common/footer.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
 	<script>
		layui.use('layedit', function(){
		  var layedit = layui.layedit;
		  // layedit.build('L_content'); //建立编辑器
		  
		  layedit.build('L_content', {
			  height: 380 //设置编辑器高度
			});
					  
		
		});
		</script>
</body>
</html>