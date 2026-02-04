using System.ComponentModel.DataAnnotations;

namespace Estoque.Models
{
    public class BackupLog
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string Acao { get; set; } = string.Empty; // Backup ou Restore

        [Required]
        public string Arquivo { get; set; } = string.Empty;

        public string Usuario { get; set; } = string.Empty;

        public DateTime Data { get; set; } = DateTime.Now;

        public string Status { get; set; } = "Sucesso"; // Sucesso / Erro

        public string? MensagemErro { get; set; }
    }
}
