using Estoque.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;

namespace EstoqueWeb.Controllers
{
    [Authorize]
    public class DashboardController : Controller
    {
        private readonly AppDbContext _context;

        public DashboardController(AppDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            // =====================================================
            // 👤 USUÁRIO LOGADO
            // =====================================================
            var emailUsuario = User.Identity!.Name;

            var usuario = _context.Usuarios
                .FirstOrDefault(u => u.Email == emailUsuario);

            DateTime? ultimoLoginAnterior = usuario?.UltimoLogin;

        

            ViewBag.UltimoLogin = ultimoLoginAnterior;

            // =====================================================
            // 🧾 ATUALIZAÇÕES / NOVIDADES DO SISTEMA
            // =====================================================
            var atualizacoes = _context.AtualizacoesSistema
                .OrderByDescending(a => a.Data)
                .Take(5)
                .ToList();


            ViewBag.Atualizacoes = atualizacoes;

            // =====================================================
            // 🔔 CONTADOR DE NOVIDADES NOVAS
            // =====================================================
            int contadorNovidades = 0;

            if (ultimoLoginAnterior.HasValue)
            {
                contadorNovidades = atualizacoes
                    .Count(a => a.Data > ultimoLoginAnterior.Value);
            }

            ViewBag.ContadorNovidades = contadorNovidades;

            // =====================================================
            // 📅 DATAS
            // =====================================================
            var hoje = DateTime.Today;
            var amanha = hoje.AddDays(1);

            // =====================================================
            // 📊 INDICADORES
            // =====================================================
            ViewBag.TotalProdutos = _context.Produtos.Count();

            ViewBag.TotalEstoque = _context.Produtos.Any()
                ? _context.Produtos.Sum(p => p.Estoque)
                : 0;

            ViewBag.EntradasHoje = _context.Movimentacoes
                .Where(m =>
                    m.Tipo.ToLower() == "entrada" &&
                    m.Data >= hoje &&
                    m.Data < amanha)
                .Sum(m => (int?)m.Quantidade) ?? 0;

            ViewBag.SaidasHoje = _context.Movimentacoes
                .Where(m =>
                    m.Tipo.ToLower() == "saida" &&
                    m.Data >= hoje &&
                    m.Data < amanha)
                .Sum(m => (int?)m.Quantidade) ?? 0;

            // =====================================================
            // 🕒 ÚLTIMAS MOVIMENTAÇÕES
            // =====================================================
            ViewBag.UltimasMovimentacoes = _context.Movimentacoes
                .Include(m => m.Produto)
                .OrderByDescending(m => m.Data)
                .Take(5)
                .ToList();

            // =====================================================
            // ⚠️ PRODUTOS COM ESTOQUE BAIXO
            // =====================================================
            ViewBag.ProdutosBaixoEstoque = _context.Produtos
                .Where(p => p.Estoque <= p.EstoqueMinimo)
                .OrderBy(p => p.Estoque)
                .ToList();

            return View();
        }

        

    }
}
