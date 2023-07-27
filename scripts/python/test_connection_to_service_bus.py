import asyncio
from azure.servicebus.aio import ServiceBusClient
from azure.servicebus import ServiceBusMessage
import pika
import ssl

NAMESPACE_CONNECTION_STR = "ServiceBusEndpoint"
QUEUE_NAME = "test"

async def send_single_message(sender):
    # Create a Service Bus message and send it to the queue
    message = ServiceBusMessage("Single Message")
    await sender.send_messages(message)
    print("Sent a single message")

async def send_a_list_of_messages(sender):
    # Create a list of messages and send it to the queue
    messages = [ServiceBusMessage("Message in list") for _ in range(5)]
    await sender.send_messages(messages)
    print("Sent a list of 5 messages")

async def send_batch_message(sender):
    # Create a batch of messages
    async with sender:
        batch_message = await sender.create_message_batch()
        for _ in range(10):
            try:
                # Add a message to the batch
                batch_message.add_message(ServiceBusMessage("Message inside a ServiceBusMessageBatch"))
            except ValueError:
                # ServiceBusMessageBatch object reaches max_size.
                # New ServiceBusMessageBatch object can be created here to send more data.
                break
        # Send the batch of messages to the queue
        await sender.send_messages(batch_message)
    print("Sent a batch of 10 messages")

async def run():
    # create a Service Bus client using the connection string
    async with ServiceBusClient.from_connection_string(
        conn_str=NAMESPACE_CONNECTION_STR,
        logging_enable=True) as servicebus_client:
        # Get a Queue Sender object to send messages to the queue
        sender = servicebus_client.get_queue_sender(queue_name=QUEUE_NAME)
        async with sender:
            # Send one message
            await send_single_message(sender)
            # Send a list of messages
            await send_a_list_of_messages(sender)
            # Send a batch of messages
            await send_batch_message(sender)

def connect_to_service_bus():
    #   Dostarcz swoje dane dostępowe do Service Bus w poniższych zmiennych
    hostname = "ServiceBusURL"
    username = "SharedAccessKeyName"
    password = "KeyPassword"

    # Włączamy szyfrowanie TLS 1.2
    context = ssl.create_default_context()
    context.set_ciphers('DEFAULT@SECLEVEL=1')

    # Tworzymy połączenie z serwerem RabbitMQ
    parameters = pika.ConnectionParameters(
        host=hostname,
        port=5671,  # Domyślny port AMQPS (RabbitMQ z TLS)
        virtual_host='/',
        credentials=pika.PlainCredentials(username, password),
        ssl_options=pika.SSLOptions(context)  # Włączamy TLS
    )

    connection = pika.BlockingConnection(parameters)
    channel = connection.channel()

    channel.basic_publish(exchange='',
                    routing_key='test',
                    body='Hello, Azure Service Bus!')

    print("Message sent.")
    connection.close()

if __name__=="__main__":
    # asyncio.run(run())
    connect_to_service_bus()
    # print("Done sending messages")
    print("-----------------------")