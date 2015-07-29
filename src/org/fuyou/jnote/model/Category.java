package org.fuyou.jnote.model;

import com.jfinal.plugin.activerecord.Model;

/**   
 * @Title: Category.java 
 * @Package org.fuyou.jnote.model 
 * @Description: TODO(用一句话描述该文件做什么) 
 * @author Wild Coder
 * @email 1023400273@qq.com 
 * @date 2015年7月29日 上午11:55:30 
 * @version V1.0   
 */
public class Category extends Model<Category>
{
	private static final long serialVersionUID = 1L;
	
	public static final Category dao = new Category();
	
	public static final String TABLE_NAME = "t_category";
	
	public static final String COL_ID = "id";
	public static final String COL_NAME = "name";
	
}
