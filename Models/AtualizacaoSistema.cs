using System;
using System.ComponentModel.DataAnnotations;

namespace Estoque.Models
{
    public class AtualizacaoSistema
    {
        public int Id { get; set; }

        [Required]
        public string Titulo { get; set; } = string.Empty;

        [Required]
        public string Descricao { get; set; } = string.Empty;

        public DateTime Data { get; set; } = DateTime.Now;
        public string Tipo { get; set; } = "sistema";
        public string? Patrimonio { get; set; } 
        public string? ProdutoNome { get; set; }
    }
}
