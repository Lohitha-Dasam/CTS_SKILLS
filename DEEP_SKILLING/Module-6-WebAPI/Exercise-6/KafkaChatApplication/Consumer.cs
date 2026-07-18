using Confluent.Kafka;

namespace KafkaChatApplication
{
    public class Consumer
    {
        public static void ReceiveMessages()
        {
            var config = new ConsumerConfig
            {
                BootstrapServers = "localhost:9092",
                GroupId = "chat-group",
                AutoOffsetReset = AutoOffsetReset.Earliest
            };

            using var consumer =
                new ConsumerBuilder<Ignore, string>(config).Build();

            consumer.Subscribe("chat-topic");

            Console.WriteLine("Waiting for messages...");

            try
            {
                while (true)
                {
                    var result = consumer.Consume();

                    Console.WriteLine($"Received : {result.Message.Value}");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                consumer.Close();
            }
        }
    }
}