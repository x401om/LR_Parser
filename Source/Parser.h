//
//  Parser.h
//  LR Parser
//
//  Created by Aleksey Goncharov on 24.05.15.
//  Copyright (c) 2015 Me. All rights reserved.
//

#ifndef __LR_Parser__Parser__
#define __LR_Parser__Parser__

#include <stdio.h>
#include <string>
#include <vector>
#include <unordered_map>

using namespace std;

class Parser {
  vector<unordered_map<string, string>> _gotoTable;
  
public:
  Parser(std::vector<std::string> grammar);
  void Accept(std::string tokenString);
};

#endif /* defined(__LR_Parser__Parser__) */
