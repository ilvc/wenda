<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

{{# var title = d.getPass === 1 ? 'éç½®å¯ç ' : 'æ¾åå¯ç '; }}

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0,minimal-ui"> 
<meta name="apple-mobile-web-app-status-bar-style" content="black"> 
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="format-detection" content="telephone=no"> 
<title>{{title}} - {{lay.base.name}}</title>
{{ include ../common/link }}
</head>
<body>

{{ include ../common/header }}

<div class="main layui-clear">

  <div class="fly-panel fly-panel-user" pad20>
    <div class="layui-tab layui-tab-brief" lay-filter="user">
      <ul class="layui-tab-title">
        <li class="layui-this">{{title}}</li>
      </ul>
      <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
        <div class="layui-tab-item layui-show">
          {{# if(d.getPass === 1){}}
          <div class="fly-msg">{{d.username}}ï¼è¯·éç½®æ¨çå¯ç </div>
          <div class="layui-form layui-form-pane"  style="margin-top: 30px;">
            <form action="/user/repass" method="post">
              <div class="layui-form-item">
                <label for="L_pass" class="layui-form-label">å¯ç </label>
                <div class="layui-input-inline">
                  <input type="password" id="L_pass" name="pass" required lay-verify="required" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">6å°16ä¸ªå­ç¬¦</div>
              </div>
              <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label">ç¡®è®¤å¯ç </label>
                <div class="layui-input-inline">
                  <input type="password" id="L_repass" name="repass" required lay-verify="required" autocomplete="off" class="layui-input">
                </div>
              </div>
              <div class="layui-form-item">
                <label for="L_vercode" class="layui-form-label">äººç±»éªè¯</label>
                <div class="layui-input-inline">
                  <input type="text" id="L_vercode" name="vercode" required lay-verify="required" placeholder="è¯·åç­åé¢çé®é¢" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid">
                  <span style="color: #c00;">{{d.vercode}}</span>
                </div>
              </div>
              <div class="layui-form-item">
                <input type="hidden" name="username" value="{{d.username}}">
                <input type="hidden" name="email" value="{{d.email}}">
                <button class="layui-btn" alert="1" lay-filter="*" lay-submit>æäº¤</button>
              </div>
            </form>
          </div>
          {{# } else { }}

          {{# if(d.getPass === 2){ }}
          <div class="fly-error">è¯¥éç½®å¯ç é¾æ¥å·²å¤±æï¼è¯·éæ°æ ¡éªæ¨çä¿¡æ¯</div>
          {{# } else if(d.getPass === 3){ }}
          <div class="fly-error">éæ³é¾æ¥ï¼è¯·éæ°æ ¡éªæ¨çä¿¡æ¯</div>
          {{# } }}
          
          <div class="layui-form layui-form-pane">
            <form method="post">
              <div class="layui-form-item">
                <label for="L_email" class="layui-form-label">é®ç®±</label>
                <div class="layui-input-inline">
                  <input type="text" id="L_email" name="email" required lay-verify="required" autocomplete="off" class="layui-input">
                </div>
              </div>
              <div class="layui-form-item">
                <label for="L_vercode" class="layui-form-label">äººç±»éªè¯</label>
                <div class="layui-input-inline">
                  <input type="text" id="L_vercode" name="vercode" required lay-verify="required" placeholder="è¯·åç­åé¢çé®é¢" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid">
                  <span style="color: #c00;">{{d.vercode}}</span>
                </div>
              </div>
              <div class="layui-form-item">
                <button class="layui-btn" alert="1" lay-filter="*" lay-submit>æäº¤</button>
              </div>
            </form>
          </div>
          
          {{# } }}
        </div>
      </div>
    </div>
  </div>

  
</div>

{{ include ../common/footer }}

</body>
</html>