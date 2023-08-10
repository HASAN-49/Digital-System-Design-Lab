#include<bits/stdc++.h>
using namespace std;

struct node {
    int data;
    struct node *next;
};

typedef struct node Node;

Node* getNode() {
    Node* p;
    p = (Node*) malloc(sizeof(struct node));
    return p;
}

void display(Node* head) {
    Node* tmp = head;
    while(tmp != NULL) {
        cout << tmp->data << " ";
        tmp = tmp->next;
    }
    cout << endl;
}

Node* insertt(Node* &head, int item) {
    //cout << head->data << endl;
    Node* new_node;
    new_node = getNode();
    if(new_node == NULL) {
        cout << "(No space!! Cann't add something) ";
        return head;
    }
    new_node->data = item;
    if(head->data >= item) {
        new_node->next = head;
        head = new_node;
    }
    else {
        Node* current = head;
        Node* previous = NULL;
        while(current != NULL && current->data < item) {
            previous = current;
            current = current->next;
        }
        new_node->next = current;
        previous->next = new_node;
    }
    return head;
}

Node* insert_at_pos(Node* &head, int item, int pos) {
    Node* new_node = getNode();
    if(new_node == NULL) {
        cout << "(Insufficient space!! Cann't add something) ";
        return head;
    }
    new_node->data = item;
    if(pos == 1) {
        new_node->next = head;
        head = new_node;
    }
    else {
        int cnt = 1;
        Node* current = head;
        Node* previous = NULL;
        while(current != NULL && cnt != pos) {
            cnt++;
            previous = current;
            current = current->next;
        }
        if(cnt == pos) {
            new_node->next = current;
            previous->next = new_node;
        }
        else {
            cout << "(Wrong position) ";
        }
    }
    return head;
}

void create(Node* &head, int a[], int n) {
    Node* ptr = head;
    for(int i = 0; i < n; i++) {
        //cout << a[i] << endl;
        Node* tmp;
        tmp = getNode();
        if(tmp == NULL) {
            cout << "NULL\n";
            return;
        }
        tmp->data = a[i];
        tmp->next = NULL;
        if(head == NULL) {
            head = tmp;
            ptr = tmp;
        }
        else {
            ptr->next = tmp;
            ptr = ptr->next;
        }
    }
}

int main() {
    int a[] = {1, 2, 3, 4, 5, 6, 8, 7};
    int n = sizeof(a) / sizeof(a[0]);
    Node* head;
    head = NULL;
    create(head, a, n);
    cout << "After creating a node : ";
    display(head);
    cout << "After inserting some node : ";
    insertt(head, 49);
    insertt(head, 0);
    insertt(head, 4);
    display(head);
    cout << "After inserting a node at position 2 : ";
    insert_at_pos(head, 12, 2);
    display(head);

    return 0;
}
