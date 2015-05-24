//
//  Parser.cpp
//  LR Parser
//
//  Created by Aleksey Goncharov on 24.05.15.
//  Copyright (c) 2015 Me. All rights reserved.
//

#include "Parser.h"

using namespace::std;

Parser::Parser(vector<string> grammarVector) {
  vector<Rule> grammar;
  for (int i = 0; i < grammarVector.size(); ++i) {
    string ruleString = grammarVector[i];
    Rule rule;
    rule.leftSide = ruleString[0];
    ruleString.erase(ruleString.begin(), ruleString.begin() + 2);
    rule.rightSide = ruleString;
    grammar.push_back(rule);
  }
  _table = Table(grammar);
}