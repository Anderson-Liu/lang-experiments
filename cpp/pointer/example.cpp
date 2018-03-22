//
// Created by anderson on 21/03/2018.
//
#include <iostream>

using namespace std;

int main() {
    int var = 20;
    int *pInt;
    // Pointer to var
    pInt = &var;
    cout << "Value of var variable: " << var << "\n";
    cout << "Address stored in ip variable: " << pInt << "\n";
    cout << "Value of *pInt variable: " << *pInt;

    int numbers[8];
    // Pointer to array
    int *pNumbers = numbers;
    for (int i = 0; i < 8; i++) {
        pNumbers[i] = i;
    }
    // Initialize pointers with memory from the free store.
    auto *pNewInt = new int;
    // Frees up the memory allocated through new.
    delete pNewInt;
    // By setting it to nullptr, if your code does try to deference
    // the pointer after it is freed, you will find out immediately
    // because the program will crash.
    pNewInt = nullptr;

    auto *pNewNumbers = new int[8];
    delete[] pNewNumbers;
    pNewNumbers = nullptr;
}

