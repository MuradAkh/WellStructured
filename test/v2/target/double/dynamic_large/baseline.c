int __CPROVER_assert(int a, char *b) {}
int __CPROVER_assume(int a ){}

int main(){
    int n;
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < 100; j++)
        {
            int x = 0;
            __CPROVER_assert(x == 0, "postcondition");
        }
      
    }
}