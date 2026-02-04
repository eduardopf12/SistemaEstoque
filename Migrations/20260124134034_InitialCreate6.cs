using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Estoque.Migrations
{
    /// <inheritdoc />
    public partial class InitialCreate6 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Responsavel",
                table: "Produtos");

            migrationBuilder.DropColumn(
                name: "Setor",
                table: "Produtos");

            migrationBuilder.DropColumn(
                name: "Tipo",
                table: "Produtos");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Responsavel",
                table: "Produtos",
                type: "longtext",
                nullable: true)
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.AddColumn<string>(
                name: "Setor",
                table: "Produtos",
                type: "longtext",
                nullable: true)
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.AddColumn<string>(
                name: "Tipo",
                table: "Produtos",
                type: "longtext",
                nullable: true)
                .Annotation("MySql:CharSet", "utf8mb4");
        }
    }
}
