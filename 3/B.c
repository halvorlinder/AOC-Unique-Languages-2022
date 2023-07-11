#include <stdio.h>
#include <stdlib.h>

int main(int argc, char const *argv[])
{
    FILE *fp;
    char *lines[3] = {NULL, NULL, NULL};
    size_t len = 512;
    size_t lengths[3];

    fp = fopen("../Data/3.txt", "r");

    int total = 0;

    while (1)
    {
        int stop = 0;

        for (int i = 0; i < 3; i++)
        {
            if ((lengths[i] = getline(&lines[i], &len, fp)) == -1)
                stop = 1;
        }

        if (stop)
            break;

        int sack_sets[3][52] = {0};
        for (int i = 0; i < 3; i++)
        {

            for (int j = 0; j < lengths[i] - 1; j++)
            {
                int index = lines[i][j] >= 'a' ? lines[i][j] - 97 : lines[i][j] - 65 + 26;
                sack_sets[i][index] = 1;
            }
        }

        for (int i = 0; i < 52; i++)
        {
            if (sack_sets[0][i] == 1 && sack_sets[1][i] == 1 && sack_sets[2][i] == 1)
                total += i + 1;
        }
    }

    fclose(fp);

    printf("%d\n", total);

    return 0;
}
