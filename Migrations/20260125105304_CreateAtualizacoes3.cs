using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Estoque.Migrations
{
    /// <inheritdoc />
    public partial class CreateAtualizacoes3 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<DateTime>(
                name: "UltimoLogin",
                table: "Usuarios",
                type: "datetime(6)",
                nullable: true);

            migrationBuilder.UpdateData(
                table: "Usuarios",
                keyColumn: "Id",
                keyValue: 1,
                column: "UltimoLogin",
                value: null);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "UltimoLogin",
                table: "Usuarios");
        }
    }
}
