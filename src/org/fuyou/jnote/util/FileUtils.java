package org.fuyou.jnote.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class FileUtils
{
	public static String loadString(InputStream is,String charset)
	{
		String text = null;
		
		ByteArrayOutputStream baos = null;
		
		try
		{
			baos = new ByteArrayOutputStream();
			byte[] data = new byte[1024];
			int len = 0;
			while((len = is.read(data)) > 0)
			{
				baos.write(data, 0, len);
			}
			
			data = baos.toByteArray();
			
			text = new String(data, charset);
			
		} catch (Exception e)
		{
			e.printStackTrace();
			
		}finally
		{
			try
			{
				baos.close();
				
			} catch (IOException e)
			{
				e.printStackTrace();
			}
			
			baos = null;
		}
		
		
		
		return text;
	}
}
