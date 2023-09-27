using System;
using System.Collections.Generic;
using System.Linq;

namespace P07_Connections
{
    internal class Program
    {
        static void Main()
        {
            string command = string.Empty;
            List<string> lakes = new List<string>();
            int connectedCount = 0;
            while ((command = Console.ReadLine()) != "end")
            {
                lakes.Add(command);
            }
            for (int i = 0; i < lakes.Count; i++)
            {
                string currentLake = lakes[i];
                for (int j = 0; j < lakes.Count; j++)
                {
                    string secondCurrentLake = lakes[j];
                    if (currentLake == new string(secondCurrentLake.Reverse().ToArray()))
                    {
                        char[] letters = currentLake.ToCharArray();
                        Console.WriteLine($"{letters[0]}<->{letters[1]}");
                        lakes.Remove(secondCurrentLake);
                        connectedCount++;
                        break;
                    }
                   
                }
            }
            if (connectedCount==0)
            {
                Console.WriteLine("Disconnected...");
            }
        }
    }
}
