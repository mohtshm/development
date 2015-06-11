 public class AllowCrossSiteJsonFilter : System.Web.Mvc.ActionFilterAttribute
    {
        
            public override void OnActionExecuting(ActionExecutingContext filterContext)
            {
                filterContext.RequestContext.HttpContext.Response.AddHeader("Access-Control-Allow-Origin", "*");
                base.OnActionExecuting(filterContext);
            }
        
    }