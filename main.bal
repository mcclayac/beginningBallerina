import ballerina/io;
import ballerina/lang.'float as floats;
import ballerina/random;
import ballerina/os;
#import ints
#import ballerina/math;
#import ballerina/math;

# Hello World


public function main() {
    io:println("Hello World");  // this is a comment

    // chapter2();
    chapter3();

    chapter4();


}

public function chapter4() {
    io:println("\n\n");
    io:println("------------------------------");
    io:println("----- chapter 4 --------------n\n");


}

public function chapter3() {
     io:println("------------------------------");
    io:println("----- chapter 3 --------------");

    unionTypes();
    optionalTypes();
    anyTypes();

    arrayTypes();
    definingtNewTypes();

    maps();
    records();
    objects();
    referenceTypesValueTypes();
    deapAndExactEquality();
    consantsAnsSignletonTypes();

    // getEnvirontment();

}

const PI = 3.1415;
const float PI2 = 3.1415;

const ON = "ON";
const OFF = "OFF";
type SWITCH_STATUS ON|OFF;

// Signleon
type IO_ERROR "IO_ERROR";


public function consantsAnsSignletonTypes() {
    io:println("\n\n----- chapter 3 - consantsAnsSignletonTypes --------------\n\n");

    SWITCH_STATUS livingRoomSwitch = ON;  // Ojly allowed two states ON and OFF

    io:println("Libing Room Status :", livingRoomSwitch);
    io:print("IO Error :", IO_ERROR);

}

public function deapAndExactEquality() {
    io:println("\n\n----- chapter 3 - deapAndExactEquality --------------\n\n");

    map<string> m1 = { "firsName" : "jack", "lastName" : "Johnson"};
    map<string> m2 = { "firsName" : "jack", "lastName" : "Johnson"};
    map<string> m3 = { "firsName" : "Krisin", "lastName" : "Smith"};

    io:println(m1 === m2);   // this is false = memory comparrison
    io:println(m1 == m2);    // this is true = field comparriston
    io:println(m2 == m3);  // this is false names are diffferent

}



public function referenceTypesValueTypes() {
    io:println("\n\n----- chapter 3 - referenceTypesValueTypes --------------\n\n");

    map<int> ages = {};
    ages["sunil"] = 25;
    int count = 10;
    io:println("Ages before update: ", ages);
    io:println("Count before update: ", count);

    // reference Type
    updateAges(ages);

    // value type
    updateCount(count);

    // After
    io:println("Ages after update: ", ages);
    io:println("Count after update: ", count);

    io:println("\n\n");

}

public function updateAges(map<int> argAges) {
    argAges["sunil"] = 30;
    io:println("Ages in updateAges :", argAges);
}

public function updateCount (int argCount) {
    int myCount = argCount;
    myCount = 20;
    io:println("Count in updateCount :", myCount); 
}



class ExamResult6  {

    private string name;
    private int mathScore;
    private int physicsScore;
    private int chemistryScore;

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



public function objects() {
    io:println("\n\n----- chapter 3 - Classes --------------\n\n");

      io:println("Program objects");
    // Must instantiate class to make an object
    ExamResult6 result6 = new ExamResult6("Tony", 77,88,99);
    io:println("results6 =", result6);
    int average = result6.getAverage();
    io:println("Average  =", average);
    
}


type ExamResult1 record {
    string name;
    int mathScores;
    int physicsScore;
    int chemistryScore;
};

// Record with default value and optional field
type ExamResult3 record {
    string name = "Jane Doe";
    int mathsScore;
    int physicsScore;
    int chemistryScore?;
};

// Closed Record with default value and optional field
type ExamResult4 record {|
    string name = "Jane Doe";
    int mathsScore;
    int physicsScore;
    int chemistryScore?;
|};

// Closed Record with default value and optional field
// with rest field of type int
type ExamResult5 record {|
    string name = "Jane Doe";
    int mathsScore;
    int physicsScore;
    int chemistryScore?;
    int...;
|};

type Person record {
    string name;
    int age;
};
type Student record {
    string name;
    int age;
    string studentId;
};



public function records() {
    io:println("----- chapter 3 - records --------------\n\n");

    io:println("\nExamRecord1 Example:");
    ExamResult1 results1 ={
        name: "Tony",
        mathScores: 95,
        physicsScore: 78,
        chemistryScore: 88
    };

    io:println("Results1 record");
    io:println(results1);

    io:println("\nExamRecord3 Example:");
    ExamResult3 results3 = {
        mathsScore: 88,
        physicsScore: 23
    };

    // using default value for name
    // not publishing a chemistryScroe because it is optional
    io:println("using default value for name");
    io:println("not publishing a chemistryScroe because it is optional");
    io:println("Results3 record");
    io:println(results3);
    int? chemistryScore = results3?.chemistryScore;
    if chemistryScore is int {
        io:println("chemistry Score :", chemistryScore);
    } else {
        io:println("No chemistry Score is present");
    }

    // Using Default open record to define new fields
    results3["age"] = 52;
    io:println(results3);
    anydata age = results3["age"];
    if age is int {
        io:println("the listed age is :", age);
    } else {
        io:println("I have no idea what the age is");
    }

     io:println("\nExamRecord4 Example:");
    ExamResult4 results4 = {
        mathsScore: 88,
        physicsScore: 23
    };
    io:println("using default value for name");
    io:println("not publishing a chemistryScroe because it is optional");
    io:println("Results4 record");
    io:println(results4);

    // This is a closed recordType | |
     // Using Default open record to define new fields
    // results4["age"] = 52; // this dos not compile in closed recordType
    // io:println(results4);
    // anydata age2 = results4["age"];
    // if age2 is int {
    //    io:println("the listed age is :", age);
    // } else {
    //    io:println("I have no idea what the age is");
    //}

    // Adding rest field of type int


    io:println("\nExamRecord5 Example:");
    ExamResult5 results5 = {
        mathsScore: 88,
        physicsScore: 23
    };
    // This is a closed recordType | |
    // with rest field of type int
     // Using Default open record to define new fields
    results5["BiologyScore"] = 82; // this dos not compile in closed recordType
    io:println(results5);
    int? biologyScore = results5["BiologyScore"];
    if biologyScore is int {
        io:println("Biology Score :", biologyScore);
    } else {
        io:println("BiologyScore is not present");
    }

    io:println("\nExample 6 - Subtyping");
    Person p1;
    Student s1 = { name: "john", age: 30, studentId: "W200530"};
    p1 = s1;
    io:println("Subtyping Student record into Personvariable");
    io:println(p1);
} 



function getEnvirontment() {
    io:println("----- getEnvirontment --------------\n\n");

    string hostname = os:getEnv("HOSTNAME");
    io:println("hostname: ", hostname);

    string commandMode = os:getEnv("COMMAND_MODE");
    io:println("commandMode: ", commandMode);

    string user = os:getEnv("USER");
    io:println("user: ", user);


    



    
}

type ExamResult2 [int, int, int];

public function maps() {
    io:println("----- chapter 3 - maps --------------\n\n");


    map<int> mathScores = { "sunil": 90, "nimal": 85 };
    mathScores["jack"] = 75;

    int? score = mathScores["sunil"];
    if score is int {
        io:println("score is :", score);
    } else {
        io:println("No score for user");
    }

    score = mathScores["tony"];
    if score is int {
        io:println("score is :", score);
    } else {
        io:println("No score for user");
    }

    //
    map<ExamResult2> examResults = {};
    examResults["sunil"] = [90, 85, 80];
    examResults["nimal"] = [85, 82, 65];
    io:println("map<ExamResult2> examResults = {}; = ", examResults);

    ExamResult2? itemExamResults = examResults["sunil"];
    if itemExamResults is ExamResult2 {
        int pysicsScore = itemExamResults[1];
        io:println("pysics score = ", pysicsScore);
    }

    io:println("Loop maps - foreach #1");
    // iterating maps
    foreach var scoreValues in examResults {
        io:println("Score Value:", scoreValues);
    }


    examResults["tony"] = [75, 82, 95];
    io:println("\nLoop maps - foreach #2");
    // iterating maps
    foreach var [name, scores]  in examResults.entries() {
        io:println("Score Value name: ", name, " \tscore: ", scores);
    }




}

type ExamResult [string, int, int, int];

public function definingtNewTypes() {
    io:println("----- chapter 3 - definingtNewTypes --------------\n\n");

    ExamResult result1 = ["sunil", 90, 88, 85];
    ExamResult result2 = ["nimal", 85, 75, 80];
    ExamResult result3 = ["jack", 80, 70, 78];

    io:println("ExamResult result1:", result1);
    io:println("ExamResult result2:", result2);
    io:println("ExamResult result3:", result3);

    io:println(result1[0],":",result1[1],":",result1[2],":",result1[3]);
    io:println(result2[0],":",result2[1],":",result2[2],":",result2[3]);
    io:println(result3[0],":",result3[1],":",result3[2],":",result3[3]);



}


public function arrayTypes() {
    io:println("----- chapter 3 - arrayTypes --------------\n\n");

    //int[] mathScores = [];
    //int i = 0;
    //while i < 20 {
    //    mathScores[i] = check ints:fromString(io:readln("Enter score : "));
    //}

    // Dynamic Array declaration with intial values
    // dynamic length array with three initial values
    int[] mathsScores = [77, 81, 92];
    io:println("math scores mathsScores: ", mathsScores);

    // dynamic arrays
    int[] mathScores2 = [];
    mathScores2.push(90);
    mathScores2.push(90, 85, 65);
    io:println("math scores mathScores2: ", mathScores2);

    // dynamic arrays #2
    int[] mathScores3 = [];
    mathScores3[0] = 78;
    mathScores3[1] = 81;
    mathScores3[9] = 70;
    io:println("math scores mathScores3: ", mathScores3);

    int removedElement = mathScores2.pop(); // removes 65 from the array
    io:println("math scores pop mathScores3: ", mathScores3);
    io:println("math scores pop mathScores3 removedElement: ", removedElement);

    io:print("\nshift/unshift funtionality");
    int[] mathScores4 = [90, 88, 75];
    io:println("math scores mathScores4: ", mathScores4);
    int firstScore = mathScores4.shift(); // array is now [88, 75]
    io:println("math scores mathScores4 shift: ", mathScores4);
    io:println("math scores mathScores4 shift value: ", firstScore);
    mathScores4.unshift(95, 80, 85);
    io:println("mathScores4.unshift(95, 80, 85); :", mathScores4);


    int[] mathScores5 = [90, 88, 75];
    mathScores5.push(85); // now [90, 88, 75, 85]
    mathScores5.push(93); // now [90, 88, 75, 85, 93]

    int loopCounter = 0;
    io:println("While Loop dynamic array mathScores5 :", mathScores5);
    io:println("While Loop dynamic array mathScores5 len :", mathScores5.length());
    int len = mathScores5.length();
    while loopCounter < len {
        int value = mathScores5.pop();
        io:println("value if array item :", loopCounter, ":",value);
        loopCounter += 1;
    }

    // queue
    int[] mathScores6 = [90, 88, 75];
    mathScores6.push(85); // now [90, 88, 75, 85]
    mathScores6.push(93); // now [90, 88, 75, 85, 93]

    loopCounter = 0;
    io:println("\nqueue functionality");
    io:println("While Loop dynamic array mathScores6 :", mathScores6);
    io:println("While Loop dynamic array mathScores6 len :", mathScores6.length());
    len = mathScores6.length();
    while loopCounter < len {
        int value = mathScores6.shift();
        io:println("value if array item :", loopCounter, ":",value);
        loopCounter += 1;
    }
    io:println("end loop");   

    // The slice function is used to generate a subarray of the current array. The 
    // first parameter is the start index of the array to start creating the subarray, 
    // including the element at this index. The second parameter is the last index 
    // position used to create the slice in the array. This value is non-inclusive, 
    // which means, the value at the second parameter index in the array is not 
    // returned in the slice. But rather, the slice will contain values up to the 
    // index right before the second parameter. The following example demonstrates 
    //this behavior.
    io:println("\nslice functionality");
    int[] mathScores7 = [90, 88, 75, 85, 92];
    io:println("mathscores7 :", mathScores7);
    int[] scoreSlice = mathScores7.slice(1, 4);  // // scoreSlice = [88, 75, 85]
    io:println("mathscores7 slice(1,4): ", scoreSlice);

    // Fixed-Length Arrays
    // In a fixed-length array, the array values must be given when the array is first 
    // initialized. An example usage is shown here:
    // int[3] mathsScores = [77, 81, 92];
    // In the array type descriptor itself, the fixed array size is given, and with 
    // the array initialization, its initial values also must be provided. The 
    // following statement also represents the same behavior, by providing * as 
    // the array length, where now the fixed array length is automatically inferred 
    // from the initial value set.
    //
    // int[*] mathsScores = [77, 81, 92];
    // Something to note is that int[*] and int[] are not the same. Where the first 
    // option is always a fixed length, with the length inferred, and the latter 
    // option is always a dynamic-length array declaration.

    // fixed sized arrays
    int[3] fixedSizedArray1= [77,81,92];
    int[*] fixedSizedArray2= [77,81,92];

    // dynamic arrays
    int[] dynamicArray1 = [];

    // Iterating Arrays
    // Array items can be iterated by using a while loop, which will use our own 
    // loop counter to access each element in the array. This approach is shown here:
    io:println("\nlooping arrays with while");
    int loopCounter2 = 0;
    while loopCounter2 < fixedSizedArray1.length() {
        io:println("fixedSizedArray1[", loopCounter2,"] =", fixedSizedArray1[loopCounter2]);
        loopCounter2 += 1;
    }

    io:println("\nlooping arrays with foreach");
    foreach var score in fixedSizedArray1 {
        io:println("Score: ", score);
    }

    // multidimensional arrays
    //
    // Multidimensional arrays in Ballerina are emulated. This is because Ballerina does 
    // not support true multidimensional arrays, where it should have all the elements 
    // inside the multidimensional array in a contiguous memory block. In Ballerina, 
    // it can rather do an array of arrays. This means an array element type itself 
    // is another array.

    io:println("\nMiltidimentional Arrays");

    int[][] imageData = [];
    imageData[0] = [150, 110, 20];

    io:println("int[][] imageData = [];");
    io:println("imageData[0] = [150, 110, 20];");
    io:println("imagedata:");
    io:println(imageData);

    imageData[25][50] = 150;
    io:println("imageData[25][50] = 150;");
    io:println("imagedata:");
    io:println(imageData);

    // imageData = loadImage();

    // keeping inside the aray bounds
    // this will not compile
    // 3 is outside the fixed array bounds
    // int[*] mathsScores2 = [77, 81, 92];
    // io:println(mathsScores2[3]);

    // Tuples
    // A tuple is similar to a fixed-length array; its elements 
    // are addressed using an integer index value, but it has 
    // the property that each element can have its own type, 
    // compared to an array, where all the array elements need 
    // to be of the same type. The general format to declare 
    // a tuple is as follows:

    io:println("\n Tuples");
    [string, int, int, int] result1 = ["sunil", 90, 88, 85];
    [string, int, int, int] result2 = ["nimal", 85, 75, 80];
    [string, int, int, int] result3 = ["jack", 80, 70, 78];

    io:println("result1 :", result1);
    io:println("result2 :", result2);
    io:println("result3 :", result3);

    io:println("Accessing Tuples");
    string name = result1[0];
    int mathsScore = result1[1];
    int physicsScore = result1[2];
    int chemistryScore = result1[3];
    io:println("name: ", name, " math score: ", mathsScore, " physics score: ", physicsScore, " chemistry score: ", chemistryScore, "\n");

    // 
    io:println("Shorthand Accesing tuples #1");
    var [name2, mathsScore2, physicsScore2, chemistryScore2] = result2;
    io:println("name2: ", name2, " math score2: ", mathsScore2, " physics score:2 ", physicsScore2, " chemistry score2: ", chemistryScore2, "\n");

    io:println("Shorthand Accesing tuples #2");
    var [name3, _, _, chemistryScore3] = result3;
    io:println("name3: ", name3,  " chemistry score3: ", chemistryScore3, "\n");
}

public function anyTypes() {
    io:println("----- chapter 3 - anyTypes --------------\n\n");

    any myVar = 50;
    io:println("any myVar = 50; :", myVar);

    myVar = "my string";
    io:println("myVar = \"my string\"; :", myVar);

    myVar = 1.56;
    io:println("myVar = 1.56; :", myVar);

    myVar = true;
    io:println("myvar = true; :", myVar);

}


public function optionalTypes() {
    io:println("----- chapter 3 - optionalTypes --------------\n\n");

    int? score = getExamScore("W53033", "Organic Chemistry");
    if score is int {
        io:println("Score : ", score);
        return;
    } 
    // implied false
    io:println("The Student has not taken the course");

    // int finalScore = score is () ? 0 : score;
    // elvis operator
    // int finalScore = score?:0;


}

function getExamScore(string studentID, string subject) returns int? {

     int|error aRandomNuumber = random:createIntInRange(0,100);
    if aRandomNuumber is int {
        if aRandomNuumber > 50 {
            return aRandomNuumber;
        } else {
            return ();
        }
    }
    return ();

}

public function unionTypes() {
    io:println("----- chapter 3 - unionTypes --------------\n\n");

    int aint = 10;

    //aint.t

    int|string id;

    id = "abc";
    id = 123;

    io:println(id);

    boolean isString = id is string;
    io:println("boolean isString = id is string; = ", isString);

    io:println("Version #1 of union type code");
    string prefixedID;
    if id is string {
        string sid = <string> id;
        prefixedID = "ID" + sid;
    } else {
        int nid = <int> id;
        prefixedID = "ID" + nid.toString();
    }
    io:println(prefixedID);



    io:println("Version #2 of union type code");
    //string prefixedId;
    prefixedID = "";
    if id is string {
        prefixedID = "ID" + id;
    } else {
        prefixedID = "ID" + id.toString();
    }
    io:println(prefixedID);

    int|string|boolean status = getStatus();
    if status is int {
        // status is an int in this scope
        int a = status;
    } else {
        // status is string|boolean in this scope
        if status is string {
            // status is string in this scope
            string b = status;
        } else {
            // status is boolean in this scope
            boolean c = status;
        }
    }
}

public function getStatus() returns int|string|boolean {


    int|error aRandomNuumber = random:createIntInRange(0,100);
    if aRandomNuumber is int {
        if aRandomNuumber > 50 {
            return aRandomNuumber;
        } else {
            return false;
        }
    }
    return true;
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

    mathematicalCalcuatiomns();
    comparisonOperators();

    loops();

    variableScopes();
    bitwiseOperators();

}

public function bitwiseOperators() {
    io:println("----- chapter 2 - bitwiseOperators --------------\n\n");

    io:println("bitwise start");
     int a = 5;
     int b = 9;
     int c = a & b;
     int d = a | b;
     io:println(c, ":", d);
     int e = 16 >> 1;
     int f = -10;
     int g = f >> 1;
     int h = f >>> 1;
     int i = f << 2;
     io:println(e, ":", g, ":", h, ":", i);
     io:println("bitwise end\n");
     
}

function variableScopes() {
    io:println("----- chapter 2 - variableScopes --------------\n\n");

    int i = 0;
    // io:println(count);  out of scope!
    int count = 10;
    while i < count {
        io:println("inside while i : ", i);
        int j = i + 1;
        io:println("inside while j : ", j);
        if (j > 5 ) {
            int x = j * 2;
            io:println("inside if x : ", x);
        } // end-if
        i += 1;
    } // end while
    io:println("end - variable scope");
} // end function

public function loops() {
    io:println("----- chapter 2 - loops --------------\n\n");

    whileLoop();
    brakeLoop();
    continueLoop();
    continueBreakLoop();
    foreachLoop();


    
}

public function foreachLoop() {
    io:println("----- chapter 2 - foreachLoop --------------\n\n");

    io:println("foreach start-loop");
    foreach int i in 0...20 {
        io:println(i);
    }
    io:println("foreach end-loop");

}


public function continueBreakLoop() {
    io:println("----- chapter 2 - continueBreakLoop --------------\n\n");
    while true {
        string input = io:readln("Enter a positive number (q to exit) :");
        if input == "q" {
            break;
        }
        float|error n  = floats:fromString(input);
        if n is float {
            if n < <float>0 {
                io:println("Not a positive number");
                continue;
            }
            io:println(float:sqrt(n) , "\n") ;
        }

    }
    
}

public function continueLoop() {
    io:println("----- chapter 2 - continueLoop --------------\n\n");

     int i = 0;

    io:println("Continue start-loop");
    while i < 20 {
        if i % 2 == 0 {  // should skip all even numbers
            i += 1;
            continue;
        }
        io:println(i);
        i += 1;

    }
    io:println("Continue end-loop");

    
}

public function brakeLoop() {
    io:println("----- chapter 2 - brakeLoop --------------\n\n");

    int i = 0;

    io:println("brakeLoop start-loop");
    while i < 100 {
        io:println(i);
        i += 1;
        if i == 10 {
            break;
        }
    }
    io:println("brakeLoop end-loop");
}


public function whileLoop() {
    io:println("----- chapter 2 - whileLoop --------------\n\n");

    int i = 0;

    io:println("start-loop");
    while i < 100 {
        io:println(i);
        i += 1;
    }
    io:println("end-loop");
}




public function comparisonOperators() {
    io:println("----- chapter 2 - comparisonOperators --------------\n\n");

    int a = 10;
    int b = 20;
    int c = 10;
    boolean d = a == c;
    boolean e = a == b;
    boolean f = a < 10;
    boolean g = a <= 10;
    
    io:println(d, ":", e, ":", f,":", g);

}

public function mathematicalCalcuatiomns() {
    io:println("----- chapter 2 - mathematicalCalcuatiomns --------------\n");

    int a = 1 + 4;
    int b = a + 10;
    float c = <float>b * 2.5;
    io:println(a,":",b,":",c);

    int d = a % 3;
    int e = a / 3;
    io:println(d , ":", e);

    float f= <float>a / 3.0;
    io:println(f);

    int g = a + b * 2;
    int h = (a + b) * 2;
    io:println(g,":",h);

}


public function stringFunctions() {
    io:println("----- chapter 2 - stringFunctions --------------\n");



     string message = "I remember my uncle saying \"great power "
                    +
                    "comes great responsibilit \".";


    io:println(message);

    //int? aIndexOf = lang:string:indexOf(message, "uncle", 0);
    // if aIndexOf is int {
    //
    // } else {
    //
    //}
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