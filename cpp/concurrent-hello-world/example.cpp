//
// Created by anderson on 20/03/2018.
//

#include <iostream>
#include <thread>

void hello() {
    std::cout << "Hello Concurrent world!\n";
}

int main() {
    std::thread t(hello);
    t.join();
}

