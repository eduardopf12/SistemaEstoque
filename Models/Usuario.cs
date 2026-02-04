using System.ComponentModel.DataAnnotations;

namespace Estoque.Models
{
    public class Usuario
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string Nome { get; set; }

        [Required]
        public string Email { get; set; }

        [Required]
        public string Senha { get; set; }

        public string Perfil { get; set; } // Admin / Usuario

        public bool Ativo { get; set; } = true;

        public DateTime? UltimoLogin { get; set; }
        public DateTime? UltimaLeituraAtualizacoes { get; set; }

        public bool AlterarSenhaProximoLogin { get; set; }


    }
}
