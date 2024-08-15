#include <iostream>

class Shape {
public:
    virtual double area() const = 0;

    virtual void display() const = 0;

    virtual ~Shape() = default;
};

class Circle final : public Shape {
    double radius;

public:
    explicit Circle(double r) : radius(r) {
    }

    [[nodiscard]] double area() const override {
        return M_PI * radius * radius;
    }

    void display() const override {
        std::cout << "Круг с радиусом: " << radius << std::endl;
    }
};

class Rectangle final : public Shape {
    double width;
    double height;

public:
    Rectangle(double w, double h) : width(w), height(h) {
    }

    [[nodiscard]] double area() const override {
        return width * height;
    }

    void display() const override {
        std::cout << "Прямоугольник с шириной: " << width << " и высотой: " << height << std::endl;
    }
};

int main() {
    Circle circle(5.0);
    Rectangle rectangle(4.0, 6.0);

    Shape *shapePtr;

    shapePtr = &circle;
    shapePtr->display();
    std::cout << "Площадь: " << shapePtr->area() << std::endl;

    std::cout << std::endl;

    shapePtr = &rectangle;
    shapePtr->display();
    std::cout << "Площадь: " << shapePtr->area() << std::endl;

    return 0;
}
