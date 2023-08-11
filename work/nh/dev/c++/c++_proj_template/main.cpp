#include <iostream>

int main(){
    auto result = (1 <=> 2) > 0;
    std::cout << result << std::endl;
}