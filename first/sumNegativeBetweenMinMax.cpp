#include <iostream>
#include <vector>
#include <algorithm>


int sumNegativeBetweenMinMax(const std::vector<int> &A) {
    const auto minIt = std::ranges::min_element(A);
    const auto maxIt = std::ranges::max_element(A);

    int minIndex = std::distance(A.begin(), minIt);
    int maxIndex = std::distance(A.begin(), maxIt);

    if (minIndex > maxIndex) {
        std::swap(minIndex, maxIndex);
    }

    int sumNegative = 0;
    for (int i = minIndex + 1; i < maxIndex; ++i) {
        if (A[i] < 0) {
            sumNegative += A[i];
        }
    }

    return sumNegative;
}
