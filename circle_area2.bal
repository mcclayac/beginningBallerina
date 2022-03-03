import ballerina/io;
# Hello World


public function main() {
    io:println("Hello World");  // this is a comment

    chapter2();

}

public function chapter2() {
    io:println("------------------------------");
    io:println("----- chapter 2 --------------");
    io:println("      circle_area2.bal");

    int radius = 5;
    float area = 3.1415 * <float>radius * <float>radius;
    io:println("area = ", area);

    radius = 10;
    area = 3.1415 * <float>radius * <float>radius;
    io:println("area = ", area);


    
}