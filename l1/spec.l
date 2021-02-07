%option c++
%option noyywrap
%{
#include <fstream>
#include <iostream>
using namespace std;
int nouns = 0;
int verbs = 0;
int adjectives = 0;
%}

%%
Man { ++nouns; }
man { ++nouns; }
woman { ++nouns; }
Woman { ++nouns; }
Dog { ++nouns; }
dog { ++nouns; }
bites { ++verbs; }
kicks { ++verbs; }
loves { ++verbs; }
lo+(ng) {++adjectives; }
tall { ++adjectives;}
short { ++adjectives;}
%%

int main(int argc,char **argv){
	ifstream* temp = new ifstream();
	temp->open(argv[1],ios::in);
	FlexLexer* lexer = new yyFlexLexer(temp);
	while(lexer->yylex()!=0) ;
	

	cout << "the number of nouns:" << nouns << ",the number of verbs:" 
	<<  verbs << ",the number of adjectives:" << adjectives << endl;
}
