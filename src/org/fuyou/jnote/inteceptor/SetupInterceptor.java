package org.fuyou.jnote.inteceptor;

import org.fuyou.jnote.controller.BaseController;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;

public class SetupInterceptor implements Interceptor
{
	@Override
	public void intercept(ActionInvocation invocation)
	{
		BaseController baseController = (BaseController)invocation.getController();
		if(baseController.isSetup())
		{
			invocation.invoke();
			
		}else
		{
			baseController.setup();
		}
	}
}
