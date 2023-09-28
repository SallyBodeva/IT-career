using System;

namespace P06_Recursion
{
    internal class Program
    {
        static void Main()
        {
            PrintNums(10);
            Console.WriteLine(SumNaturalNums(10));
        }
        public static void PrintNums(int n)
        {
            if (n == 0)
            {
                return;
            }
            PrintNums(n - 1);
            Console.Write(n + " ");
        }
        public static int SumNaturalNums(int n)
        {
            if (n == 1)
            {
                return 1;
            }
            else
            {
                return n + SumNaturalNums(n - 1);
            }
        }
        public static int sumOddNum(int n)
        {
            if (n==1)
            {
                return 1;
            }
            return n + sumOddNum(n - 2);
        }
    }
}
