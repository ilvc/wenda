package me.ilvc.wenda.controller;


import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;

import me.ilvc.wenda.dto.Result;
import me.ilvc.wenda.dto.UpImgResult;
import me.ilvc.wenda.model.User;
import me.ilvc.wenda.service.UserService;
import me.ilvc.wenda.util.DESUtil;
import me.ilvc.wenda.util.ResponseUtil;

	

@Controller
public class UploadController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/uploadfile",method=RequestMethod.POST)
	public String upload(HttpServletRequest request, HttpServletResponse response,  MultipartFile attach){
		String rootPath = request.getSession().getServletContext().getRealPath("/resources/upload/");
		response.setHeader( "Content-Type" , "text/html" );
		ModelAndView mv = new ModelAndView();
		UpImgResult result = new UpImgResult();
		try {
			File filePath=new File(rootPath);		
			/**
			 * 文件路径不存在则需要创建文件路径
			 */
			if(!filePath.exists()){
				filePath.mkdirs();
			}
		
			//最终文件名
	        File realFile=new File(rootPath + File.separator + UUID.randomUUID().toString() + ".jpg");
	        FileUtils.copyInputStreamToFile(attach.getInputStream(), realFile);
	        System.out.println(realFile);
			
	       // mv.addObject("success", 1);
	        result.setSuccess(1);
		//	mv.addObject("message", "上传成功");
	        result.setMessage("上传成功");
			result.setUrl(realFile.getName());

			//mv.addObject("fileName", realFile.getName());
		} catch (Exception e) {
			result.setSuccess(0);
			e.printStackTrace();
		//	mv.addObject("success", 0);
		//	mv.addObject("message", "上传失败，异常信息：" + e.getMessage());
			 result.setMessage( "上传失败，异常信息：" + e.getMessage());
		}
		System.out.println("UploadController：图片上传....");
		
		String gsonString = new Gson().toJson(result);  
		try {
			ResponseUtil.write(gsonString,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	 @ResponseBody
	 @RequestMapping("/upload")  
	    public String upload( MultipartFile file,HttpServletRequest request,HttpServletResponse response) throws IOException  
	    {  
		 UpImgResult result = new UpImgResult();
		 
	      //如果只是上传一个文件，则只需要MultipartFile类型接收文件即可，而且无需显式指定@RequestParam注解   
	        //如果想上传多个文件，那么这里就要用MultipartFile[]类型来接收文件，并且还要指定@RequestParam注解   
	        //并且上传多个文件时，前台表单中的所有<input type="file"/>的name都应该是myfiles，否则参数里的myfiles无法获取到所有上传的文件   
	          
	       /* for(MultipartFile myfile : myfiles){*/   
	            if(file.isEmpty()){   
	                System.out.println("文件未上传");   
	            }else{   
	                System.out.println("文件长度: " + file.getSize());   
	                System.out.println("文件类型: " + file.getContentType());   
	                System.out.println("文件名称: " + file.getName());   
	                System.out.println("文件原名: " + file.getOriginalFilename());   
	                System.out.println("========================================");   
	                //如果用的是Tomcat服务器，则文件会上传到  
	//{服务发布位置}\\WEB-INF\\upload\\文件夹中   
	                String realPath = request.getSession().getServletContext().getRealPath("/resources/upload/");  
	                //这里不必处理IO流关闭的问题，因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉，我是看它的源码才知道的   
	                FileUtils.copyInputStreamToFile(file.getInputStream(), new File(realPath, file.getOriginalFilename()));   
	            }   
	        /*}   */
	            result.setUrl("http://ol5smga16.bkt.clouddn.com/17-6-7/72452903.jpg");
	            String gsonString = new Gson().toJson(result);  
	    		try {
	    			ResponseUtil.write(gsonString,response);
	    		} catch (Exception e) {
	    			// TODO Auto-generated catch block
	    			e.printStackTrace();
	    		}
	            
	        return null;  
	    }  
	
	
	/**
	 * 七牛上传令牌获取
	 * @return
	 * @throws JblogException 
	 */
	
	@RequestMapping(value="/getQiniuToken",method=RequestMethod.POST)
	public String qiniu(MultipartFile file, HttpServletResponse response) {
		Result result1 = new Result();
		
		
	   Auth auth = Auth.create("u0Tk_hKZXbQHpSNxKei7R-XTnd3nBsqaFh9FFDnJ","CagYfRYJtK6X8SoSJ7QqzwNSWmQkDfPRNEIPKxaQ");
		String token = auth.uploadToken(
			"blogimg",	//空间名称
			null,			//key，最终资源名称，一般为空，让服务器自己生成
			3600,			//3600秒，上传时限
			new StringMap()	//其他上传策略
				.put("saveKey", UUID.randomUUID().toString() + "$(ext)")
		);
		System.out.println(token);
		result1.setResultCode(Result.SUCCESS);
		result1.setMessage("上传成功!");
		result1.setData( token);
		String result = new Gson().toJson(result1);
		try {
			ResponseUtil.write(result, response);
			System.out.println("已经返回了数据。。。。");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	    
	}
	
	@RequestMapping(value="/qiuniuupload",method=RequestMethod.POST)
	public void testQiuNiu(MultipartFile file,HttpServletRequest request,HttpServletResponse response) throws Exception{
		 UpImgResult result = new UpImgResult();
		User user = (User) request.getSession().getAttribute("currentUser");
		
		//构造一个带指定Zone对象的配置类
		Configuration cfg = new Configuration(Zone.autoZone());
		//...其他参数参考类注释
		UploadManager uploadManager = new UploadManager(cfg);
		//...生成上传凭证，然后准备上传
		String accessKey = "u0Tk_hKZXbQHpSNxKei7R-XTnd3nBsqaFh9FFDnJ";
		String secretKey = "CagYfRYJtK6X8SoSJ7QqzwNSWmQkDfPRNEIPKxaQ";
		String bucket = "blogimg";
		//默认不指定key的情况下，以文件内容的hash值作为文件名
		String key = null;
		/*  byte[] uploadBytes = "hello qiniu cloud".getBytes("utf-8");
		    ByteArrayInputStream byteInputStream=new ByteArrayInputStream(uploadBytes);*/
		    Auth auth = Auth.create(accessKey, secretKey);
		    String upToken = auth.uploadToken(bucket);
		    Response qresponse;
			try {
				qresponse = uploadManager.put(file.getInputStream(),key,upToken,null, null);
				//解析上传成功的结果
			    DefaultPutRet putRet = new Gson().fromJson(qresponse.bodyString(), DefaultPutRet.class);
			    System.out.println(putRet.key);
			    System.out.println(putRet.hash);
			    result.setUrl("http://ooprvk5m6.bkt.clouddn.com/"+putRet.key);
			    String gsonString = new Gson().toJson(result);
			    user.setAvtar("http://ooprvk5m6.bkt.clouddn.com/"+putRet.key);
			    userService.update(user);
			    request.getSession().setAttribute("currentUser",userService.findUser(user));
			    ResponseUtil.write(gsonString,response);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		
	}
	
	
	
	
}
