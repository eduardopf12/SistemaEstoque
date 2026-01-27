using System;

namespace Estoque.Models
{
    public class UsuarioLog
    {
        public int Id { get; set; }
        public string Usuario { get; set; } // Quem realizou a ação
        public string Acao { get; set; } // Criar / Editar / Excluir
        public string Alvo { get; set; } // Nome do usuário afetado
        public DateTime Data { get; set; } = DateTime.Now;
    }
}
