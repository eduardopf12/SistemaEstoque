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
<<<<<<< HEAD
            // ===============================
            // 👤 USUÁRIO LOGADO
            // ===============================
=======
            // =====================================================
            // 👤 USUÁRIO LOGADO
            // =====================================================
>>>>>>> eda043ff277b28cbfa62995ac8b7c7925158a77a
            var emailUsuario = User.Identity!.Name;

            var usuario = _context.Usuarios
                .FirstOrDefault(u => u.Email == emailUsuario);

            DateTime? ultimoLoginAnterior = usuario?.UltimoLogin;
<<<<<<< HEAD
            ViewBag.UltimoLogin = ultimoLoginAnterior;

            // ===============================
            // 🔔 ATUALIZAÇÕES
            // ===============================
=======

        

            ViewBag.UltimoLogin = ultimoLoginAnterior;

            // =====================================================
            // 🧾 ATUALIZAÇÕES / NOVIDADES DO SISTEMA
            // =====================================================
>>>>>>> eda043ff277b28cbfa62995ac8b7c7925158a77a
            var atualizacoes = _context.AtualizacoesSistema
                .OrderByDescending(a => a.Data)
                .Take(5)
                .ToList();

<<<<<<< HEAD
            ViewBag.Atualizacoes = atualizacoes;

            int contadorNovidades = 0;
=======

            ViewBag.Atualizacoes = atualizacoes;

            // =====================================================
            // 🔔 CONTADOR DE NOVIDADES NOVAS
            // =====================================================
            int contadorNovidades = 0;

>>>>>>> eda043ff277b28cbfa62995ac8b7c7925158a77a
            if (ultimoLoginAnterior.HasValue)
            {
                contadorNovidades = atualizacoes
                    .Count(a => a.Data > ultimoLoginAnterior.Value);
            }

            ViewBag.ContadorNovidades = contadorNovidades;

<<<<<<< HEAD
            // ===============================
            // 📅 DATAS
            // ===============================
            var hoje = DateTime.Today;
            var amanha = hoje.AddDays(1);

            // ===============================
            // 📊 INDICADORES
            // ===============================
            ViewBag.TotalProdutos = _context.Produtos.Count();

            // 👉 TOTAL DE ITENS DISPONÍVEIS NO ESTOQUE
            ViewBag.TotalEstoque = _context.Produtos.Sum(p => p.Quantidade);


            ViewBag.EntradasHoje = _context.Movimentacoes
                .Where(m => m.Tipo.ToLower() == "entrada"
                         && m.Data >= hoje
                         && m.Data < amanha)
                .Sum(m => (int?)m.Quantidade) ?? 0;

            ViewBag.SaidasHoje = _context.Movimentacoes
                .Where(m => m.Tipo.ToLower() == "saida"
                         && m.Data >= hoje
                         && m.Data < amanha)
                .Sum(m => (int?)m.Quantidade) ?? 0;

            // ===============================
            // 🕒 ÚLTIMAS MOVIMENTAÇÕES
            // ===============================
=======
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
>>>>>>> eda043ff277b28cbfa62995ac8b7c7925158a77a
            ViewBag.UltimasMovimentacoes = _context.Movimentacoes
                .Include(m => m.Produto)
                .OrderByDescending(m => m.Data)
                .Take(5)
                .ToList();

<<<<<<< HEAD
            // ===============================
            // ⚠️ ESTOQUE BAIXO
            // ===============================
=======
            // =====================================================
            // ⚠️ PRODUTOS COM ESTOQUE BAIXO
            // =====================================================
>>>>>>> eda043ff277b28cbfa62995ac8b7c7925158a77a
            ViewBag.ProdutosBaixoEstoque = _context.Produtos
                .Where(p => p.Estoque <= p.EstoqueMinimo)
                .OrderBy(p => p.Estoque)
                .ToList();

<<<<<<< HEAD
            // ===============================
            // 📦 ESTOQUE DISPONÍVEL POR PRODUTO
            // ===============================
            ViewBag.EstoquePorProduto = _context.Produtos
    .OrderBy(p => p.Nome)
    .Select(p => new
    {
        p.Nome,
        QuantidadeDisponivel = p.Quantidade
    })
    .ToList();





            return View();
        }
=======
            return View();
        }

        

>>>>>>> eda043ff277b28cbfa62995ac8b7c7925158a77a
    }
}
