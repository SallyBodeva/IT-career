using System;

namespace P06_Recursion
{
    internal class Program
    {
        static void Main()
        {
            PrintNums(10);
        }
        public static void PrintNums(int n)
        {
            if (n == 0)
            {
                return;
            }
            PrintNums(n - 1);
            Console.Write(n+" ");
        }
    }
}
