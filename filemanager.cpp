#include <iostream>
#include <dirent.h>

using namespace std;

void listFiles(const char *path) {
    DIR *dir;
    struct dirent *entry;

    if ((dir = opendir(path)) != NULL) {
        while ((entry = readdir(dir)) != NULL) {
            cout << entry->d_name << endl;
        }
        closedir(dir);
    } else {
        perror("Unable to open directory");
    }
}

int main() {
    const char *path = "."; // Current directory
    listFiles(path);
    return 0;
}
