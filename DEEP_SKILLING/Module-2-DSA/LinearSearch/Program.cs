using System;

class Program
{
    static int LinearSearch(int[] arr, int key)
    {
        for (int i = 0; i < arr.Length; i++)
        {
            if (arr[i] == key)
                return i;
        }
        return -1;
    }

    static void Main()
    {
        int[] arr = { 10, 20, 30, 40, 50 };

        int result = LinearSearch(arr, 30);

        Console.WriteLine("Index: " + result);
    }
}