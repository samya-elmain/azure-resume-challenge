window.addEventListener('DOMContentLoaded', (event) => {
    getVisitCount();
});
const functionApi = 'https://azurefunctioncount.azurewebsites.net/api/httptrigger1';

const getVisitCount = () => {
    let count = 30;
    fetch(functionApi)
        .then(response => response.json())
        .then(data => {
            console.log("Website called function API.");
            console.log(data);
            count = data;
            document.getElementById("counter").innerText = count;
        })
        .catch(error => {
            console.log(error);
        });
};
