# !(Declare vs Define in C and C++)[https://www.cprogramming.com/declare_vs_define.html]

## Foreword
In C and C++, there is a subtle but important distinction between the meaning
of the words declare and define. If you don't understand the difference, you'll
run into weird linker errors like "undefined symbol foo" or "undefined reference
to 'foo'" or even "undefined reference to vtable for foo" (in C++).

## Main Body

### What it Means to Declare Something in C and C++

When you declare a variable, a function, or even a class all you are doing is saying:
there is something with this name, and it has this type. The compiler can then handle
most (but not all) uses of that name without needing the full definition of that name.
Declaring a value--without defining it--allows you to write code that the compiler can
understand without having to put all of the details. This is particularly useful if you
are working with multiple source files, and you need to use a function in multiple files.
You don't want to put the body of the function in multiple files, but you do need to
provide a declaration for it.

So what does a declaration look like? For example, if you write:

```cpp
int func();
```

This is a function declaration; it does not provide the body of the function,
 but it does tell the compiler that it can use this function and expect that it
 will be defined somewhere.

### What it Means to Define Something in C and C++

Defining something means providing all of the necessary information to create that
thing in its entirety. Defining a function means providing a function body; defining
a class means giving all of the methods of the class and the fields. Once something is
defined, that also counts as declaring it; so you can often both declare and define a
function, class or variable at the same time. But you don't have to.

For example, having a declaration is often good enough for the compiler. You can write
code like this:

```cpp
int func();

int main()
{
    int x = func();
}

int func()
{
    return 2;
}
```
Since the compiler knows the return value of func, and the number of arguments
it takes, it can compile the call to func even though it doesn't yet have the
definition. In fact, the definition of the method func could go into another file!

You can also declare a class without defining it

```cpp
class MyClass;
```

Code that needs to know the details of what is in MyClass can't work--you can't do this:

```cpp
class MyClass;

MyClass an_object;

class MyClass
{
    int _a_field;
};

```

Because the compiler needs to know the size of the variable an_object, and it can't
do that from the declaration of MyClass; it needs the definition that shows up below.

### Declaring and Defining Variables with Extern

Most of the time, when you declare a variable, you are also providing the definition.
What does it mean to define a variable, exactly? It means you are telling the compiler
where to create the storage for that variable. For example, if you write:

```cpp
int x;
int main()
{
    x = 3;
}
```

The line int x; both declares and defines the variable; it effectively says, "create
 a variable named x, of type int. Also, the storage for the variable is that it is a
 global variable defined in the object file associated with this source file." That's
 kind of weird, isn't it? What is going on is that someone else could actually write a
 second source file that has this code:

```cpp
extern int x;
int func()
{
    x = 3;
}
```

Now the use of extern is creating a declaration of a variable but NOT defining it;
it is saying that the storage for the variable is somewhere else. Technically, you
could even write code like this:

```cpp
extern int x;
int func()
{
    x = 3;
}

int x;
```

And now you have a declaration of x at the top of the program and a definition at
the bottom. But usually extern is used when you want to access a global variable
declared in another source file, as I showed above, and then link the two resulting
object files together after compilation. Using extern to declare a global variable
is pretty much the same thing as using a function declaration to declare a function
in a header file. (In fact, you'd generally put extern in a header file rather than
putting it in a source file.)

In fact, if you put a variable into a header file and do not use extern, you will run
into the inverse problem of an undefined symbol; you will have a symbol with multiple
definitions, with an error like "redefinition of 'foo'". This will happen when the linker
 goes to link together multiple object files.

### Declaration vs Definition: In Summary

A declaration provides basic attributes of a symbol: its type and its name. A definition
provides all of the details of that symbol--if it's a function, what it does; if it's a
class, what fields and methods it has; if it's a variable, where that variable is stored.
 Often, the compiler only needs to have a declaration for something in order to compile
 a file into an object file, expecting that the linker can find the definition from
 another file. If no source file ever defines a symbol, but it is declared, you will
 get errors at link time complaining about undefined symbols.

### Common Cases

If you want to use a function across multiple source files, you should declare the
function in one header file (.h) and then put the function definition in one source
file (.c or .cpp). All code that uses the function should include just the .h file,
and you should link the resulting object files with the object file from compiling
the source file.

If you want to use a class in multiple files, you should put the class definition in
a header file and define the class methods in a corresponding source file. (You an
also use inline functions for the methods.)

If you want to use a variable in multiple files, you should put the declaration of the
variable using the extern keyword in one header file, and then include that header file
in all source files that need that variable. Then you should put the definition of
that variable in one source file that is linked with all the object files that use that
variable.

