using Microsoft.EntityFrameworkCore;
using Estoque.Data;
using Microsoft.AspNetCore.Authentication.Cookies;
using Rotativa.AspNetCore;

var builder = WebApplication.CreateBuilder(args);

// MVC
builder.Services.AddControllersWithViews();

<<<<<<< HEAD
// Banco
builder.Services.AddDbContext<AppDbContext>(options =>
{
    var cs = builder.Configuration.GetConnectionString("DefaultConnection");
    options.UseMySql(cs, ServerVersion.AutoDetect(cs));
});


// Auth
builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
    .AddCookie();

=======
// DbContext
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseMySql(
        builder.Configuration.GetConnectionString("DefaultConnection"),
        ServerVersion.AutoDetect(
            builder.Configuration.GetConnectionString("DefaultConnection")
        )
    )
);

// 🔐 AUTENTICAÇÃO
builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
    .AddCookie(options =>
    {
        options.LoginPath = "/Account/Login";
        options.LogoutPath = "/Account/Logout";
        options.AccessDeniedPath = "/Account/Login";
    });

// 🔐 AUTORIZAÇÃO
>>>>>>> eda043ff277b28cbfa62995ac8b7c7925158a77a
builder.Services.AddAuthorization();

var app = builder.Build();

<<<<<<< HEAD
// ⚠️ PRODUÇÃO NÃO APLICA MIGRATION AUTOMÁTICA

app.UseExceptionHandler("/Home/Error");
app.UseHsts();

app.UseHttpsRedirection();
app.UseStaticFiles();
=======
// =======================
// CRIA O BANCO AUTOMATICAMENTE
// =======================
using (var scope = app.Services.CreateScope())
{
    var context = scope.ServiceProvider.GetRequiredService<AppDbContext>();
    context.Database.Migrate(); // Cria banco e aplica migrations automaticamente
}

// =======================
// PIPELINE
// =======================
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

>>>>>>> eda043ff277b28cbfa62995ac8b7c7925158a77a
app.UseRouting();

app.UseRotativa();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
<<<<<<< HEAD
    pattern: "{controller=Account}/{action=Login}/{id?}"
);

app.Run();

=======
    pattern: "{controller=Account}/{action=Login}/{id?}");

app.Run();
>>>>>>> eda043ff277b28cbfa62995ac8b7c7925158a77a
