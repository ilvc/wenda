package me.ilvc.wenda.util;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class DESUtil {
	
	private static byte[] crypt(byte[] data, byte[] key, int mode) throws Exception {
		// 生成一个可信任的随机数源
		SecureRandom sr = new SecureRandom();
		// 从原始密钥数据创建DESKeySpec对象
		DESKeySpec dks = new DESKeySpec(key);
		// 创建一个密钥工厂，然后用它把DESKeySpec转换成SecretKey对象
		SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
		SecretKey securekey = keyFactory.generateSecret(dks);
		// Cipher对象实际完成解密操作
		Cipher cipher = Cipher.getInstance("DES");
		// 用密钥初始化Cipher对象
		cipher.init(mode, securekey, sr);
		return cipher.doFinal(data);
	}
	
	/**
	 * DES解密
	 * @param 密文
	 * @return 明文
	 */
	public static String decryptString(String key, String data){
		if (data == null || "".equals(data))
            return "";
		String str=null;
		try {
			str=new String(crypt(new BASE64Decoder().decodeBuffer(data), key.getBytes(),Cipher.DECRYPT_MODE));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return str;
	}
	
	/**
	 * 加密
	 * @param 明文
	 * @return 密文
	 */
	@SuppressWarnings("restriction")
	public static String encryptString(String key, String data){
        if(data==null || "".equals(data))
        	return "";
		String str=null;
        try {
			str=new BASE64Encoder().encode(crypt(data.getBytes(), key.getBytes(), Cipher.ENCRYPT_MODE));
		} catch (Exception e) {
			e.printStackTrace();
		}
        return str;
	}
	
	public static void main(String[] args) {
		/*String miwen = DESUtil.encryptString("10001", "ilvc");
		System.out.println(miwen);
		System.out.println(DESUtil.decryptString(miwen, "ilvc"));*/
		
		 String md5 = getMD5("10001");
	        System.out.println(md5);
	        
	    
	}
	
	
	 public static String getMD5(String str) {
	        try {
	            // 生成一个MD5加密计算摘要
	            MessageDigest md = MessageDigest.getInstance("MD5");
	            // 计算md5函数
	            md.update(str.getBytes());
	   //         System.out.println("aaaaaaaaaaaaaaa:"+str);
	    //        System.out.println("aaaaaaaaaaaaaaa:"+md.digest());
	            // digest()最后确定返回md5 hash值，返回值为8为字符串。因为md5 hash值是16位的hex值，实际上就是8位的字符
	            // BigInteger函数则将8位的字符串转换成16位hex值，用字符串来表示；得到字符串形式的hash值
	            return new BigInteger(1, md.digest()).toString(16);
	        } catch (Exception e) {
	            e.printStackTrace();
	            return str;
	        }
	    }
	 
	 /**利用MD5进行加密
	     * @param str  待加密的字符串
	     * @return  加密后的字符串
	     * @throws NoSuchAlgorithmException  没有这种产生消息摘要的算法
	     * @throws UnsupportedEncodingException  
	     */
	    public String EncoderByMd5(String str) throws NoSuchAlgorithmException, UnsupportedEncodingException{
	        //确定计算方法
	        MessageDigest md5=MessageDigest.getInstance("MD5");
	        BASE64Encoder base64en = new BASE64Encoder();
	        //加密后的字符串
	        String newstr=base64en.encode(md5.digest(str.getBytes("utf-8")));
	        return newstr;
	    }
	 
}
