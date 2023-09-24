using System;

class Program
{
    static void Main()
    {
        string[] dimensions = Console.ReadLine().Split();
        int n = int.Parse(dimensions[0]);
        int m = int.Parse(dimensions[1]);

        int[][] matrix = new int[n][];

        for (int i = 0; i < n; i++)
        {
            matrix[i] = Array.ConvertAll(Console.ReadLine().Split(), int.Parse);
        }

        int fireCount = CountFires(matrix, n, m);
        Console.WriteLine(fireCount);
    }

    static int CountFires(int[][] matrix, int n, int m)
    {
        int count = 0;

        for (int i = 0; i < n; i++)
        {
            for (int j = 0; j < m; j++)
            {
                if (matrix[i][j] == 1)
                {
                    // Намерен е нов пожар, увеличаваме брояча и извикваме функцията за намиране на огнищата
                    count++;
                    MarkFire(matrix, n, m, i, j);
                }
            }
        }

        return count;
    }

    static void MarkFire(int[][] matrix, int n, int m, int i, int j)
    {
        if (i < 0 || i >= n || j < 0 || j >= m || matrix[i][j] == 0)
        {
            return;
        }

        // Маркираме текущата клетка като посетена (0)
        matrix[i][j] = 0;

        // Проверяваме съседните клетки
        MarkFire(matrix, n, m, i - 1, j - 1);
        MarkFire(matrix, n, m, i - 1, j);
        MarkFire(matrix, n, m, i - 1, j + 1);
        MarkFire(matrix, n, m, i, j - 1);
        MarkFire(matrix, n, m, i, j + 1);
        MarkFire(matrix, n, m, i + 1, j - 1);
        MarkFire(matrix, n, m, i + 1, j);
        MarkFire(matrix, n, m, i + 1, j + 1);
    }
}
