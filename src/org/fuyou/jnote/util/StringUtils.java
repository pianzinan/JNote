package org.fuyou.jnote.util;

import org.apache.commons.lang.StringEscapeUtils;
import org.fuyou.jnote.controller.ArticleController;

import com.jfinal.log.Logger;

public class StringUtils
{
	private static final Logger logger = Logger.getLogger(ArticleController.class);
	
	public static String unescapeHtml(String text)
	{
		if (text == null)
		{
			return "";
		}
		
		logger.info(text);
		text = StringEscapeUtils.unescapeHtml(text);
		logger.info(text);
		return text;
	}

	public static String escapeHtml(String text)
	{
		if (text == null)
		{
			return "";
		}

		logger.info(text);
		text = StringEscapeUtils.escapeHtml(text);
		logger.info(text);

		return text;
	}
}
