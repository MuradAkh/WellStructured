int __CPROVER_assert(int a, char *b) {}
int __CPROVER_assume(int a ){}

int main(){
    int x = 0;
    for (int i = 0;; i++)
    {
        __CPROVER_assert(x == 0, "postcondition");
    }
}