int __CPROVER_assert(int a, char *b) {}
int __CPROVER_assume(int a ){}

int main(){
    int x = 0;
    __CPROVER_assert(x == 0, "postcondition");
}