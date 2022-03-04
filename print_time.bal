import ballerina/time;
import ballerina/io;


public function main() {
    
    io:println(time:utcToString(time:utcNow()));
    //io:println(time:toString(time:currentTime()));
}