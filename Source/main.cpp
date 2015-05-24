//
//  main.cpp
//  LR Parser
//
//  Created by Aleksey Goncharov on 24.05.15.
//  Copyright (c) 2015 Me. All rights reserved.
//

#include <iostream>
#include <fstream>
#include "Parser.h"

int main(int argc, const char * argv[]) {
  std::ifstream infile("Grammar.txt");
  std::vector<std::string> grammar = std::vector<std::string>();
  std::string line;
  std::fstream fs;
  fs.open ("/Users/agoncharov/Documents/LR_Parser/Grammar.txt", std::fstream::in);
  if (fs.is_open()) {
    while ( getline (fs,line) ) {
      grammar.push_back(line);
    }
    fs.close();
  }
  
  Parser parser(grammar);
  
  return 0;
}
