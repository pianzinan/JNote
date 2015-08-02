package org.fuyou.jnote.bean;

import java.util.Random;

import com.jfinal.log.Logger;

/**   
 * @Title: Config.java 
 * @Package com.yuanyou.supermario.bean 
 * @Description: TODO(用一句话描述该文件做什么) 
 * @author Wild Coder
 * @email 1023400273@qq.com 
 * @date 2015年6月16日 上午11:44:15 
 * @version V1.0   
 */
public class Constants
{
	public static final Logger logger = Logger.getLogger(Constants.class);
	public static final Random RANDOM = new Random();
	public static String db_url = null;
	public static String db_user = null;
	public static String db_pwd = null;
	
	public static String charset = null;
	public static int pageSize = 20;
	
	
}
