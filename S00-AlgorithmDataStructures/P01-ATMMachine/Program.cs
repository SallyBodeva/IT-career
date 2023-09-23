using System;

namespace P01_ATMMachine
{
    public class Program
    {
        static void Main()
        {
            int money = int.Parse(Console.ReadLine());
            int banknotes = 0;
            while (money!=0)
            {
                if (money/50!=0)
                {
                    banknotes++;
                    money = money-=50;
                    continue;
                }
                if (money / 20 != 0)
                {
                    banknotes++;
                    money = money -= 20;
                    continue;
                }
                if (money / 10 != 0)
                {
                    banknotes++;
                    money = money -= 10;
                    continue;
                }
                if (money / 5 != 0)
                {
                    banknotes++;
                    money = money -= 5;
                    continue;
                }
                if (money / 2 != 0)
                {
                    banknotes++;
                    money = money -= 2;
                    continue;
                }
                if (money / 1 != 0)
                {
                    banknotes++;
                    money = money -= 1;
                    continue;
                }
            }
            Console.WriteLine(banknotes);
        }
    }
}
