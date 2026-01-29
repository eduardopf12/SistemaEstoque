using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Estoque.Migrations
{
    /// <inheritdoc />
    public partial class AddNotificacoesAtivasEUltimoLogin : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "NotificacoesAtivas",
                table: "Usuarios",
                type: "tinyint(1)",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "NotificacoesAtivas",
                table: "AtualizacoesSistema",
                type: "tinyint(1)",
                nullable: false,
                defaultValue: false);

            migrationBuilder.UpdateData(
                table: "Usuarios",
                keyColumn: "Id",
                keyValue: 1,
                columns: new[] { "NotificacoesAtivas", "Senha" },
                values: new object[] { true, "$2a$11$6EO8rPonZw7spWxGiVhRv.uuGX0HeqSiiYoelMke9KhiPm2Owoflu" });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "NotificacoesAtivas",
                table: "Usuarios");

            migrationBuilder.DropColumn(
                name: "NotificacoesAtivas",
                table: "AtualizacoesSistema");

            migrationBuilder.UpdateData(
                table: "Usuarios",
                keyColumn: "Id",
                keyValue: 1,
                column: "Senha",
                value: "$2a$11$m1m3yAZR1XRHAiGznJExje3FOE90cIQV/ns8LI7vud5vhRaJWSYsy");
        }
    }
}
