using System;

namespace Estoque.Models
{
    public class Auditoria
    {
        public int Id { get; set; }
        public string Usuario { get; set; }
        public string Acao { get; set; }
        public string Produto { get; set; }
        public int Quantidade { get; set; }
        public string Tipo { get; set; }
        public string Patrimonio { get; set; }
        public DateTime Data { get; set; }
        public string Ip { get; set; }
        public string? Motivo { get; set; }
        public string Entidade { get; set; }

        public string? Foto { get; set; }
        public string? FotoAuditoria { get; set; }


       


    }
}
