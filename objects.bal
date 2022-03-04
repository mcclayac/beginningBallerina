import ballerina/io;



class ExamResult  {

    public string name;
    public int mathScore;
    public int physicsScore;
    public int chemistryScore;

    public function init(string name, int mathScore, int physicsScore, int chemistryScore) {
        self.name = name;
        self.mathScore = mathScore;
        self.physicsScore = physicsScore;
        self.chemistryScore = chemistryScore;
    }

    public function getAverage() returns int {
        return ( self.mathScore + self.physicsScore + self.chemistryScore) / 3;
    }
}


public function main() {
    io:println("Program objects");
    // Must instantiate class to make an object
    ExamResult result = new ExamResult("Tony", 77,88,99);
    io:println("results =", result);
    int average = result.getAverage();
    io:println("Average  =", average);
}