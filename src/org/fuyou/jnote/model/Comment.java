package org.fuyou.jnote.model;

import com.jfinal.plugin.activerecord.Model;

/**   
 * @Title: Article.java 
 * @Package org.fuyou.jnote.model 
 * @Description: TODO(用一句话描述该文件做什么) 
 * @author Wild Coder
 * @email 1023400273@qq.com 
 * @date 2015年7月29日 下午12:25:38 
 * @version V1.0   
 */
public class Comment extends Model<Comment>
{
	private static final long serialVersionUID = 1L;
	
	public static final Comment dao = new Comment();
	
	public static final String TABLE_NAME = "t_comment";
	
	public static final String COL_ID = "id";
	public static final String COL_USERNAME = "username";
	public static final String COL_CONTACT = "contact";
	public static final String COL_MESSAGE = "message";
	public static final String COL_POST_TIME = "post_time";
	public static final String COL_ARTICLE_ID = "article_id";
}
