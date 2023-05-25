import pytest
import requests
def test_api():
    # Define the URL of your deployed Azure Function API
    url = "https://azurefunctioncount.azurewebsites.net/api/httptrigger1"

    # Make a request to your API endpoint
    response = requests.get(url)

    # Assert that the response has a successful status code (e.g., 200)
    assert response.status_code == 200

    # Assert other conditions based on your expected API behavior
    # For example, check if the response contains the expected data or if the database is updated correctly.
    # You can also test for edge cases and unexpected input scenarios.
    # Example assertions:
    # assert response.json()["data"] == expected_data
    # assert response.json()["success"] is True
