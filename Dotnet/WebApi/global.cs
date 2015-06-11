using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Ninject;
using Ninject.Modules;
using System.Web.Http.Validation.Providers;



    // visit http://go.microsoft.com/?LinkId=9394801   IIS6 or IIS7 classic mode

    public class WebApiApplication :System.Web.HttpApplication
    {
        public override void Init()
        {
            this.PostAuthenticateRequest += this.PostAuthenticateRequestHandler;
            base.Init();
        }
        private void PostAuthenticateRequestHandler(object sender, EventArgs e)
        {
            SecurityHandler security = (SecurityHandler)GlobalConfiguration.Configuration.DependencyResolver.GetService(typeof(SecurityHandler));
            security.SetAuthCookie(this.Context);
        }
        protected void Application_Start()
        {
            ModelMapper.Configure();
            AreaRegistration.RegisterAllAreas();

            var kernel = WebApiConfig.Register(GlobalConfiguration.Configuration);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            
            //http://stephenwalther.com/archive/2012/03/05/introduction-to-the-asp-net-web-api.aspx
            //http://www.strathweb.com/2012/10/clean-up-your-web-api-controllers-with-model-validation-and-null-check-filters/

            GlobalConfiguration.Configuration.Filters.Add(new ValidateModelStateAttribute());
           
            //http://stackoverflow.com/questions/12305784/dataannotation-for-required-property
            GlobalConfiguration.Configuration.Services.RemoveAll(typeof(System.Web.Http.Validation.ModelValidatorProvider), v => v is InvalidModelValidatorProvider);
        }
    }
