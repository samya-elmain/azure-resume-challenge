window.addEventListener('DOMContentLoaded', (event) => {
    getVisitCount();
});
const functionApi = 'https://azresume-linux-function-app.azurewebsites.net/api/HttpTrigger1';
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
