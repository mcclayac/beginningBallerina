import ballerina/io;


class MyClass {
    
    private int n;

    public function init(int n = 0) {
        self.n = n;
    }

    public function inc() {
        self.n += 1;
    }

    public function get() returns int {
        return self.n;
    }
}

public function main() {
    
    io:println("classes.bal");
    MyClass x = new MyClass(1234);
    
    int n = x.get();
    io:println("x.get() : ", n);
}
