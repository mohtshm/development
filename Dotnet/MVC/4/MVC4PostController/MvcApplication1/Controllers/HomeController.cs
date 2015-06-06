using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcApplication1.Models;

namespace MvcApplication1.Controllers
{
    public class HomeController : Controller
    {
        List<Product> allDbProducts = new List<Product>() { 
        new Product{ProductId=1,ProductName = "Copy"},
        new Product{ProductId=2,ProductName = "ruler"},
        new Product{ProductId=3,ProductName = "sharpner"},
        new Product{ProductId=4,ProductName = "rubber"},
        new Product{ProductId=5,ProductName = "pencil"}

        
        };
        public ActionResult Index()
        {
            ViewBag.Message = "Modify this template to jump-start your ASP.NET MVC application.";

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Detail()
        {
            ViewBag.Message = "Your contact page.";
            
            return View(allDbProducts);
        }
        [HttpPost]
        public ActionResult ShoppingCart(int[] SelectedProducts)
        {
            ViewBag.Message = "Your contact page.";

            return View(SelectedProducts);
        }
    }
}
