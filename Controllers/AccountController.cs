using Estoque.Data;
using Estoque.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using System.Security.Claims;

namespace Estoque.Controllers
{
    public class AccountController : Controller
    {
        private readonly AppDbContext _context;
        [Authorize(Roles = "Admin")]
        public IActionResult Index()
        {
            var usuarios = _context.Usuarios.ToList();
            return View(usuarios);
        }
        public AccountController(AppDbContext context)
        {
            _context = context;
        }
        [Authorize(Roles = "Admin")]
        public IActionResult Edit(int id)
        {
            var usuario = _context.Usuarios.FirstOrDefault(u => u.Id == id);
            if (usuario == null)
                return NotFound();

            var vm = new UsuarioEditViewModel
            {
                Id = usuario.Id,
                Nome = usuario.Nome,
                Email = usuario.Email,
                Perfil = usuario.Perfil
            };

            return View(vm);
        }


        [HttpPost]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(UsuarioEditViewModel vm)
        {
            if (!ModelState.IsValid)
                return View(vm);

            var usuarioDb = _context.Usuarios.FirstOrDefault(u => u.Id == vm.Id);
            if (usuarioDb == null)
                return NotFound();

            usuarioDb.Nome = vm.Nome;
            usuarioDb.Email = vm.Email;
            usuarioDb.Perfil = vm.Perfil;

            // 🔑 só altera senha se preenchida
            if (!string.IsNullOrWhiteSpace(vm.Senha))
                usuarioDb.Senha = vm.Senha;

            // ✅ Forçar alteração de senha no próximo login
            usuarioDb.AlterarSenhaProximoLogin = vm.AlterarSenhaProximoLogin;

            _context.SaveChanges();

            _context.UsuarioLogs.Add(new UsuarioLog
            {
                Usuario = User.Identity.Name,
                Acao = "Editou",
                Alvo = usuarioDb.Nome,
                Data = DateTime.Now
            });
            _context.SaveChanges();

            TempData["Sucesso"] = "Usuário atualizado com sucesso!";
            return RedirectToAction("Index");
        }




        [HttpPost, ActionName("Delete")]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public IActionResult DeleteConfirmado(int id)
        {
            var usuario = _context.Usuarios.FirstOrDefault(u => u.Id == id);
            if (usuario == null)
                return NotFound();

            // ❗ Proteção: não permitir excluir último Admin
            if (usuario.Perfil == "Admin" &&
                _context.Usuarios.Count(u => u.Perfil == "Admin") <= 1)
            {
                TempData["Erro"] = "Não é possível excluir o último administrador.";
                return RedirectToAction("Index");
            }

            _context.Usuarios.Remove(usuario);

            _context.UsuarioLogs.Add(new UsuarioLog
            {
                Usuario = User.Identity.Name,
                Acao = "Excluiu",
                Alvo = usuario.Nome,
                Data = DateTime.Now
            });

            _context.SaveChanges();

            TempData["Sucesso"] = "Usuário excluído com sucesso!";
            return RedirectToAction("Index");
        }
        [Authorize(Roles = "Admin")]
        public IActionResult ToggleStatus(int id)
        {
            var usuario = _context.Usuarios.FirstOrDefault(u => u.Id == id);
            if (usuario == null)
                return NotFound();

            // Proteção: não desativar último Admin
            if (usuario.Perfil == "Admin" && usuario.Ativo &&
                _context.Usuarios.Count(u => u.Perfil == "Admin" && u.Ativo) <= 1)
            {
                TempData["Erro"] = "Não é possível desativar o último administrador.";
                return RedirectToAction("Index");
            }

            usuario.Ativo = !usuario.Ativo;

            _context.UsuarioLogs.Add(new UsuarioLog
            {
                Usuario = User.Identity.Name,
                Acao = usuario.Ativo ? "Ativou" : "Desativou",
                Alvo = usuario.Nome,
                Data = DateTime.Now
            });

            _context.SaveChanges();

            TempData["Sucesso"] = usuario.Ativo
                ? "Usuário ativado!"
                : "Usuário desativado!";

            return RedirectToAction("Index");
        }


        // LOGIN (GET)
        [AllowAnonymous]
        public IActionResult Login()
        {
            if (User.Identity != null && User.Identity.IsAuthenticated)
                return RedirectToAction("Index", "Dashboard");
<<<<<<< HEAD
            TempData.Clear();
=======

>>>>>>> eda043ff277b28cbfa62995ac8b7c7925158a77a
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login(string email, string senha)
        {
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(senha))
            {
                ViewBag.Erro = "Preencha email e senha";
                return View();
            }

            // 🔑 Procura usuário pelo email
            var user = _context.Usuarios.FirstOrDefault(u => u.Email == email);

            if (user == null)
            {
                ViewBag.Erro = "Email ou senha inválidos.";
                return View();
            }

            // Se senha não estiver hashada ainda, aceita e atualiza
            if (!user.Senha.StartsWith("$2") && user.Senha == senha)
            {
                user.Senha = Utils.HashSenha(senha);
                _context.SaveChanges();
            }

            // Verifica hash
            if (!Utils.VerificarHashSenha(senha, user.Senha))
            {
                ViewBag.Erro = "Email ou senha inválidos.";
                return View();
            }


            if (!user.Ativo)
            {
                ViewBag.Erro = "Este usuário está desativado. Contate o administrador.";
                return View();
            }

            // 🔹 Verifica se precisa alterar a senha
            if (user.AlterarSenhaProximoLogin)
            {
                // ✅ Passa o Id como query string ou session, não TempData
                return RedirectToAction("TrocarSenha", new { usuarioId = user.Id });
            }

            // 🔑 Autenticação normal
            var claims = new List<Claim>
    {
        new Claim(ClaimTypes.Name, user.Nome),
        new Claim(ClaimTypes.Email, user.Email),
        new Claim(ClaimTypes.Role, user.Perfil ?? "Usuario")
    };

            var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
            await HttpContext.SignInAsync(
                CookieAuthenticationDefaults.AuthenticationScheme,
                new ClaimsPrincipal(identity),
                new AuthenticationProperties
                {
                    IsPersistent = true,
                    ExpiresUtc = DateTime.UtcNow.AddHours(8)
                });

            return RedirectToAction("Index", "Dashboard");
        }

        public static class Utils
        {
            // Cria hash
            public static string HashSenha(string senha)
                => BCrypt.Net.BCrypt.HashPassword(senha);

            // Verifica hash, aceita senha em texto puro se hash estiver inválido
            public static bool VerificarHashSenha(string senha, string hash)
            {
                if (string.IsNullOrEmpty(hash))
                    return false;

                // Se começar com "$2" é hash BCrypt válido
                if (hash.StartsWith("$2"))
                {
                    return BCrypt.Net.BCrypt.Verify(senha, hash);
                }
                else
                {
                    // Senha armazenada em texto puro (antigo)
                    // ⚠️ Se combinar, re-hash e salva no banco
                    if (senha == hash)
                    {
                        // Aqui você precisa re-hash e salvar no banco
                        // Mas Utils não tem acesso ao DbContext, então faça no login
                        return true;
                    }
                    return false;
                }
            }
        }


        // LOGOUT
        [Authorize]
        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToAction("Login");
        }

        // LISTA + CREATE USUÁRIO
        [Authorize(Roles = "Admin")]
        public IActionResult Register()
        {
            // Passa um modelo vazio para criar novo usuário
            var usuario = new Usuario();
            // Lista de usuários e últimos logs
            ViewBag.Usuarios = _context.Usuarios.ToList();
            ViewBag.Logs = _context.UsuarioLogs.OrderByDescending(l => l.Data).Take(10).ToList();
            return View("Create", usuario);
        }

        // CREATE USUÁRIO POST
        [HttpPost]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public IActionResult Register(Usuario usuario)
        {
            if (!ModelState.IsValid)
            {
                ViewBag.Usuarios = _context.Usuarios.ToList();
                ViewBag.Logs = _context.UsuarioLogs.OrderByDescending(l => l.Data).Take(10).ToList();
                return View("Create", usuario);
            }

            if (_context.Usuarios.Any(u => u.Email == usuario.Email))
            {
                ModelState.AddModelError("Email", "Este e-mail já está cadastrado.");
                ViewBag.Usuarios = _context.Usuarios.ToList();
                ViewBag.Logs = _context.UsuarioLogs.OrderByDescending(l => l.Data).Take(10).ToList();
                return View("Create", usuario);
            }

            _context.Usuarios.Add(usuario);
            _context.SaveChanges();

            // Log de ação
            _context.UsuarioLogs.Add(new UsuarioLog
            {
                Usuario = User.Identity.Name,
                Acao = "Criou",
                Alvo = usuario.Nome,
                Data = DateTime.Now
            });
            _context.SaveChanges();

            TempData["Sucesso"] = "Usuário criado com sucesso!";
            return RedirectToAction("Register");
        }
        [HttpGet]
        [AllowAnonymous]
        public IActionResult TrocarSenha(int usuarioId)
        {
            var usuario = _context.Usuarios.FirstOrDefault(u => u.Id == usuarioId);
            if (usuario == null || !usuario.AlterarSenhaProximoLogin)
                return RedirectToAction("Login");

            var vm = new TrocarSenhaViewModel
            {
                UsuarioId = usuarioId
            };

            return View(vm);
        }


        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public IActionResult TrocarSenha(TrocarSenhaViewModel vm)
        {
            if (!ModelState.IsValid)
                return View(vm);

            if (vm.NovaSenha != vm.ConfirmarSenha)
            {
                ModelState.AddModelError("", "As senhas não conferem.");
                return View(vm);
            }

            var usuario = _context.Usuarios.FirstOrDefault(u => u.Id == vm.UsuarioId);
            if (usuario == null)
                return NotFound();

            // 🔑 Salva como hash
            usuario.Senha = Utils.HashSenha(vm.NovaSenha);
            usuario.AlterarSenhaProximoLogin = false;
            _context.SaveChanges();

            TempData["Sucesso"] = "Senha alterada com sucesso! Faça login novamente.";
            return RedirectToAction("Login");
        }



    }
}
