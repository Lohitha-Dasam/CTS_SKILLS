using Microsoft.EntityFrameworkCore;
using RetailInventory.Data;

namespace RetailInventory
{
    internal class Program
    {
        static async Task Main(string[] args)
        {
            using var context = new AppDbContext();

            Console.WriteLine("=====================================");
            Console.WriteLine(" Lab 15 - Optimistic Concurrency ");
            Console.WriteLine("=====================================\n");

            try
            {
                var product = await context.Products.FirstOrDefaultAsync();

                if (product != null)
                {
                    product.Price += 1000;

                    await context.SaveChangesAsync();

                    Console.WriteLine("Product updated successfully.");
                }
                else
                {
                    Console.WriteLine("No product found.");
                }
            }
            catch (DbUpdateConcurrencyException)
            {
                Console.WriteLine("Concurrency conflict detected.");
            }

            Console.WriteLine();
            Console.WriteLine("Lab 15 Completed Successfully.");
        }
    }
}