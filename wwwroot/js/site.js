// Salva última página visitada
document.addEventListener("DOMContentLoaded", () => {
    if (window.location.pathname !== "/Account/Login") {
        localStorage.setItem("ultimaPagina", window.location.pathname);
    }
});
