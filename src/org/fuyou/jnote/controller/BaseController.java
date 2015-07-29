package org.fuyou.jnote.controller;

import java.util.ArrayList;
import java.util.List;

import org.fuyou.jnote.bean.Constants;
import org.fuyou.jnote.model.Category;

import com.jfinal.core.Controller;
import com.jfinal.ext.render.CaptchaRender;

/**
 * @Title: BaseController.java
 * @Package org.fuyou.jnote.controller
 * @Description: TODO(用一句话描述该文件做什么)
 * @author Wild Coder
 * @email 1023400273@qq.com
 * @date 2015年7月29日 下午12:39:15
 * @version V1.0
 */
public class BaseController extends Controller
{
	private static List<Category> categorys = new ArrayList<Category>();
	/**
	 * 随机码生成字典
	 */
	private static final String[] authCodeArray =
	{ "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "J", "K", "M", "N", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y" };

	public void captcha()
	{
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i < 4; i++)
		{
			buffer.append(authCodeArray[Constants.RANDOM.nextInt(authCodeArray.length)]);
		}
		CaptchaRender img = new CaptchaRender(buffer.toString());
		render(img);

	}

	@Override
	public void render(String view)
	{
		setAttr("ctx", Constants.contextPath);
		setAttr("categorys", getCategorys());
		super.render("/WEB-INF/views" + view);
	}

	public static List<Category> getCategorys()
	{
		if (categorys.size() > 0)
		{
			return categorys;
		}

		categorys = Category.dao.find("select * from " + Category.TABLE_NAME);
		return categorys;
	}

}
