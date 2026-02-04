using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Estoque.Models
{
    public class Movimentacao
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public int ProdutoId { get; set; }

        [Required]
        public string Tipo { get; set; } = string.Empty;

        [Required]
        public int Quantidade { get; set; }

        [Required]
        public string Unidade { get; set; } = string.Empty;

        [Required]
        public string Setor { get; set; } = string.Empty;

        [Required(ErrorMessage = "O patrimônio é obrigatório")]
        public string Patrimonio { get; set; }

        // ✅ Nova coluna para armazenar o nome do arquivo
        public string? Foto { get; set; }

        // ✅ Apenas para upload no formulário, não será mapeado no banco
        [NotMapped]
        public IFormFile? FotoUpload { get; set; }

        public DateTime Data { get; set; } = DateTime.Now;

        [ForeignKey("ProdutoId")]
        public Produto? Produto { get; set; }
    }
}
