import asyncio
import aiormq

# Dostarcz swoje dane dostępowe do Service Bus w poniższych zmiennych
hostname = "ServiceBusURL"
username = "SharedAccessKeyName"
password = "KeyPassword"


async def on_connection_open(connection):
    channel = await connection.channel()
    await on_channel_open(channel)

async def on_channel_open(channel):
    print("Channel opened.")
    await channel.close()
    await connection.close()

async def connect_to_service_bus():
    connection = None
    try:
        # Nawiązanie połączenia
        connection = await aiormq.connect(
            f"amqps://{username}:{password}@{hostname}:5671/"
        )
        await on_connection_open(connection)
    except Exception as e:
        print(f"Error during connection: {e}")
    finally:
        if connection is not None:
            await connection.close()

if __name__ == "__main__":
    asyncio.run(connect_to_service_bus())