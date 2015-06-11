  public static class WebApiConfig
    {


        public static StandardKernel Register(HttpConfiguration config)
        {
            var kernel = new StandardKernel();
            Register(config, kernel);
            return kernel;
        }

        public static void Register(HttpConfiguration config, IKernel kernel)
        {
            config.Formatters.JsonFormatter.MediaTypeMappings.Add(new UriPathExtensionMapping("json", "application/json"));
            // config.Formatters.XmlFormatter.MediaTypeMappings.Add(new UriPathExtensionMapping("xml", "application/xml"));
            config.Formatters.Remove(config.Formatters.XmlFormatter);


            config.Formatters.Insert(0, new JsonpMediaTypeFormatter());