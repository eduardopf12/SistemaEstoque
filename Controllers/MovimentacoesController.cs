using Estoque.Data;
using Estoque.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
<<<<<<< HEAD
using Microsoft.EntityFrameworkCore;
using Rotativa.AspNetCore;
using Rotativa.AspNetCore.Options;
=======
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
>>>>>>> eda043ff277b28cbfa62995ac8b7c7925158a77a

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

<<<<<<< HEAD
        // 🔄 Atualiza estoque
        private void AtualizarEstoque(Produto produto, string tipo, int quantidade, bool reverter = false)
        {
            if (produto == null || quantidade <= 0) return;

            tipo = tipo.Trim().ToLower();

            int valor = reverter ? -quantidade : quantidade;

            if (tipo == "entrada")
            {
                produto.Quantidade += valor;
            }
            else if (tipo == "saida")
            {
                // 🚫 BLOQUEIA ESTOQUE NEGATIVO
                if (produto.Quantidade - valor < 0)
                    throw new InvalidOperationException("Estoque insuficiente para realizar a saída.");

                produto.Quantidade -= valor;
            }

            // 🔒 GARANTIA FINAL
            if (produto.Quantidade < 0)
                produto.Quantidade = 0;
        }



        // 📊 Cria auditoria
        private Auditoria CriarAuditoria(string acao, string produto, int quantidade, string tipo, string patrimonio)
        {
            return new Auditoria
            {
                Usuario = User.Identity?.Name ?? "Sistema",
                Acao = acao ?? "N/A",
                Produto = produto ?? "[Produto não informado]",
                Quantidade = quantidade,
                Tipo = tipo ?? "[Tipo não informado]",
                Patrimonio = patrimonio ?? "[Sem Patrimônio]",
                Data = DateTime.Now,
                Ip = HttpContext.Connection.RemoteIpAddress?.ToString() ?? "0.0.0.0",
                Entidade = "Movimentacao"
            };
        }

        // 📋 Lista movimentações
=======
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
>>>>>>> eda043ff277b28cbfa62995ac8b7c7925158a77a
        public IActionResult Index()
        {
            var lista = _context.Movimentacoes
                .Include(m => m.Produto)
                .OrderByDescending(m => m.Data)
                .ToList();
<<<<<<< HEAD
            return View(lista);
        }

        // ➕ Create (GET)
        public async Task<IActionResult> Create(bool usarUltima = false)
        {
            ViewBag.Produtos = await _context.Produtos
                .Select(p => new
                {
                    p.Id,
                    p.Nome,
                    p.Foto
                })
                .ToListAsync();

            if (!usarUltima)
                return View(new Movimentacao());

            var ultima = await _context.Movimentacoes
                .OrderByDescending(m => m.Data)
                .FirstOrDefaultAsync();

            if (ultima == null)
                return View(new Movimentacao());

            // ⚠️ Reutiliza APENAS campos de contexto
            var mov = new Movimentacao
            {
                ProdutoId = ultima.ProdutoId,
                Tipo = ultima.Tipo,
                Setor = ultima.Setor,

                // 🔥 SEMPRE resetar
                Quantidade = 1,
                Unidade = ultima.Unidade,
                Patrimonio = string.Empty
            };

            ViewBag.UsandoUltima = true;
            return View(mov);
        }





        // ➕ Create (POST) com transação
=======

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
>>>>>>> eda043ff277b28cbfa62995ac8b7c7925158a77a
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Movimentacao mov)
        {
<<<<<<< HEAD
            var produto = await _context.Produtos.FirstOrDefaultAsync(p => p.Id == mov.ProdutoId);
            if (produto == null) ModelState.AddModelError("", "Produto inválido");
            if (mov.Tipo?.Equals("Saida", StringComparison.OrdinalIgnoreCase) == true)
            {
                if (produto.Quantidade < mov.Quantidade)
                {
                    ModelState.AddModelError("",
                        $"Estoque insuficiente. Disponível: {produto.Quantidade}");
                }
            }



            Movimentacao? ultimaMov = null;

            if (!string.IsNullOrWhiteSpace(mov.Patrimonio))
            {
                ultimaMov = await _context.Movimentacoes
                    .Where(m => m.Patrimonio == mov.Patrimonio)
                    .OrderByDescending(m => m.Data)
                    .FirstOrDefaultAsync();
            }


            if (ultimaMov != null)
            {
                if (ultimaMov.Tipo?.Equals("Entrada", StringComparison.OrdinalIgnoreCase) == true &&
                    mov.Tipo?.Equals("Entrada", StringComparison.OrdinalIgnoreCase) == true)
                    ModelState.AddModelError("Patrimonio", "Este patrimônio já entrou. A próxima movimentação deve ser saída.");

                if (ultimaMov.Tipo?.Equals("Saida", StringComparison.OrdinalIgnoreCase) == true &&
                    mov.Tipo?.Equals("Saida", StringComparison.OrdinalIgnoreCase) == true)
                    ModelState.AddModelError("Patrimonio", "Este patrimônio já saiu. A próxima movimentação deve ser entrada.");
            }

            if (!ModelState.IsValid)
            {
                ViewBag.Produtos = _context.Produtos.Select(p => new { p.Id, p.Nome, p.Foto }).ToList();
                return View(mov);
            }

            // 📸 Upload da foto
            if (mov.FotoUpload != null && mov.FotoUpload.Length > 0)
            {
                var pasta = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/uploads/movimentacoes");
                if (!Directory.Exists(pasta)) Directory.CreateDirectory(pasta);

                var nomeArquivo = Guid.NewGuid() + System.IO.Path.GetExtension(mov.FotoUpload.FileName);
=======
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
>>>>>>> eda043ff277b28cbfa62995ac8b7c7925158a77a
                var caminho = Path.Combine(pasta, nomeArquivo);

                using (var stream = new FileStream(caminho, FileMode.Create))
                    await mov.FotoUpload.CopyToAsync(stream);

                mov.Foto = nomeArquivo;
            }

<<<<<<< HEAD
            // 🔒 Transação EF Core
            using var transaction = await _context.Database.BeginTransactionAsync();
            try
            {
                // 🔄 Atualiza estoque
                AtualizarEstoque(produto, mov.Tipo, mov.Quantidade);

                // 💾 Salva movimentação
                _context.Movimentacoes.Add(mov);

                // 🧾 Auditoria
                _context.Auditorias.Add(CriarAuditoria("CREATE", produto?.Nome, mov.Quantidade, mov.Tipo, mov.Patrimonio));

                // 🔄 Atualização do sistema
                _context.AtualizacoesSistema.Add(new AtualizacaoSistema
                {
                    Titulo = "Movimentação Registrada",
                    Descricao = $"🔄 Movimentação de {mov.Tipo}\nProduto: {produto?.Nome}\nPatrimônio: {mov.Patrimonio}\nQuantidade: {mov.Quantidade}",
                    Data = DateTime.Now,
                    Tipo = "movimentacao",
                    Patrimonio = mov.Patrimonio
                });

                await _context.SaveChangesAsync();
                await transaction.CommitAsync();
            }
            catch
            {
                await transaction.RollbackAsync();
                ModelState.AddModelError("", "Ocorreu um erro ao registrar a movimentação. Tente novamente.");
                ViewBag.Produtos = _context.Produtos.Select(p => new { p.Id, p.Nome, p.Foto }).ToList();
                return View(mov);
            }

            return RedirectToAction(nameof(Index));
        }

        // ✏️ Edit (POST) com transação
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(Movimentacao movNova)
        {
            var movAntiga = await _context.Movimentacoes
                .Include(m => m.Produto)
                .FirstOrDefaultAsync(m => m.Id == movNova.Id);

            if (movAntiga == null)
                return NotFound();

            var produtoNovo = await _context.Produtos
                .FirstOrDefaultAsync(p => p.Id == movNova.ProdutoId);

            if (produtoNovo == null)
            {
                ModelState.AddModelError("", "Produto inválido");
                ViewBag.Produtos = _context.Produtos.Select(p => new { p.Id, p.Nome, p.Foto }).ToList();
                return View(movNova);
            }

            // 🔍 SIMULAÇÃO DE ESTOQUE FINAL (ANTES DA TRANSAÇÃO)
            int estoqueSimulado = movAntiga.Produto.Quantidade;

            // reverte movimentação antiga
            if (movAntiga.Tipo.Equals("Entrada", StringComparison.OrdinalIgnoreCase))
                estoqueSimulado -= movAntiga.Quantidade;
            else
                estoqueSimulado += movAntiga.Quantidade;

            // aplica nova movimentação
            if (movNova.Tipo.Equals("Entrada", StringComparison.OrdinalIgnoreCase))
                estoqueSimulado += movNova.Quantidade;
            else
                estoqueSimulado -= movNova.Quantidade;

            // 🚫 BLOQUEIO DE ESTOQUE NEGATIVO
            if (estoqueSimulado < 0)
            {
                ModelState.AddModelError("",
                    $"Estoque insuficiente para essa alteração. Disponível: {movAntiga.Produto.Quantidade}");
                ViewBag.Produtos = _context.Produtos.Select(p => new { p.Id, p.Nome, p.Foto }).ToList();
                return View(movNova);
            }

            using var transaction = await _context.Database.BeginTransactionAsync();
            try
            {
                // 🔄 Reverte estoque antigo
                AtualizarEstoque(movAntiga.Produto, movAntiga.Tipo, movAntiga.Quantidade, true);

                // 🔄 Aplica novo estoque
                AtualizarEstoque(produtoNovo, movNova.Tipo, movNova.Quantidade);

                // 📸 Upload da foto
                if (movNova.FotoUpload != null && movNova.FotoUpload.Length > 0)
                {
                    var pasta = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/uploads/movimentacoes");
                    if (!Directory.Exists(pasta)) Directory.CreateDirectory(pasta);

                    var nomeArquivo = Guid.NewGuid() + Path.GetExtension(movNova.FotoUpload.FileName);
                    var caminho = Path.Combine(pasta, nomeArquivo);

                    using (var stream = new FileStream(caminho, FileMode.Create))
                        await movNova.FotoUpload.CopyToAsync(stream);

                    if (!string.IsNullOrEmpty(movAntiga.Foto))
                    {
                        var caminhoAntigo = Path.Combine(pasta, movAntiga.Foto);
                        if (System.IO.File.Exists(caminhoAntigo))
                            System.IO.File.Delete(caminhoAntigo);
                    }

                    movAntiga.Foto = nomeArquivo;
                }

                // 🔄 Atualiza dados da movimentação
                movAntiga.ProdutoId = movNova.ProdutoId;
                movAntiga.Tipo = movNova.Tipo;
                movAntiga.Quantidade = movNova.Quantidade;
                movAntiga.Unidade = movNova.Unidade;
                movAntiga.Setor = movNova.Setor;
                movAntiga.Patrimonio = movNova.Patrimonio;

                // 🧾 Auditoria
                _context.Auditorias.Add(
                    CriarAuditoria("EDIT", produtoNovo.Nome, movNova.Quantidade, movNova.Tipo, movNova.Patrimonio)
                );

                await _context.SaveChangesAsync();
                await transaction.CommitAsync();
            }
            catch
            {
                await transaction.RollbackAsync();
                ModelState.AddModelError("", "Erro ao editar a movimentação. Tente novamente.");
                ViewBag.Produtos = _context.Produtos.Select(p => new { p.Id, p.Nome, p.Foto }).ToList();
                return View(movNova);
            }
=======
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
>>>>>>> eda043ff277b28cbfa62995ac8b7c7925158a77a

            return RedirectToAction(nameof(Index));
        }


<<<<<<< HEAD
        // 🗑️ Delete com transação
        public async Task<IActionResult> Delete(int id)
        {
            var mov = await _context.Movimentacoes.Include(m => m.Produto).FirstOrDefaultAsync(m => m.Id == id);
            if (mov == null) return NotFound();

            using var transaction = await _context.Database.BeginTransactionAsync();
            try
            {
                AtualizarEstoque(mov.Produto, mov.Tipo, mov.Quantidade, true);

                _context.Auditorias.Add(CriarAuditoria("DELETE", mov.Produto?.Nome, mov.Quantidade, mov.Tipo, mov.Patrimonio));

                _context.Movimentacoes.Remove(mov);
                await _context.SaveChangesAsync();

                await transaction.CommitAsync();
            }
            catch
            {
                await transaction.RollbackAsync();
                TempData["Erro"] = "Erro ao deletar a movimentação.";
            }

            return RedirectToAction(nameof(Index));
        }

        // 📄 Detalhes de uma movimentação
        public async Task<IActionResult> Details(int id)
        {
            var mov = await _context.Movimentacoes
                .Include(m => m.Produto)
                .FirstOrDefaultAsync(m => m.Id == id);

            if (mov == null)
                return NotFound();

            // 🔍 Movimentação anterior (setor de origem)
            var movAnterior = await _context.Movimentacoes
                .Where(m =>
                    m.Patrimonio == mov.Patrimonio &&
                    m.Data < mov.Data)
                .OrderByDescending(m => m.Data)
                .FirstOrDefaultAsync();

            ViewBag.SetorAnterior = movAnterior?.Setor ?? "Origem inicial";

            // 🔍 Movimentação seguinte do tipo oposto
            string tipoOposto = mov.Tipo.Equals("Saida", StringComparison.OrdinalIgnoreCase) ? "Entrada" : "Saida";

            var movSeguinte = await _context.Movimentacoes
       .Where(m =>
           m.Patrimonio == mov.Patrimonio &&
           m.Tipo.ToLower() == tipoOposto.ToLower() &&
           m.Data > mov.Data)
       .OrderBy(m => m.Data)
       .FirstOrDefaultAsync();

            ViewBag.SetorSeguinte = movSeguinte?.Setor; // null se não houver

            return View(mov);
        }





        // ✏️ Edit (GET)
        public async Task<IActionResult> Edit(int id)
        {
            var mov = await _context.Movimentacoes
                .Include(m => m.Produto)
                .FirstOrDefaultAsync(m => m.Id == id);
=======

        /// ✏️ EDIT (GET)
        public IActionResult Edit(int id)
        {
            var mov = _context.Movimentacoes
                .Include(m => m.Produto)
                .FirstOrDefault(m => m.Id == id);
>>>>>>> eda043ff277b28cbfa62995ac8b7c7925158a77a

            if (mov == null)
                return NotFound();

            ViewBag.Produtos = _context.Produtos
<<<<<<< HEAD
                .Select(p => new { p.Id, p.Nome, p.Foto })
                .ToList();

            return View(mov); // Vai usar a sua Edit.cshtml
        }
        // 📊 Retorna estoque disponível do produto (AJAX)
        // 📊 Retorna QUANTIDADE disponível (computada pelas movimentações)
        [HttpGet]
        public async Task<IActionResult> ObterQuantidadeDisponivel(int produtoId)
        {
            var produto = await _context.Produtos
                .Where(p => p.Id == produtoId)
                .Select(p => p.Quantidade)
                .FirstOrDefaultAsync();

            return Json(produto);
=======
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
>>>>>>> eda043ff277b28cbfa62995ac8b7c7925158a77a
        }



<<<<<<< HEAD


=======
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
>>>>>>> eda043ff277b28cbfa62995ac8b7c7925158a77a


    }
}
