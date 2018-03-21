//
// Created by anderson on 20/03/2018.
//
#include <iostream>

using namespace std;

void changeArgument(int x) {
    cout << &x << "\n";
    x = x + 5;
}

void changeArgument(int *x) {
    cout << x << "\n";
    *x = *x + 5;
}

int main() {
    int y = 4;
    cout << &y << "\n";
    changeArgument(y);      // y will be unharmed by the function call
    cout << y << "\n";      // still prints 4

    changeArgument(&y);     // y changed in function call
    cout << y << "\n";      // print 9
}

