//
//  Table.cpp
//  LR Parser
//
//  Created by Aleksey Goncharov on 24.05.15.
//  Copyright (c) 2015 Me. All rights reserved.
//

#include "Table.h"

Table::Table() {
  
};

Table::Table(std::vector<Rule> grammar) {
  _grammar = grammar;
};

vector<Rule> Table::getGrammar() {
  return _grammar;
}

vector<unordered_map<string, string>> Table::buildTable() {
  vector<unordered_map<string, string>> table;
  
  table.push_back();
  
}