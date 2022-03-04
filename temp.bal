


type ExamResult object {

    public string name;
    public int mathScore;
    public int physicsScore;
    public int chemistryScore;

    public function  __init(string argName, int argMathScore, int argPhysicsScore, int argChemistryScore) {
                self.name = argName;
                self.mathScore = argMathScore;
                self.physicsScore = argPhysicsScore;
                self.chemistryScore = argChemistryScore;
            }
    
    public function average() returns int {
        return (self.mathScore + self.chemistryScore + self.physicsScore) /3;
    }

};

