using Estoque.Data;
using Estoque.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MySql.Data.MySqlClient;


namespace EstoqueWeb.Controllers
{
    [Authorize(Roles = "Admin")]
    public class BackupController : Controller

    {
        private readonly AppDbContext _context;
        private readonly string pastaBackup;

        public BackupController(AppDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            pastaBackup = Path.Combine(env.WebRootPath, "backups");

            if (!Directory.Exists(pastaBackup))
                Directory.CreateDirectory(pastaBackup);
        }

        private string GetConnectionString()
            => _context.Database.GetDbConnection().ConnectionString;

        // 📄 Página principal
        public IActionResult Index()
        {
            var backups = Directory.GetFiles(pastaBackup, "*.sql")
                                   .Select(f => new FileInfo(f))
                                   .OrderByDescending(f => f.CreationTime)
                                   .ToList();

            return View(backups);
        }

        // 💾 BACKUP
        [HttpPost]
    
        public IActionResult FazerBackup()
        {
            string fileName = $"backup_{DateTime.Now:yyyyMMdd_HHmmss}.sql";

            try
            {
                string fullPath = Path.Combine(pastaBackup, fileName);

                using var conn = new MySqlConnection(GetConnectionString());
                using var cmd = new MySqlCommand();
                using var mb = new MySqlBackup(cmd);

                cmd.Connection = conn;
                conn.Open();

                mb.ExportToFile(fullPath);

                _context.BackupLogs.Add(new BackupLog
                {
                    Acao = "Backup",
                    Arquivo = fileName,
                    Usuario = User.Identity!.Name!
                });

                _context.SaveChanges();

                TempData["Mensagem"] = "Backup realizado com sucesso!";
            }
            catch (Exception ex)
            {
                _context.BackupLogs.Add(new BackupLog
                {
                    Acao = "Backup",
                    Arquivo = fileName,
                    Usuario = User.Identity!.Name!,
                    Status = "Erro",
                    MensagemErro = ex.Message
                });

                _context.SaveChanges();

                TempData["Erro"] = ex.Message;
            }

            return RedirectToAction("Index");
        }


        // ♻️ RESTAURAR

        [HttpPost]
        public IActionResult RestaurarBackup(string fileName)
        {
            if (string.IsNullOrWhiteSpace(fileName))
            {
                TempData["Erro"] = "Nome do arquivo inválido.";
                return RedirectToAction("Index");
            }

            string fullPath = Path.Combine(pastaBackup, fileName);

            if (!System.IO.File.Exists(fullPath))
            {
                TempData["Erro"] = "Arquivo de backup não encontrado.";
                return RedirectToAction("Index");
            }

            try
            {
                using var conn = new MySqlConnection(GetConnectionString());
                using var cmd = new MySqlCommand();
                using var mb = new MySqlBackup(cmd);

                cmd.Connection = conn;
                conn.Open();

                mb.ImportFromFile(fullPath);

                _context.BackupLogs.Add(new BackupLog
                {
                    Acao = "Restore",
                    Arquivo = fileName,
                    Usuario = User.Identity!.Name!,
                    Status = "Sucesso"
                });

                _context.SaveChanges();

                TempData["Mensagem"] = "Banco restaurado com sucesso!";
            }
            catch (Exception ex)
            {
                _context.BackupLogs.Add(new BackupLog
                {
                    Acao = "Restore",
                    Arquivo = fileName,
                    Usuario = User.Identity!.Name!,
                    Status = "Erro",
                    MensagemErro = ex.Message
                });

                _context.SaveChanges();

                TempData["Erro"] = "Erro ao restaurar: " + ex.Message;
            }

            return RedirectToAction("Index");
        }




        // ⬇️ DOWNLOAD
        public IActionResult DownloadBackup(string fileName)
        {
            string fullPath = Path.Combine(pastaBackup, fileName);
            if (!System.IO.File.Exists(fullPath))
                return NotFound();

            return PhysicalFile(fullPath, "application/sql", fileName);
        }

        public IActionResult Historico()
        {
            var logs = _context.BackupLogs
                .OrderByDescending(l => l.Data)
                .ToList();

            return View(logs);
        }

        [HttpPost]
<<<<<<< HEAD
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ExcluirBackup(string fileName)
        {
            if (string.IsNullOrWhiteSpace(fileName))
            {
                TempData["Erro"] = "Nome do arquivo inválido.";
                return RedirectToAction(nameof(Historico));
            }

            try
            {
                // 📁 Caminho do arquivo
                string fullPath = Path.Combine(pastaBackup, fileName);

                // 🗑️ Apaga o arquivo físico
                if (System.IO.File.Exists(fullPath))
                    System.IO.File.Delete(fullPath);

                // 🧹 REMOVE O LOG DO BANCO
                var log = await _context.BackupLogs
                    .FirstOrDefaultAsync(l => l.Arquivo == fileName);

                if (log != null)
                {
                    _context.BackupLogs.Remove(log);
                    await _context.SaveChangesAsync();
                }
=======
        public IActionResult ExcluirBackup(string fileName)
        {
            try
            {
                string fullPath = Path.Combine(pastaBackup, fileName);

                if (System.IO.File.Exists(fullPath))
                    System.IO.File.Delete(fullPath);

                _context.BackupLogs.Add(new BackupLog
                {
                    Acao = "Excluir Backup",
                    Arquivo = fileName,
                    Usuario = User.Identity!.Name!
                });

                _context.SaveChanges();
>>>>>>> eda043ff277b28cbfa62995ac8b7c7925158a77a

                TempData["Mensagem"] = "Backup excluído com sucesso!";
            }
            catch (Exception ex)
            {
<<<<<<< HEAD
                TempData["Erro"] = "Erro ao excluir backup: " + ex.Message;
            }

            return RedirectToAction(nameof(Historico));
        }



=======
                TempData["Erro"] = ex.Message;
            }

            return RedirectToAction("Index");
        }


>>>>>>> eda043ff277b28cbfa62995ac8b7c7925158a77a
    }
}
