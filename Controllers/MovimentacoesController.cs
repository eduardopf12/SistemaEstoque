using Estoque.Data;
using Estoque.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace EstoqueWeb.Controllers
{
    [Authorize]
    public class MovimentacoesController : Controller
    {
        private readonly AppDbContext _context;

        public MovimentacoesController(AppDbContext context)
        {
            _context = context;
        }

        // 🔄 ATUALIZA ESTOQUE
        private void AtualizarEstoque(Produto produto, string tipo, int quantidade, bool reverter = false)
        {
            if (produto == null) return;

            tipo = tipo.Trim().ToLower();
            int qtd = reverter ? -quantidade : quantidade;

            if (tipo == "entrada")
                produto.Estoque += qtd;
            else if (tipo == "saida")
                produto.Estoque -= qtd;
        }

        // 📊 REGISTRAR AUDITORIA
        private void RegistrarAuditoria(Movimentacao mov, string acao)
        {
            var auditoria = new Auditoria
            {
                Usuario = User.Identity?.Name ?? "Sistema",
                Acao = acao,
                Produto = mov.Produto?.Nome,
                Quantidade = mov.Quantidade,
                Tipo = mov.Tipo,
                Patrimonio = mov.Patrimonio,
                Data = DateTime.Now,
                Ip = HttpContext.Connection.RemoteIpAddress?.ToString()
            };

            _context.Auditorias.Add(auditoria);
            _context.SaveChanges();
        }

        // 📋 LISTAGEM
        public IActionResult Index()
        {
            var lista = _context.Movimentacoes
                .Include(m => m.Produto)
                .OrderByDescending(m => m.Data)
                .ToList();

            return View(lista);
        }

        // ➕ CREATE

        // ➕ CREATE (GET)
        public IActionResult Create()
        {
            ViewBag.Produtos = _context.Produtos
                .Select(p => new
                {
                    Id = p.Id,
                    Nome = p.Nome,
                    Foto = p.Foto
                })
                .ToList();

            return View();
        }

        // ➕ CREATE POST
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Movimentacao mov)
        {
            var produto = _context.Produtos.FirstOrDefault(p => p.Id == mov.ProdutoId);

            if (produto == null)
                ModelState.AddModelError("", "Produto inválido");

            // ✅ Verificar estoque para saída
            if (mov.Tipo.Equals("Saida", StringComparison.OrdinalIgnoreCase) &&
                produto != null &&
                produto.Estoque < mov.Quantidade)
            {
                ModelState.AddModelError("", "Estoque insuficiente para saída");
            }

            // ✅ Validar patrimônio (Entrada → Saída / Saída → Entrada)
            var ultimaMov = _context.Movimentacoes
                .Where(m => m.Patrimonio == mov.Patrimonio)
                .OrderByDescending(m => m.Data)
                .FirstOrDefault();

            if (ultimaMov != null)
            {
                if (ultimaMov.Tipo.Equals("Entrada", StringComparison.OrdinalIgnoreCase) &&
                    mov.Tipo.Equals("Entrada", StringComparison.OrdinalIgnoreCase))
                {
                    ModelState.AddModelError("Patrimonio",
                        "Este patrimônio já entrou. A próxima movimentação deve ser saída.");
                }

                if (ultimaMov.Tipo.Equals("Saida", StringComparison.OrdinalIgnoreCase) &&
                    mov.Tipo.Equals("Saida", StringComparison.OrdinalIgnoreCase))
                {
                    ModelState.AddModelError("Patrimonio",
                        "Este patrimônio já saiu. A próxima movimentação deve ser entrada.");
                }
            }

            // ❌ ERRO → VOLTA VIEW (SEM SelectList)
            if (!ModelState.IsValid)
            {
                ViewBag.Produtos = _context.Produtos
                    .Select(p => new
                    {
                        Id = p.Id,
                        Nome = p.Nome,
                        Foto = p.Foto
                    })
                    .ToList();

                return View(mov);
            }

            // 📸 UPLOAD DA FOTO
            if (mov.FotoUpload != null && mov.FotoUpload.Length > 0)
            {
                var pasta = Path.Combine(
                    Directory.GetCurrentDirectory(),
                    "wwwroot/uploads/movimentacoes"
                );

                if (!Directory.Exists(pasta))
                    Directory.CreateDirectory(pasta);

                var nomeArquivo = Guid.NewGuid() + Path.GetExtension(mov.FotoUpload.FileName);
                var caminho = Path.Combine(pasta, nomeArquivo);

                using (var stream = new FileStream(caminho, FileMode.Create))
                    await mov.FotoUpload.CopyToAsync(stream);

                mov.Foto = nomeArquivo;
            }

            // 🔄 ATUALIZAR ESTOQUE
            AtualizarEstoque(produto, mov.Tipo, mov.Quantidade);

            // 💾 SALVAR MOVIMENTAÇÃO
            _context.Movimentacoes.Add(mov);
            await _context.SaveChangesAsync();

            // 🧾 REGISTRAR ATUALIZAÇÃO DO SISTEMA
            _context.AtualizacoesSistema.Add(new AtualizacaoSistema
            {
                Titulo = "Movimentação Registrada",
                Descricao =
                    $"🔄 Movimentação de {mov.Tipo}\n" +
                    $"Produto: {produto.Nome}\n" +
                    $"Patrimônio: {mov.Patrimonio}\n" +
                    $"Quantidade: {mov.Quantidade}",

                Data = DateTime.Now,
                Tipo = "movimentacao",
                Patrimonio = mov.Patrimonio
            });

            await _context.SaveChangesAsync();

            // 📊 AUDITORIA
            mov.Produto = produto;
            RegistrarAuditoria(mov, "CREATE");

            return RedirectToAction(nameof(Index));
        }



        /// ✏️ EDIT (GET)
        public IActionResult Edit(int id)
        {
            var mov = _context.Movimentacoes
                .Include(m => m.Produto)
                .FirstOrDefault(m => m.Id == id);

            if (mov == null)
                return NotFound();

            ViewBag.Produtos = _context.Produtos
                .Select(p => new
                {
                    Id = p.Id,
                    Nome = p.Nome,
                    Foto = p.Foto
                })
                .ToList();

            return View(mov);
        }

        // ✏️ EDIT POST
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(Movimentacao movNova)
        {
            var movAntiga = _context.Movimentacoes
                .Include(m => m.Produto)
                .FirstOrDefault(m => m.Id == movNova.Id);

            if (movAntiga == null)
                return NotFound();

            var produtoNovo = _context.Produtos.FirstOrDefault(p => p.Id == movNova.ProdutoId);
            if (produtoNovo == null)
            {
                ModelState.AddModelError("", "Produto inválido");

                ViewBag.Produtos = _context.Produtos
                    .Select(p => new
                    {
                        Id = p.Id,
                        Nome = p.Nome,
                        Foto = p.Foto
                    })
                    .ToList();

                return View(movNova);
            }

            // 🔄 Reverter estoque da movimentação antiga
            AtualizarEstoque(movAntiga.Produto, movAntiga.Tipo, movAntiga.Quantidade, true);

            // ✅ Validar estoque para saída
            if (movNova.Tipo.Equals("Saida", StringComparison.OrdinalIgnoreCase) &&
                produtoNovo.Estoque < movNova.Quantidade)
            {
                ModelState.AddModelError("", "Estoque insuficiente para saída");
            }

            // ✅ Validar patrimônio (Entrada → Saída / Saída → Entrada)
            var ultimaMov = _context.Movimentacoes
                .Where(m => m.Patrimonio == movNova.Patrimonio && m.Id != movNova.Id)
                .OrderByDescending(m => m.Data)
                .FirstOrDefault();

            if (ultimaMov != null)
            {
                if (ultimaMov.Tipo.Equals("Entrada", StringComparison.OrdinalIgnoreCase) &&
                    movNova.Tipo.Equals("Entrada", StringComparison.OrdinalIgnoreCase))
                {
                    ModelState.AddModelError("Patrimonio",
                        "Este patrimônio já entrou. A próxima movimentação deve ser saída.");
                }

                if (ultimaMov.Tipo.Equals("Saida", StringComparison.OrdinalIgnoreCase) &&
                    movNova.Tipo.Equals("Saida", StringComparison.OrdinalIgnoreCase))
                {
                    ModelState.AddModelError("Patrimonio",
                        "Este patrimônio já saiu. A próxima movimentação deve ser entrada.");
                }
            }

            if (!ModelState.IsValid)
            {
                ViewBag.Produtos = _context.Produtos
                    .Select(p => new
                    {
                        Id = p.Id,
                        Nome = p.Nome,
                        Foto = p.Foto
                    })
                    .ToList();

                return View(movNova);
            }

            // 📸 UPLOAD DA FOTO (SE ALTERADA)
            if (movNova.FotoUpload != null && movNova.FotoUpload.Length > 0)
            {
                var pasta = Path.Combine(
                    Directory.GetCurrentDirectory(),
                    "wwwroot/uploads/movimentacoes"
                );

                if (!Directory.Exists(pasta))
                    Directory.CreateDirectory(pasta);

                var nomeArquivo = Guid.NewGuid() + Path.GetExtension(movNova.FotoUpload.FileName);
                var caminho = Path.Combine(pasta, nomeArquivo);

                using (var stream = new FileStream(caminho, FileMode.Create))
                    await movNova.FotoUpload.CopyToAsync(stream);

                // 🗑️ Remover foto antiga
                if (!string.IsNullOrEmpty(movAntiga.Foto))
                {
                    var caminhoAntigo = Path.Combine(pasta, movAntiga.Foto);
                    if (System.IO.File.Exists(caminhoAntigo))
                        System.IO.File.Delete(caminhoAntigo);
                }

                movAntiga.Foto = nomeArquivo;
            }

            // 🔄 Atualizar dados
            movAntiga.ProdutoId = movNova.ProdutoId;
            movAntiga.Tipo = movNova.Tipo;
            movAntiga.Quantidade = movNova.Quantidade;
            movAntiga.Unidade = movNova.Unidade;
            movAntiga.Setor = movNova.Setor;
            movAntiga.Patrimonio = movNova.Patrimonio;

            // 🔄 Aplicar novo impacto no estoque
            AtualizarEstoque(produtoNovo, movNova.Tipo, movNova.Quantidade);

            await _context.SaveChangesAsync();

            movAntiga.Produto = produtoNovo;
            RegistrarAuditoria(movAntiga, "EDIT");

            return RedirectToAction(nameof(Index));
        }



        // 🗑️ DELETE
        public IActionResult Delete(int id)
        {
            var mov = _context.Movimentacoes
                .Include(m => m.Produto)
                .FirstOrDefault(m => m.Id == id);

            if (mov == null)
                return NotFound();

            AtualizarEstoque(mov.Produto, mov.Tipo, mov.Quantidade, true);

            RegistrarAuditoria(mov, "DELETE");

            _context.Movimentacoes.Remove(mov);
            _context.SaveChanges();

            return RedirectToAction(nameof(Index));
        }
        public IActionResult HistoricoPatrimonio(string patrimonio)
        {
            var historico = _context.Movimentacoes
                .Include(m => m.Produto)
                .Where(m => m.Patrimonio == patrimonio)
                .OrderByDescending(m => m.Data)
                .ToList();

            ViewBag.Patrimonio = patrimonio;
            return View("HistoricoPatrimonio", historico); // <- aqui você indica o nome da View
        }
        public IActionResult Details(int id)
        {
            var mov = _context.Movimentacoes
                .Include(m => m.Produto)
                .FirstOrDefault(m => m.Id == id);

            if (mov == null)
                return NotFound();

            return View(mov);
        }


    }
}
