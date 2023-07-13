# azure-resume-challenge ☁️
The [cloud resume challenge](https://cloudresumechallenge.dev/docs/the-challenge/azure/) is a challenge by Forrest Brazeal to help people to prepare for a job in the cloud industry.
## Project Description
This project is a simple resume website that displays a count of how many times the website has been visited. The website consists of a front-end and a back-end, which are hosted using Azure services. The front-end is built using HTML, CSS, and JavaScript, and is hosted in an Azure Storage account. The back-end is built using Python and Azure Functions, and uses Azure's Table API in Cosmos DB to store and update the count.
![image](https://github.com/samya-elmain/azure-resume-challenge/assets/93472667/e836b2be-9d3d-4510-ace2-f5d542c26fde)


## Technologies Used
The project uses a variety of technologies, including:

HTML, CSS, and JavaScript for the front-end
Python and Azure Functions for the back-end
Azure Storage account to host the front-end
Azure's Table API in Cosmos DB for data storage
Terraform for Infrastructure as Code
GitHub Actions for continuous integration and deployment
Deployment Process
The website is deployed using Infrastructure as Code with Terraform. This approach allows for version control, automated testing, and repeatability. The continuous integration and deployment pipeline is managed using GitHub Actions, which automates the software development workflows. There are two pipelines, one for the front-end and one for the back-end. The front-end pipeline updates the Azure Storage blob automatically when new website code is pushed, and the back-end pipeline builds a zip artifact, tests the code, runs Terraform, and deploys the Python code to the Azure Function resources.

## Project Goals
The goal of this project is to demonstrate proficiency in using Azure services to build and deploy a cloud-based website. The website is scalable, cost-effective, and fully managed using Azure services. The project showcases the use of Infrastructure as Code and continuous integration and deployment to automate the deployment process, ensuring that the website is always up-to-date and running smoothly.

## Helpful resources

### Static website tutorials
follow these four tutorials from Azure on [static site setup](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-static-website-how-to?tabs=azure-portal), [Azure CDN endpoint setup](https://learn.microsoft.com/en-us/azure/cdn/cdn-create-new-endpoint), [custom domain names](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-custom-domain-name?tabs=azure-portal), and [HTTPS for Azure CDN](https://learn.microsoft.com/en-us/azure/cdn/cdn-custom-ssl?tabs=option-1-default-enable-https-with-a-cdn-managed-certificate).

### Azure Function
* [Azure Functions with an HTTP trigger](https://learn.microsoft.com/en-us/azure/azure-functions/functions-bindings-http-webhook?tabs=in-process%2Cfunctionsv2&pivots=programming-language-python)
* How to [ Set up the HTTP trigger for your Azure Function](https://learn.microsoft.com/en-us/azure/azure-functions/functions-bindings-http-webhook?tabs=in-process%2Cfunctionsv2&pivots=programming-language-python)

### CI/CD (Continuous Integration / Continuous Deployment)
GitHub Actions has a nice [learning section](https://docs.github.com/en/actions/learn-github-actions) that's worth reading before you get hands-on. Mainly you'll want to be sure you're [handling authentication between GitHub and Azure](https://learn.microsoft.com/en-us/azure/developer/github/connect-from-azure?tabs=azure-portal%2Clinux) appropriately.


