/**
 * 
 */function searchTable() {
    let input = document.getElementById("search");
    let filter = input.value.toLowerCase();
    let rows = document.querySelectorAll("table tr");

    rows.forEach((row, index) => {
        if (index === 0) return;
        let text = row.innerText.toLowerCase();
        row.style.display = text.includes(filter) ? "" : "none";
    });
}