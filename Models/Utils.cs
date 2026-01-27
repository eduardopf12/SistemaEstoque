using BCrypt.Net;
using Org.BouncyCastle.Crypto.Generators;

public static class Utils
{
    public static string HashSenha(string senha)
        => BCrypt.Net.BCrypt.HashPassword(senha);

    public static bool VerificarHashSenha(string senha, string hash)
        => BCrypt.Net.BCrypt.Verify(senha, hash);
}
