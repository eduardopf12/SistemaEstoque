using System;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Estoque.Migrations
{
    /// <inheritdoc />
    public partial class CreateAtualizacoes5 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "UltimoLogin",
                table: "AtualizacoesSistema");

            migrationBuilder.CreateTable(
                name: "AtualizacoesLidas",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    UsuarioId = table.Column<int>(type: "int", nullable: false),
                    AtualizacaoSistemaId = table.Column<int>(type: "int", nullable: false),
                    DataLeitura = table.Column<DateTime>(type: "datetime(6)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AtualizacoesLidas", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AtualizacoesLidas_AtualizacoesSistema_AtualizacaoSistemaId",
                        column: x => x.AtualizacaoSistemaId,
                        principalTable: "AtualizacoesSistema",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_AtualizacoesLidas_Usuarios_UsuarioId",
                        column: x => x.UsuarioId,
                        principalTable: "Usuarios",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateIndex(
                name: "IX_AtualizacoesLidas_AtualizacaoSistemaId",
                table: "AtualizacoesLidas",
                column: "AtualizacaoSistemaId");

            migrationBuilder.CreateIndex(
                name: "IX_AtualizacoesLidas_UsuarioId",
                table: "AtualizacoesLidas",
                column: "UsuarioId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AtualizacoesLidas");

            migrationBuilder.AddColumn<DateTime>(
                name: "UltimoLogin",
                table: "AtualizacoesSistema",
                type: "datetime(6)",
                nullable: true);
        }
    }
}
