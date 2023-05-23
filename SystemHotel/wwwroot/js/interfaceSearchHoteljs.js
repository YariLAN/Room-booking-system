var tr = document.querySelectorAll("result-Search-Hotel");

for (let i = 0; i < tr.length; i++) {

    tr[i].onmouseover = function () {

        tr[i].classList.add("current");
    }
    tr[i].onmouseout = function () {
        tr[i].classList.remove("current");
    }
}