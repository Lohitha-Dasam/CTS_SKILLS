using System.Collections.Generic;

namespace RetailInventory.Models
{
    public class Tag
    {
        public int Id { get; set; }

        public string Name { get; set; } = string.Empty;

        // Many-to-Many
        public List<Product> Products { get; set; } = new();
    }
}