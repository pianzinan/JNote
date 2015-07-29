package org.fuyou.jnote.beetl;

import java.io.IOException;

import org.apache.commons.lang.StringEscapeUtils;
import org.beetl.core.Context;
import org.beetl.core.Function;

public class EscapeHtml implements Function
{

	@Override
	public Object call(Object[] paras, Context ctx)
	{
		if (paras != null && paras.length > 0 && paras[0]!=null)
		{
			try
			{
				ctx.byteWriter.writeString(StringEscapeUtils.escapeHtml(paras[0].toString()));
			} catch (IOException e)
			{
				e.printStackTrace();
			}

		}

		return "";
	}

}
