import json
import os
import azure.functions as func
from azure.data.tables import TableServiceClient, TableClient, TableEntity, UpdateMode

def func_update_counter(num: int):
    return num+1

def main(req: func.HttpRequest, messageJSON) -> func.HttpResponse:
    try:
        data = json.loads(messageJSON)
        number = int(data[0]['number'])
    except (KeyError, IndexError):
        number = 0  # Default value when 'number' key is missing or JSON is empty

    updated_counter = func_update_counter(number)
    updated_entity = {
        'PartitionKey':'count',
        'RowKey':'visit_count',
        'number': updated_counter
    }
    #Connect to table API
    connection_string = os.environ['AzureTableEndpoint']
    service = TableServiceClient.from_connection_string(conn_str=connection_string)
    counter_table = service.get_table_client('counter')
    counter_table.update_entity(mode=UpdateMode.REPLACE, entity=updated_entity)

    
    return func.HttpResponse(f"{updated_counter}")
