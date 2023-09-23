using System;

namespace P03_Trianagle
{
    internal class Program
    {
        static void Main()
        {
            int n = int.Parse(Console.ReadLine());
            for (int i = 0; i < n; i++)
            {
                int loopCount = i + 1;
                int spaceCount = n - loopCount;
                Console.WriteLine($"{new string(' ',spaceCount)}{new string('*',n-spaceCount)}");
            }
        }
    }
}
