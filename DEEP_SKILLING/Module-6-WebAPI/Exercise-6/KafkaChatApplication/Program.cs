namespace KafkaChatApplication
{
    internal class Program
    {
        static async Task Main(string[] args)
        {
            Console.WriteLine("=====================================");
            Console.WriteLine(" Kafka Chat Application");
            Console.WriteLine("=====================================");

            Console.Write("Enter Message : ");

            string message = Console.ReadLine()!;

            await Producer.SendMessage(message);

            Console.WriteLine();

            Console.WriteLine("Starting Consumer...");

            Consumer.ReceiveMessages();
        }
    }
}