import ballerina/io;
# Hello World


public function main() {
    io:println("Hello World");  // this is a comment

    chapter2();

}

public function chapter2() {
    io:println("------------------------------");
    io:println("----- chapter 2 --------------");

    int radius = 5;
    float area = 3.1415 * <float>radius * <float>radius;
    io:println("area = ", area);

    typeInferenceWithvar();

    numericConversions();

    workingWithEscapeCharaters();
    stringFunctions();


}

public function stringFunctions() {
    io:println("----- chapter 2 - stringFunctions --------------\n");



     string message = "I remember my uncle saying \"great power "
                    +
                    "comes great responsibilit \".";


    io:println(message);

    int aIndexOf = message.indexOf("uncle");





}

public function workingWithEscapeCharaters() {
    io:println("----- chapter 2 - workingWithEscapeCharaters --------------\n");

    string message = "I remember my uncle saying \"great power "
                    +
                    "comes great responsibilit \".";

    io:println(message);

    message = "Shopping List:\n\tBread\n\tEggs\n\tButter";
    io:println(message);
}

public function numericConversions() {
    io:println("----- chapter 2 - numericConversions --------------");

    //  Sometimes you may need to convert between numeric data types in 
    // a program. For example, if you have a floating-point value, you 
    // may need to convert it to an integer value. Or it could be that 
    // you have a value of type int, but you actually need it in a 
    // byte-typed variable. These operations are done using the 
    // cast operator (<>) in Ballerina.

    float a = 53.56;
    int b = <int> a;

    io:println(" b = ", b);

    // After the previous conversion operation, the value of b will
    //  be 54. The reason is that the conversion automatically rounds 
    // the value to the closest integer.

    // The following example converts an int value to a byte value, 
    // where the byte is a smaller capacity type compared to the 
    // int. So, in the conversion, there is a chance that the 
    // conversion may fail because the integer value is too big 
    // to fit into the target variable.

    int aValue = 70;                                                                         
    byte bValue = <byte> aValue;

    io:println("byte value = ", bValue);

    // 

    // this will cause a panic !
    
    //aValue = 1500;
    //bValue = <byte> aValue;

    //io:println("byte value = ", bValue);


    // he previous code will fail during the conversion operation 
    // at runtime by resulting in a panic. This is because the 
    // integer value 1500 is unable to fit into an 8-bit unsigned 
    // integer (byte) typed variable. Ballerina error handling 
    // and panics will be covered in depth in Chapter 5.



}


public function typeInferenceWithvar() {
    io:println("----- chapter 2 - typeInferenceWithvar --------------");

    // In Ballerina, we can use the var keyword in place of the type 
    // descriptor, where the type of the variable is inferred from 
    // the value that is provided for its initialization.

    var name = "Nimal";
    var age = 18;
    var height = 182.88;
    var distanceToSun = 9.296e7f;
    var sharePrice = 153.59d;

    io:println(name);
    io:println(age);
    io:println(height);
    io:println(distanceToSun);
    io:println(sharePrice);
    

}