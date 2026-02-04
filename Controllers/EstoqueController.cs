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
<<<<<<< HEAD
}
=======
}
>>>>>>> eda043ff277b28cbfa62995ac8b7c7925158a77a
