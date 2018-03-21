//
// Created by anderson on 20/03/2018.
//

#include <iostream>

using namespace std;

// function prototype for add
// without this code, compiler will can't found add() func
int add(int x, int y);

int main() {
    int result = add(1, 2);
    cout << "The result is: " << result << "\n";
    cout << "Adding 3 and gives us: " << add(3, 4);
}

int add(int x, int y) {
    return x + y;
}

