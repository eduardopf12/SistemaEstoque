using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Estoque.Models
{
    public class AtualizacaoLida
    {
        [Key]
        public int Id { get; set; }

        [ForeignKey("Usuario")]
        public int UsuarioId { get; set; }
        public Usuario Usuario { get; set; }

        [ForeignKey("AtualizacaoSistema")]
        public int AtualizacaoSistemaId { get; set; }
        public AtualizacaoSistema AtualizacaoSistema { get; set; }

        public DateTime DataLeitura { get; set; } = DateTime.Now;
    }
}
