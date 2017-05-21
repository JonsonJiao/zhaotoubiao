package interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class SessionInterceptor extends AbstractInterceptor{
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext con = invocation.getInvocationContext();
		Map<String, Object> session =con.getSession();
		String user = (String) session.get("User");
		if(user==null){
			return "login";
		}else{
			return invocation.invoke();
		}
		
	}
}
