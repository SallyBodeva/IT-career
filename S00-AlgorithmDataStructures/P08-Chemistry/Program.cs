using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        Dictionary<string, List<string>> possibleReactions = new Dictionary<string, List<string>>();

        while (true)
        {
            string input = Console.ReadLine();
            if (input == "end")
                break;

            string[] elements = input.Split();
            string parentElement = elements[0];
            string childElement = elements[1];

            if (!possibleReactions.ContainsKey(parentElement))
                possibleReactions[parentElement] = new List<string>();

            possibleReactions[parentElement].Add(childElement);
        }
        while (true)
        {
            string input = Console.ReadLine();
            if (input == "end")
                break;

            string[] query = input.Split('-');
            string parentElement = query[0].Trim();
            string[] childElements = query[1].Split(new char[] { ',', ' ' }, StringSplitOptions.RemoveEmptyEntries);

            bool isValid = true;
            foreach (var childElement in childElements)
            {
                if (!possibleReactions.ContainsKey(parentElement) || !possibleReactions[parentElement].Contains(childElement))
                {
                    isValid = false;
                    break;
                }
            }

            if (isValid)
            {
                Console.WriteLine($"{parentElement} - {string.Join(", ", childElements)}");
            }
        }
    }
}
