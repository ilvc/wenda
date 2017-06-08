package me.ilvc.wenda.dao;

import static org.junit.Assert.fail;

import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;

import org.junit.Test;

import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;

public class QiuNiuUploadTest {

	
	/**
	 *  Auth auth = Auth.create("u0Tk_hKZXbQHpSNxKei7R-XTnd3nBsqaFh9FFDnJ","CagYfRYJtK6X8SoSJ7QqzwNSWmQkDfPRNEIPKxaQ");
	 * blogimg
	 */
	@Test 
	public void testQiuNiu(){
		
		//构造一个带指定Zone对象的配置类
		Configuration cfg = new Configuration(Zone.zone0());
		//...其他参数参考类注释
		UploadManager uploadManager = new UploadManager(cfg);
		//...生成上传凭证，然后准备上传
		String accessKey = "u0Tk_hKZXbQHpSNxKei7R-XTnd3nBsqaFh9FFDnJ";
		String secretKey = "CagYfRYJtK6X8SoSJ7QqzwNSWmQkDfPRNEIPKxaQ";
		String bucket = "blogimg";
		//默认不指定key的情况下，以文件内容的hash值作为文件名
		String key = null;
		try {
		    byte[] uploadBytes = "hello qiniu cloud".getBytes("utf-8");
		    ByteArrayInputStream byteInputStream=new ByteArrayInputStream(uploadBytes);
		    Auth auth = Auth.create(accessKey, secretKey);
		    String upToken = auth.uploadToken(bucket);
		    try {
		        Response response = uploadManager.put(byteInputStream,key,upToken,null, null);
		        //解析上传成功的结果
		        DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
		        System.out.println(putRet.key);
		        System.out.println(putRet.hash);
		    } catch (QiniuException ex) {
		        Response r = ex.response;
		        System.err.println(r.toString());
		        try {
		            System.err.println(r.bodyString());
		        } catch (QiniuException ex2) {
		            //ignore
		        }
		    }
		} catch (UnsupportedEncodingException ex) {
		    //ignore
		}
	}
	

}
