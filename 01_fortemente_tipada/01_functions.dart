bool isZero(int z) {
    return z == 0;
}

bool isZero2(int z) => z == 0;

void main() {
    int x = 0;
    print(isZero(x));

    x = 123;
    print(isZero2(x));
}
