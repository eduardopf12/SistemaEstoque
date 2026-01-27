using Estoque.Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

[Authorize]
public class AtualizacoesController : Controller
{
    private readonly AppDbContext _context;

    public AtualizacoesController(AppDbContext context)
    {
        _context = context;
    }



    public async Task<IActionResult> Historico()
    {
        var atualizacoes = await _context.AtualizacoesSistema
            .OrderByDescending(a => a.Data)
            .ToListAsync();

        return View(atualizacoes);
    }
}
