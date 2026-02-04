using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Estoque.Migrations
{
    /// <inheritdoc />
    public partial class AddCamposMovimentacao4 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Foto",
                table: "Movimentacoes",
                type: "longtext",
                nullable: true)
                .Annotation("MySql:CharSet", "utf8mb4");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Foto",
                table: "Movimentacoes");
        }
    }
}
