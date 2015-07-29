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
public class Article extends Model<Article>
{
	private static final long serialVersionUID = 1L;
	
	public static final Article dao = new Article();
	
	public static final String TABLE_NAME = "t_article";
	
	public static final String COL_ID = "id";
	public static final String COL_NAME = "title";
	public static final String COL_MARKDOWN = "markdown";
	public static final String COL_HTML = "html";
	public static final String COL_POST_TIME = "post_time";
	public static final String COL_CATEGORY_ID = "category_id";
	public static final String COL_TAGS = "tags";
}
