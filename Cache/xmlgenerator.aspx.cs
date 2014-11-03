using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class xmlgenerator : System.Web.UI.Page
{




    protected void Page_Load(object sender, EventArgs e)
    {

        Response.ContentType = "text/xml";
        Response.Clear();

        TimeSpan expires = TimeSpan.FromSeconds(10);
        this.Response.Cache.SetMaxAge(expires);
        this.Response.Cache.SetCacheability(HttpCacheability.Server);
        this.Response.Cache.SetValidUntilExpires(true);
        generateXml();

    }

    private void generateXml()
    {
        XDocument xDoc = new XDocument(new XDeclaration("1.0", "utf-8", "yes"),
            new XElement("book"
                , new XElement("TITLE", new XCData("demo for cache"))
                , new XElement("quantity", new XCData("1"))
, new XElement("field", new XCData("computer web programming"))
        , new XElement("level", new XCData("beginner"))
                , new XComment(string.Format("this response generated at {0}", DateTime.Now))));

        xDoc.Save(Response.Output);


    }
}