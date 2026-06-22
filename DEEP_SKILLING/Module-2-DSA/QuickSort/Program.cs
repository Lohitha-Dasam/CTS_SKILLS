using System;

class Program
{
    static int Partition(int[] arr, int low, int high)
    {
        int pivot = arr[high];
        int i = low - 1;

        for (int j = low; j < high; j++)
        {
            if (arr[j] < pivot)
            {
                i++;

                int temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
        }

        int t = arr[i + 1];
        arr[i + 1] = arr[high];
        arr[high] = t;

        return i + 1;
    }

    static void QuickSortAlgo(int[] arr, int low, int high)
    {
        if (low < high)
        {
            int pi = Partition(arr, low, high);

            QuickSortAlgo(arr, low, pi - 1);
            QuickSortAlgo(arr, pi + 1, high);
        }
    }

    static void Main()
    {
        int[] arr = { 10, 7, 8, 9, 1, 5 };

        QuickSortAlgo(arr, 0, arr.Length - 1);

        Console.WriteLine(string.Join(" ", arr));
    }
}