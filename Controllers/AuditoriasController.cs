using Estoque.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace EstoqueWeb.Controllers
{
    [Authorize]
    public class AuditoriasController : Controller
    {
        private readonly AppDbContext _context;

        public AuditoriasController(AppDbContext context)
        {
            _context = context;
        }

        public IActionResult Index(string usuario, string acao)
        {
            var query = _context.Auditorias.AsQueryable();

            if (!string.IsNullOrEmpty(usuario))
                query = query.Where(a => a.Usuario.Contains(usuario));

            if (!string.IsNullOrEmpty(acao))
                query = query.Where(a => a.Acao == acao);

            var lista = query
                .OrderByDescending(a => a.Data)
                .Take(500) // segurança
                .ToList();

            ViewBag.Acao = acao;
            ViewBag.Usuario = usuario;

            return View(lista);
        }
        [Authorize]
        public IActionResult PorProduto(string produto)
        {
            if (string.IsNullOrEmpty(produto))
                return RedirectToAction(nameof(Index));

            var auditorias = _context.Auditorias
                .Where(a => a.Produto == produto && a.Tipo == "Produto")
                .OrderByDescending(a => a.Data)
                .ToList();

            ViewBag.Produto = produto;

            return View(auditorias);
        }

    }
}
