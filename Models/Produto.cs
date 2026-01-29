using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Http;

namespace Estoque.Models
{
    public class Produto
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Informe o nome")]
        public string Nome { get; set; } = string.Empty;

        public string? Descricao { get; set; }

        public int Estoque { get; set; }

        public int Quantidade { get; set; }

        // Nome do arquivo salvo no banco
        public string? Foto { get; set; }

        // Upload do arquivo, não vai para o banco
        [NotMapped]
        public IFormFile? FotoUpload { get; set; }

        // Motivo só obrigatório em edição/zerar estoque
        [NotMapped]
        public string Motivo { get; set; } = string.Empty;
        public int EstoqueMinimo { get; set; } // novo campo
        public ICollection<Movimentacao>? Movimentacoes { get; set; }
        public string? Patrimonio { get; set; } // nullable, se alguns produtos não tiverem


    }
}
