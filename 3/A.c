#include <stdio.h>
#include <stdlib.h>

int main(int argc, char const *argv[])
{
    FILE * fp;
    char * line = NULL;
    size_t len = 512;
    size_t read;

    fp = fopen("../Data/3.txt", "r");

    int total = 0;

    while ((read = getline(&line, &len, fp)) != -1) {
        // printf("Retrieved line of length %zu, %ld\n", read, read/2);
        // printf("%s", line);
        int left[52] = {0};
        for (int i = 0; i<read/2; i++){
            int index = line[i] >= 'a' ? line[i] - 97 : line[i] - 65 + 26;
            left[index] = 1;
        }
        for (int i = read/2; i<read-1; i++){
            int index = line[i] >= 'a' ? line[i] - 97 : line[i] - 65 + 26;
            if (left[index] == 1){
                // printf("%d\n", index + 1);
                total += index + 1;
                break;
                // left[index] = 0;
            }
        }
    }

    fclose(fp);

    printf("%d\n", total);

    return 0;
}
