#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <string>
#include "SQLParser.h"
#include "ParseTreeToString.h"
#include "dbstorage.h"

using namespace std;
using namespace hsql;

int main(int argc, char** argv)
{
    // create simple file
    DbFile sampleDatabase("hello.db");
    sampleDatabase.create();
    //main parse loop
    while(true){
        string sqlcmd;
        cout << "SQL> ";
        getline(cin, sqlcmd);
        if(sqlcmd == "quit"){
            break;
        }
        
        SQLParserResult* result = SQLParser::parseSQLString(sqlcmd);
            if(!result->isValid()){
                cout << "Invalid command: " << sqlcmd << endl;
            } else {
                for(uint i = 0; i < result->size(); ++i){
                    const SQLStatement* statement = result->getStatement(i);

                        cout << ParseTreeToString::statement(statement) << endl;
                }
            }
            delete result;
    }

}

