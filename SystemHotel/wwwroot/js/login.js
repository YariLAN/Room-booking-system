let block = document.getElementById("login");
let formLogin = document.querySelector("div.cm-modal");
let formRegistr = document.querySelector('[data-cm-modal="registration"]');
let closeForm = document.querySelectorAll('[aria-label="Close"]');

let registr = document.getElementById("Registration");
let login = document.getElementById("logAccount");

block.onclick = function () {
    formLogin.classList.add("is-open");
}

closeForm[0].onclick = function () {
    formLogin.classList.remove("is-open");
}
closeForm[1].onclick = function () {
    formRegistr.classList.remove("is-open");
}

registr.onclick = function () {
    formRegistr.classList.add("is-open");
    formLogin.classList.remove("is-open");
}

login.onclick = function () {
    formRegistr.classList.remove("is-open");
    formLogin.classList.add("is-open");
}

