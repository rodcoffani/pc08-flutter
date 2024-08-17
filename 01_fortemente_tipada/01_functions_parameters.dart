bool isZero({int teste = 0}) {
    return teste == 0;
}

bool isZero2({int teste = 0}) => teste == 0;

void main() {
    int x = 0;
    print(isZero(teste: x));

    x = 123;
    print(isZero2(teste: x));
}
