using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Estoque.Migrations
{
    /// <inheritdoc />
    public partial class RelacionamentoProdutoMovimentacao : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
                name: "IX_Movimentacoes_ProdutoId",
                table: "Movimentacoes",
                column: "ProdutoId");

            migrationBuilder.AddForeignKey(
                name: "FK_Movimentacoes_Produtos_ProdutoId",
                table: "Movimentacoes",
                column: "ProdutoId",
                principalTable: "Produtos",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Movimentacoes_Produtos_ProdutoId",
                table: "Movimentacoes");

            migrationBuilder.DropIndex(
                name: "IX_Movimentacoes_ProdutoId",
                table: "Movimentacoes");
        }
    }
}
