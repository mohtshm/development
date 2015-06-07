using EntityFramework.Utilities;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using SnacCommerce.Domain.Concrete;
using SnacCommerce.Domain.Entities.Catalog;
using SnacCommerce.Domain.Entities.Orders;
using SnacCommerce.Domain.Entities.Users;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace MigrationUtility
{
    class Program
    {
        static crazydealEntities dbContext = null;
        static EFDbContext snacContext = null;
        static ApplicationDbContext appContext = null;
        static void Main(string[] args)
        {
            try
            {

                DateTime startTime = DateTime.Now;
                var files = System.IO.Directory.GetFiles(@"..\..\DBScript");
                var endFile = files.Last(f=>f.Contains("2"));
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["EFDbContext"].ConnectionString;

                foreach (var fileName in files.Except(new []{endFile}))
                {
                    RunQueriesForFile(fileName, connectionString);
                }
                InsertData();
                RunQueriesForFile(endFile,connectionString);
                DisplayEntitiesCount(DateTime.Now - startTime);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                if (ex.InnerException != null)
                {
                    Console.WriteLine(ex.InnerException.Message);
                }

            }
            finally
            {
                if (snacContext != null)
                {
                    snacContext.Dispose();
                }
                if (dbContext != null)
                {
                    dbContext.Dispose();
                }

            }
            //Console.WriteLine("Program End!");
            //Console.ReadKey();
        }

        private static void InsertData()
        {
            dbContext = GetCrazyDealContext();
            AddBrandIntoSnacFromMySql();
            AddCategoryIntoSnacFromMysql();
            AddSupplierIntoSnacFromMySql();
            AddProductIntoSnacFromMySql();
            // AddCustomerWithOrderIntoSnacFromMySql();
            //--AddOrdersIntoSnanFromMySql();
            AddOrderDetailIntoSnanFromMySql();
        }

        private static void RunQueriesForFile(string fileName, string connectionString)
        {
           
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            try
            {
                string allScripts = File.ReadAllText(fileName);
                connection.Open();
                string[] dbQueries = Regex.Split(allScripts + "\n", @"^\s*GO\s*$", RegexOptions.IgnoreCase | RegexOptions.Multiline);

                foreach (var query in dbQueries)
                {
                    if (string.IsNullOrWhiteSpace(query.Trim()))
                    {
                        continue;
                    }
                    command.CommandText = query;
                    command.ExecuteNonQuery();
                }
            }
            catch (Exception)
            {

            }
            finally
            {
                command.Dispose();
                if (connection.State == System.Data.ConnectionState.Open)
                {
                    connection.Close();
                }
                connection.Dispose();

            }
        }
        private static crazydealEntities GetCrazyDealContext()
        {
            var context = new crazydealEntities();
            context.Configuration.AutoDetectChangesEnabled = false;
            context.Configuration.ValidateOnSaveEnabled = false;
            return context;
        }
        private static EFDbContext GetSnacContext()
        {
            var context = new EFDbContext();
            context.Configuration.AutoDetectChangesEnabled = false;
            context.Configuration.ValidateOnSaveEnabled = false;
            return context;

        }
        private static void AddBrandIntoSnacFromMySql()
        {
            var allMysqlBrands = dbContext.dss_brand.ToList();
            List<Brand> snacNewBrands = new List<Brand>();
            foreach (var brand in allMysqlBrands)
            {
                Brand snacBrand = UtilityHelper.getSnacBrand(brand);
                snacNewBrands.Add(snacBrand);
            }
            AddBrands(snacNewBrands);
        }
        private static void AddBrands(List<Brand> snacNewBrands)
        {
            using (var db = GetSnacContext())
            {
                EFBatchOperation.For(db, db.Brand).InsertAll(snacNewBrands);
            }
        }
        private static void AddCategoryIntoSnacFromMysql()
        {
            var allMysqlCategories = dbContext.dss_category.ToList();
            List<Category> snacNewCategories = new List<Category>();
            foreach (var category in allMysqlCategories)
            {
                Category snacCategory = UtilityHelper.getSnacCategory(category);
                snacNewCategories.Add(snacCategory);
            }
            AddCategoryEntities(snacNewCategories);
        }

        private static void AddSupplierIntoSnacFromMySql()
        {
            var allSuppliers = dbContext.dss_suppliers.ToList();
            List<Supplier> snackSuppliers = new List<Supplier>();
            foreach (var supplier in allSuppliers)
            {
                Supplier snacSupplier = UtilityHelper.getSnacSupplier(supplier);
                snackSuppliers.Add(snacSupplier);
            }
            AddSuppliers(snackSuppliers);
        }
        private static void AddSuppliers1(List<Supplier> snackSuppliers)
        {
            var context = GetSnacContext();
            context.Suppliers.AddRange(snackSuppliers);
            context.SaveChanges();
        }
        private static void AddSuppliers(List<Supplier> entities)
        {
            using (var db = GetSnacContext())
            {
                EFBatchOperation.For(db, db.Suppliers).InsertAll(entities);
            }
        }

        private static void AddCategoryEntities(List<Category> snacNewCategories)
        {
            using (var db = GetSnacContext())
            {
                EFBatchOperation.For(db, db.Categories).InsertAll(snacNewCategories);
            }
        }
        private static void AddProductIntoSnacFromMySql()
        {
            var allProducts = dbContext.dss_products.ToList();
            var productManager = dbContext.dss_product_manager.ToList();
            List<Product> snackProducts = new List<Product>();
            foreach (var product in allProducts)
            {
                Product snacProduct = UtilityHelper.getSnacProduct(product, productManager.Where(p => p.id == product.products_id).SingleOrDefault());
                snackProducts.Add(snacProduct);
            }
            AddProducts(snackProducts);
        }

        private static void AddProducts(List<Product> entities)
        {
            using (var db = GetSnacContext())
            {
                EFBatchOperation.For(db, db.Products).InsertAll(entities);
            }
        }

        private static void AddOrderDetailIntoSnanFromMySql()
        {
            var orderDetails = dbContext.dss_order_product.ToList();
            List<Order_Details> snackOrders = new List<Order_Details>();
            foreach (var od in orderDetails)
            {
                Order_Details snacOrderDetail = UtilityHelper.getSnacOrderDetail(od);
                snackOrders.Add(snacOrderDetail);
            }
            AddOrderDetails(snackOrders);
        }

        private static void AddOrderDetails(List<Order_Details> entities)
        {
            using (var db = GetSnacContext())
            {
                EFBatchOperation.For(db, db.Order_Details).InsertAll(entities);
            }
        }

        //private static void AddOrdersIntoSnanFromMySql()
        //{
        //    var orders = dbContext.dss_orders.ToList();
        //    List<Order> snackOrders = new List<Order>();
        //    foreach (var order in orders)
        //    {
        //        Order snacOrder = UtilityHelper.getSnacOrder(order, "0fe4a1a2-ee4f-404c-b2d0-e960563a86c5");
        //        snackOrders.Add(snacOrder);
        //    }
        //    AddOrders(snackOrders);
        //}

        private static void AddOrders(List<Order> entities)
        {
            using (var db = GetSnacContext())
            {
                EFBatchOperation.For(db, db.Orders).InsertAll(entities);
            }
        }
        private static void AddCustomerWithOrderIntoSnacFromMySql()
        {

            var IdentityContext = GetIdentityContext();
            var storeUser = new UserStore<ApplicationUser>(IdentityContext);
            var managerUser = new UserManager<ApplicationUser>(storeUser);



            var usersWithOrders = dbContext.dss_customers.Where(c => c.customer_id > 32310).OrderBy(c => c.customer_id).ToList().Select(c => new { Customer = c, Orders = dbContext.dss_orders.Where(o => o.customer_id == c.customer_id) }).ToList();
            List<Order> snackOrders = new List<Order>();
            for (int i = 0; i < usersWithOrders.Count; i++)
            {
                var userOrder = usersWithOrders[i];
                ApplicationUser snacUser = UtilityHelper.getSnacUser(userOrder.Customer);

                managerUser.Create(snacUser, "password");

                string userId = snacUser.Id;
                var userOrders = userOrder.Orders.ToList().Select(o => UtilityHelper.getSnacOrder(o, userId));
                snackOrders.AddRange(userOrders);

                if (i % 500 == 0)
                {
                    IdentityContext = GetIdentityContext();
                    storeUser = new UserStore<ApplicationUser>(IdentityContext);
                    managerUser = new UserManager<ApplicationUser>(storeUser);
                }

            }
            AddOrders(snackOrders);
        }

        private static string AddApplicationUserAndReturnId(ApplicationUser snacUser, ApplicationDbContext context, bool createContext)
        {

            //if (!context.Roles.Any(r => r.Name == "Customer"))
            //{
            //    var store = new RoleStore<IdentityRole>(context);
            //    var manager = new RoleManager<IdentityRole>(store);
            //    var role = new IdentityRole { Name = "Customer" };

            //    manager.Create(role);
            //}

            var storeUser = new UserStore<ApplicationUser>(context);
            var managerUser = new UserManager<ApplicationUser>(storeUser);

            managerUser.Create(snacUser, "password");
            return snacUser.Id;

        }

        private static void RefreshContextIdentity(ApplicationDbContext appContext)
        {
            appContext.Dispose();
            appContext = GetIdentityContext();
        }
        private static ApplicationDbContext GetIdentityContext()
        {

            var context = new ApplicationDbContext();
            context.Configuration.AutoDetectChangesEnabled = false;
            context.Configuration.ValidateOnSaveEnabled = false;
            return context;
        }

        private static void DisplayEntitiesCount(TimeSpan timeTaken)
        {
            snacContext = GetSnacContext();

            StringBuilder text = new StringBuilder();
            text.AppendLine(string.Format("\nNo of brands {0} in CrazyDeal", dbContext.dss_brand.Count()));
            text.AppendLine(string.Format("No of brands {0} in SnacCommerce", snacContext.Brand.Count()));

            text.AppendLine(string.Format("\nNo of categories {0} in CrazyDeal", dbContext.dss_category.Count()));
            text.AppendLine(string.Format("No of categories {0} in SnacCommerce", snacContext.Categories.Count()));

            text.AppendLine(string.Format("\nNo of suppliers {0} in CrazyDeal", dbContext.dss_suppliers.Count()));
            text.AppendLine(string.Format("No of suppliers {0} in SnacCommerce", snacContext.Suppliers.Count()));


            text.AppendLine(string.Format("\nNo of products {0} in CrazyDeal", dbContext.dss_products.Count()));
            text.AppendLine(string.Format("No of products {0} in SnacCommerce", snacContext.Products.Count()));

            text.AppendLine(string.Format("\nNo of orders {0} in CrazyDeal", dbContext.dss_orders.Count()));
            text.AppendLine(string.Format("No of orders {0} in SnacCommerce", snacContext.Orders.Count()));

            text.AppendLine(string.Format("\nNo of orderdetails {0} in CrazyDeal", dbContext.dss_order_product.Count()));
            text.AppendLine(string.Format("No of orderdetails {0} in SnacCommerce", snacContext.Order_Details.Count()));

            text.AppendLine(string.Format("\nNo of customers {0} in CrazyDeal", dbContext.dss_customers.Count()));
            text.AppendLine(string.Format("No of customers {0} in SnacCommerce", snacContext.Users.Count()));


            text.AppendLine(string.Format("\n\nTime taken : \n  {2} : Hours {1} :  Minutes  {0} : Seconds  ", timeTaken.Seconds, timeTaken.Minutes, timeTaken.Hours));


            System.IO.File.WriteAllText("Report.txt", text.ToString());
        }
    }
}
