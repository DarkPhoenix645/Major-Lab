#include <iostream>
#include <bits/stdc++.h>

using namespace std;

struct Operation {
    char type;
    int transaction_id;
    char data_item;
};

void addEdge(unordered_map<int, unordered_set<int>>& graph, int from, int to) {
    graph[from].insert(to);
}

bool hasCycle(int node, unordered_map<int, unordered_set<int>>& graph, unordered_map<int, bool>& visited, unordered_map<int, bool>& recursionStack) {
    visited[node] = true;
    recursionStack[node] = true;

    for (int neighbor : graph[node]) {
        if (!visited[neighbor] && hasCycle(neighbor, graph, visited, recursionStack)) {
            return true;
        }
        else if (recursionStack[neighbor]) {
            return true;
        }
    }

    recursionStack[node] = false;
    return false;
}

bool isCyclic(unordered_map<int, unordered_set<int>>& graph, int num_transactions) {
    unordered_map<int, bool> visited;
    unordered_map<int, bool> recursionStack;

    for (int i = 1; i <= num_transactions; ++i) {
        if (!visited[i] && hasCycle(i, graph, visited, recursionStack)) {
            return true;
        }
    }
    return false;
}

bool isConflictSerializable(vector<Operation>& schedule, int num_transactions) {
    unordered_map<int, unordered_set<int>> graph;

    // Build the precedence graph
    for (int i = 0; i < schedule.size(); ++i) {
        for (int j = i + 1; j < schedule.size(); ++j) {
            if (schedule[i].data_item == schedule[j].data_item &&
                schedule[i].transaction_id != schedule[j].transaction_id) {
                // Add an edge if there is a conflicting operation
                if (schedule[i].type == 'W' || schedule[j].type == 'W') {
                    addEdge(graph, schedule[i].transaction_id, schedule[j].transaction_id);
                }
            }
        }
    }

    // Check if the precedence graph contains a cycle
    return !isCyclic(graph, num_transactions);
}

int main() {
    int num_transactions;
    int num_operations;

    cout << "Enter number of transactions: ";
    cin >> num_transactions;
    cout << "Enter number of operations: ";
    cin >> num_operations;

    vector<Operation> schedule(num_operations);

    cout << "Enter schedule operations (format: R/W transaction_id data_item):\n";
    for (int i = 0; i < num_operations; ++i) {
        cin >> schedule[i].type >> schedule[i].transaction_id >> schedule[i].data_item;
    }

    if (isConflictSerializable(schedule, num_transactions)) {
        cout << "The schedule is conflict serializable.\n";
    } else {
        cout << "The schedule is not conflict serializable.\n";
    }

    return 0;
}
