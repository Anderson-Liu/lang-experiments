//
// Created by anderson on 21/03/2018.
//

#include <iostream>

using namespace std;

int *growArray(int *pValues, int curSize);

int main() {
    int nextElement = 0;
    int size = 10;
    auto *pValues = new int[size];
    int val;
    cout << "Please enter a number: ";
    cin >> val;
    while (val > 0) {
        if (size == nextElement + 1) {
            pValues = growArray(pValues, size);
        }
        pValues[nextElement] = val;
        cout << "Please enter a number (or 0 to exit): ";
        cin >> val;
    }
}

int *growArray (int *pValues, int curSize) {
    int *pNewValues = new int[curSize * 2];
    for (int i=0; i<curSize; i++) {
        pNewValues[i] = pValues[i];
    }
    delete pValues;
    return pNewValues;
}

