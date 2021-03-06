//
//  Table.h
//  LR Parser
//
//  Created by Aleksey Goncharov on 24.05.15.
//  Copyright (c) 2015 Me. All rights reserved.
//

#ifndef __LR_Parser__Table__
#define __LR_Parser__Table__

#include <stdio.h>
#include <vector>
#include <string>
#include <unordered_map>

using namespace std;

struct Rule {
  string leftSide, rightSide;
};

class Table {
  vector<Rule> _grammar;
  
public:
  Table();
  Table(vector<Rule> grammar);
  
  vector<unordered_map<string, string>> buildTable(); // <token_name, shift/reduce/accept>
  vector<Rule> getGrammar();
};

#endif /* defined(__LR_Parser__Table__) */
