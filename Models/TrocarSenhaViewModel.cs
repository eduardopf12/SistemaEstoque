namespace Estoque.Models
{
    public class TrocarSenhaViewModel
    {
        public int UsuarioId { get; set; }
        public string NovaSenha { get; set; } = string.Empty;
        public string ConfirmarSenha { get; set; } = string.Empty;
    }
}
