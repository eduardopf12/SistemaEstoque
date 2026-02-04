using Estoque.Models;
using Microsoft.EntityFrameworkCore;

namespace Estoque.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options)
        {
        }

        public DbSet<Produto> Produtos { get; set; }
        public DbSet<Movimentacao> Movimentacoes { get; set; }
        public DbSet<Usuario> Usuarios { get; set; }
        public DbSet<UsuarioLog> UsuarioLogs { get; set; }
        public DbSet<Auditoria> Auditorias { get; set; }
        public DbSet<BackupLog> BackupLogs { get; set; }
        public DbSet<AtualizacaoSistema> AtualizacoesSistema { get; set; }
        public DbSet<AtualizacaoLida> AtualizacoesLidas { get; set; }
<<<<<<< HEAD
       



=======
>>>>>>> eda043ff277b28cbfa62995ac8b7c7925158a77a

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Movimentacao>()
                .HasOne(m => m.Produto)
                .WithMany(p => p.Movimentacoes)
                .HasForeignKey(m => m.ProdutoId);

            modelBuilder.Entity<Usuario>().HasData(
    new Usuario
    {
        Id = 1,
        Nome = "Administrador",
        Email = "admin@admin.com",
        Senha = Utils.HashSenha("123456"), // ✅ já com hash
        Perfil = "Admin",
        Ativo = true,
        AlterarSenhaProximoLogin = false
    }
);





        }

    }


}
