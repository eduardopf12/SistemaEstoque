using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Estoque.Migrations
{
    /// <inheritdoc />
    public partial class CreateTabelaAtualizacoes5 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "FotoAntes",
                table: "Auditorias",
                type: "longtext",
                nullable: true)
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.AddColumn<string>(
                name: "FotoDepois",
                table: "Auditorias",
                type: "longtext",
                nullable: true)
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.UpdateData(
                table: "Usuarios",
                keyColumn: "Id",
                keyValue: 1,
                column: "Senha",
                value: "$2a$11$F3lXosn2RKiD9HB5UTSZ/umW/yTvh7IEQaaYkot3a72rzQo2t1vy.");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "FotoAntes",
                table: "Auditorias");

            migrationBuilder.DropColumn(
                name: "FotoDepois",
                table: "Auditorias");

            migrationBuilder.UpdateData(
                table: "Usuarios",
                keyColumn: "Id",
                keyValue: 1,
                column: "Senha",
                value: "$2a$11$.PaVlj8NRGdKO7OvQKxmX.Ga3QkgVvn/B9NF6pEq0EHRxWLatyVha");
        }
    }
}
