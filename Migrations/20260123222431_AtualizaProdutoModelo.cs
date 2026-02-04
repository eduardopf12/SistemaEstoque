using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Estoque.Migrations
{
    /// <inheritdoc />
    public partial class AtualizaProdutoModelo : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Motivo",
                table: "Produtos");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Motivo",
                table: "Produtos",
                type: "longtext",
                nullable: false)
                .Annotation("MySql:CharSet", "utf8mb4");
        }
    }
}
