# 📦 Sistema de Estoque

## 📌 Visão Geral
O **Sistema de Estoque** é uma aplicação web desenvolvida em **ASP.NET Core MVC**, com foco no controle completo de produtos, movimentações, auditoria e segurança. O sistema foi projetado para uso real em ambientes corporativos, priorizando organização, rastreabilidade e boas práticas de arquitetura.

---

## 🎯 Objetivo do Sistema
Permitir o gerenciamento eficiente de estoque, garantindo:
- Controle preciso de entradas e saídas
- Rastreabilidade de ações dos usuários
- Segurança das informações
- Facilidade de manutenção e evolução

---

## 🧩 Funcionalidades Principais

### 🔐 Autenticação e Segurança
- Login com autenticação
- Controle de acesso por perfil
- Proteção contra CSRF
- Auditoria de ações dos usuários

### 📦 Produtos
- Cadastro, edição e exclusão lógica
- Controle de estoque mínimo
- Upload de imagem do produto
- Histórico completo por produto

### 🔄 Movimentações de Estoque
- Entrada e saída de produtos
- Validações de regra de negócio
- Transações para evitar inconsistências

### 🧾 Auditoria do Sistema
- Registro de ações (criar, editar, excluir, login, backup)
- Usuário responsável
- Data e hora da ação

### 💾 Backup e Restauração
- Backup manual do banco de dados
- Restauração segura
- Registro de logs de backup

### 📊 Dashboard
- Indicadores gerais do estoque
- Últimas movimentações
- Alertas de estoque mínimo

---

## 🏗️ Estrutura do Projeto

```
Estoque/
├── Controllers/
├── Data/
├── Migrations/
├── Models/
├── Services/
├── Views/
├── wwwroot/
├── appsettings.json
├── Program.cs
└── Dockerfile
```

---

## 🛠️ Tecnologias Utilizadas
- ASP.NET Core MVC (C#)
- Entity Framework Core
- **MySQL**
- Bootstrap 5
- Docker

---

## 🚀 Como Executar o Projeto

### Pré-requisitos
- .NET SDK instalado
- **MySQL Server**
- Visual Studio

### Passos
1. Clone o repositório
2. Configure a string de conexão em `appsettings.json`
3. Execute as migrations
4. Inicie o projeto

---

## 📈 Evoluções Futuras
- API REST
- Integração com leitores de código de barras
- Relatórios avançados
- Notificações automáticas

---

## 👨‍💻 Autor
Sistema desenvolvido por **Eduardo Ferreira**.

---

> Este projeto segue boas práticas de arquitetura, organização e segurança, sendo adequado para uso real e também como portfólio profissional.

# SistemaEstoque
