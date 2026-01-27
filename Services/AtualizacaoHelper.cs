using Estoque.Data;
using Estoque.Models;

public static class AtualizacaoHelper
{
    public static void Registrar(
        AppDbContext context,
        string titulo,
        string descricao)
    {
        context.AtualizacoesSistema.Add(new AtualizacaoSistema
        {
            Titulo = titulo,
            Descricao = descricao,
            Data = DateTime.Now
        });

        context.SaveChanges();
    }
}
