module cstring;

import std.stdio;
import std.algorithm;
import std.array;

/// parses a `c-like` string. \n
/// handles things like \\\ n and \\\r which are used instead of the raw escapes.
string parse_c_like_string(string str) {
    writeln("in string: "~str);
    string ns;
    bool after_nl = false;
    for (int i = 0 ; i < str.length ; ++i) {
        if (str[i] == '\\') {
            if (str[i+1] == 'n') {

                ns = ns ~ "\n";
                after_nl = true;
            }
            else if (str[i+1] == 'r') {
                ns = ns ~ "\r";
                after_nl = true;
            }
        } else {
            if (!after_nl) {
                ns = ns~str[i];
            } else{
                after_nl = false;
            }
            
        }
    
    }
    writeln("outstring: "~ns);
    return "";
}