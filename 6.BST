#include<stdio.h>
#include<stdlib.h>
struct BST {
int data;
struct BST *left, *right;
};
typedef struct BST node;
node *insert(node *root, int key) {
if(root == NULL) {
root = (node *) malloc (sizeof(node));
root->data = key;
root->left = root->right = NULL;
return root;
}
if(key < root->data)
root->left = insert(root->left, key);
else
root->right = insert(root->right, key);
return root;
}
void inorder(node *root) {
if(root != NULL) {
inorder(root->left);
printf(" %d", root->data);
inorder(root->right);
}
}
void preorder(node *root) {
if(root != NULL) {
printf(" %d", root->data);
preorder(root->left);
preorder(root->right);
}
}
void postorder(node *root) {
if(root != NULL) {
postorder(root->left);
postorder(root->right);
printf(" %d", root->data);
}
}
void search(node *root, int key) {
if(root == NULL) {
printf("Key not found");
return;
}
if(root->data == key) {
printf("Key found");
return;
}
if(key < root->data) {
search(root->left, key);
} else {
search(root->right, key);
}
}
void main() {
int n, i, key, choice;
node *temp, *root = NULL;
printf("Enter number of nodes: ");
scanf("%d", &n);
printf("Enter elements: ");
for(i = 0; i < n; i++) {
scanf("%d", &key);
root = insert(root, key);
}
while(1) {
printf("\nEnter choice: ");
printf("\n1: Inorder\t2: Preorder\t3: Postorder\t4: Search\t5: Exit\n");
scanf("%d", &choice);
switch(choice) {
case 1:
printf("\nInorder: ");
inorder(root);
break;
case 2:
printf("\nPre-order: ");
preorder(root);
break;
case 3:
printf("\nPost-order: ");
postorder(root);
break;
case 4:
printf("Enter search element: ");
scanf("%d", &key);
search(root, key);
break;
case 5:
exit(0);
default:
printf("Invalid choice!");
}
}
}
