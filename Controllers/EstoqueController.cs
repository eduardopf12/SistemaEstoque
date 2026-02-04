using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
namespace EstoqueWeb.Controllers
{
    [Authorize]
    public class EstoqueController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}