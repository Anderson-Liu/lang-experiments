# Choose the right kind of loop

## For loop

- Use a for loop if you know the exact number of times you want to loop—for example,
 when counting from 0 to 100, a for loop is perfect or when you're doing multiplication
 tables.
-  For loops are also the standard way of iterating over arrays—which you’ll see when
we get to arrays

- On the other hand, you wouldn’t use a for loop if the variable needs to be updated
in a really complicated way—a for loop is good for showing everything about how the
loop works in a single succinct statement. If the update step requires multiple lines
of code, then you lose the advantage of the for loop.

# While loop

- On the other hand, if you have a complicated loop condition, or you have to do a lot
 of math to get the next value of the loop variable, consider a while loop. While loops
 make it very simple to see when a loop is going to terminate, but they make it harder
 to see what changes each time you loop. If the change is complicated, you’re better off
  using a while loop since the reader will at least know that it wasn’t a simple update.

Example:

```cpp

int j = 5;
for (int i=0; i<10 && j>0; i++) {
    cout << i * j;
    j = i - j;
}

```

``` cpp

int i = 0;
int j = 5;

while (i<10 && j>0) {
    cout << i * j;
    j = i - j;
    i ++;
}

```