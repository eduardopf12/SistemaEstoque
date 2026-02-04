using System.ComponentModel.DataAnnotations;

namespace Estoque.Models
{
    public class UsuarioEditViewModel
    {
        public int Id { get; set; }

        [Required]
        public string Nome { get; set; }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

        // 👇 NÃO é obrigatório
        [DataType(DataType.Password)]
        public string? Senha { get; set; }

        [Required]
        public string Perfil { get; set; }

        public bool AlterarSenhaProximoLogin { get; set; }
    }
}

