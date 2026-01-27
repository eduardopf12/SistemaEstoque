using Estoque.Models;
using Estoque.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;

namespace EstoqueWeb.Controllers
{
    [Authorize]
    public class ProdutosController : Controller
    {
        private readonly AppDbContext _context;

        public ProdutosController(AppDbContext context)
        {
            _context = context;
        }

        // 📊 REGISTRAR AUDITORIA DE PRODUTO
        private void RegistrarAuditoriaProduto(Produto produto, string acao, string? motivo = null)
        {
            var auditoria = new Auditoria
            {
                Usuario = User.Identity?.Name ?? "Sistema",
                Acao = acao,
                Produto = produto.Nome,
                Quantidade = produto.Estoque,
                Tipo = "Produto",
                Patrimonio = "",
                Motivo = motivo ?? "",
                Data = DateTime.Now,
                Ip = HttpContext.Connection.RemoteIpAddress?.ToString()
            };

            _context.Auditorias.Add(auditoria);
            _context.SaveChanges();
        }

        // 📋 LISTAGEM
        public IActionResult Index()
        {
            var produtos = _context.Produtos.ToList();
            return View(produtos);
        }

        // ➕ CREATE
        public IActionResult Create()
        {
            return View();
        }

        // ➕ CREATE POST
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Produto produto)
        {
            if (!ModelState.IsValid)
                return View(produto);

            // 📸 UPLOAD DA FOTO
            if (produto.FotoUpload != null && produto.FotoUpload.Length > 0)
            {
                var pasta = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/uploads/produtos");
                if (!Directory.Exists(pasta))
                    Directory.CreateDirectory(pasta);

                var nomeArquivo = Guid.NewGuid() + Path.GetExtension(produto.FotoUpload.FileName);
                var caminho = Path.Combine(pasta, nomeArquivo);

                using (var stream = new FileStream(caminho, FileMode.Create))
                    await produto.FotoUpload.CopyToAsync(stream);

                produto.Foto = nomeArquivo;
            }

            // 💾 SALVA PRODUTO
            _context.Produtos.Add(produto);
            await _context.SaveChangesAsync();

            // 🧾 REGISTRA ATUALIZAÇÃO DO SISTEMA
            
            _context.AtualizacoesSistema.Add(new AtualizacaoSistema
            {
                Titulo = "Produto cadastrado",
                ProdutoNome = produto.Nome,          
                Descricao = $"\nProduto '{produto.Nome}' foi criado no sistema.",
                Data = DateTime.Now,
                Tipo = "produto"                     
            });
            

            _context.SaveChanges();


            await _context.SaveChangesAsync();

            // 📊 AUDITORIA
            RegistrarAuditoriaProduto(produto, "CREATE");

            return RedirectToAction(nameof(Index));
        }


        // ✏️ EDIT GET
        public IActionResult Edit(int id)
        {
            var produto = _context.Produtos.Find(id);
            if (produto == null) return NotFound();

            return View(produto);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(Produto produto)
        {
            var produtoDb = _context.Produtos.FirstOrDefault(p => p.Id == produto.Id);
            if (produtoDb == null) return NotFound();

            var estoqueAnterior = produtoDb.Estoque;

            // Exige motivo apenas se o estoque está sendo zerado agora
            if (estoqueAnterior > 0 && produto.Estoque == 0 && string.IsNullOrWhiteSpace(produto.Motivo))
            {
                ModelState.AddModelError("Motivo", "Informe o motivo ao zerar o estoque.");
                return View(produto);
            }

            // Atualiza dados
            produtoDb.Nome = produto.Nome;
            produtoDb.Descricao = produto.Descricao;
            produtoDb.Estoque = produto.Estoque;
            produtoDb.Quantidade = produto.Quantidade;

            // 📸 Atualiza foto se houver upload
            if (produto.FotoUpload != null && produto.FotoUpload.Length > 0)
            {
                var pasta = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/uploads/produtos");
                if (!Directory.Exists(pasta))
                    Directory.CreateDirectory(pasta);

                var nomeArquivo = Guid.NewGuid() + Path.GetExtension(produto.FotoUpload.FileName);
                var caminho = Path.Combine(pasta, nomeArquivo);

                using (var stream = new FileStream(caminho, FileMode.Create))
                    await produto.FotoUpload.CopyToAsync(stream);

                // Remove foto antiga
                if (!string.IsNullOrEmpty(produtoDb.Foto))
                {
                    var fotoAntiga = Path.Combine(pasta, produtoDb.Foto);
                    if (System.IO.File.Exists(fotoAntiga))
                        System.IO.File.Delete(fotoAntiga);
                }

                produtoDb.Foto = nomeArquivo;
            }

            await _context.SaveChangesAsync();

            RegistrarAuditoriaProduto(produtoDb, "EDIT", estoqueAnterior > 0 && produto.Estoque == 0 ? produto.Motivo : null);

            TempData["Sucesso"] = $"Produto '{produto.Nome}' atualizado com sucesso!";
            return RedirectToAction(nameof(Index));
        }






        // 🗑️ DELETE
        public IActionResult Delete(int id)
        {
            var produto = _context.Produtos.Find(id);
            if (produto == null)
                return NotFound();

            // ✅ Bloqueia exclusão se houver estoque
            if (produto.Estoque > 0)
            {
                TempData["Erro"] = $"Não é possível excluir o produto '{produto.Nome}' porque ainda possui estoque ({produto.Estoque}).";
                return RedirectToAction(nameof(Index));
            }

            // 📊 Registrar auditoria antes de excluir
            RegistrarAuditoriaProduto(produto, "DELETE");

            // 🗑️ Remover foto se existir
            if (!string.IsNullOrEmpty(produto.Foto))
            {
                var pasta = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/uploads/produtos");
                var caminhoFoto = Path.Combine(pasta, produto.Foto);
                if (System.IO.File.Exists(caminhoFoto))
                    System.IO.File.Delete(caminhoFoto);
            }

            _context.Produtos.Remove(produto);
            _context.SaveChanges();

            // ✅ Mensagem de sucesso
            TempData["Sucesso"] = $"Produto '{produto.Nome}' excluído com sucesso!";

            return RedirectToAction(nameof(Index));
        }


        // 🖼️ REMOVER FOTO
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> RemoverFoto(int id)
        {
            var produto = _context.Produtos.FirstOrDefault(p => p.Id == id);
            if (produto == null) return NotFound();

            if (!string.IsNullOrEmpty(produto.Foto))
            {
                var pasta = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/uploads/produtos");
                var caminho = Path.Combine(pasta, produto.Foto);
                if (System.IO.File.Exists(caminho))
                    System.IO.File.Delete(caminho);

                produto.Foto = null;
                await _context.SaveChangesAsync();

                RegistrarAuditoriaProduto(produto, "REMOVE_FOTO");
            }

            return RedirectToAction(nameof(Edit), new { id });
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ZerarEstoque(int id, string motivo)
        {
            if (string.IsNullOrWhiteSpace(motivo))
            {
                TempData["Erro"] = "Informe o motivo do ajuste.";
                return RedirectToAction(nameof(Index));
            }

            var produto = _context.Produtos.FirstOrDefault(p => p.Id == id);
            if (produto == null) return NotFound();

            var estoqueAnterior = produto.Estoque;

            produto.Estoque = 0;
            await _context.SaveChangesAsync();

            // 📊 REGISTRAR AUDITORIA COM MOTIVO
            var auditoria = new Auditoria
            {
                Usuario = User.Identity?.Name ?? "Sistema",
                Acao = "AJUSTE DE ESTOQUE",
                Produto = produto.Nome,
                Quantidade = estoqueAnterior,
                Tipo = "Produto",
                Motivo = motivo,
                Patrimonio = "-",
                Data = DateTime.Now,
                Ip = HttpContext.Connection.RemoteIpAddress?.ToString()
            };

            _context.Auditorias.Add(auditoria);
            await _context.SaveChangesAsync();

            // ❌ Corrigido: volta para a lista de produtos, não para auditoria
            TempData["Sucesso"] = $"Estoque do produto '{produto.Nome}' zerado com sucesso!";
            return RedirectToAction(nameof(Index));
        }
        [HttpGet]
        public JsonResult BuscarProdutos(string term)
        {
            var produtos = _context.Produtos
                .Where(p => p.Nome.Contains(term))
                .Select(p => new { id = p.Id, label = p.Nome, value = p.Nome })
                .Take(10)
                .ToList();

            return Json(produtos);
        }

    }
}
