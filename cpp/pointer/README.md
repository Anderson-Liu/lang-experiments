# Forget everything you've heard
# Ok, then —— what are pointers? Why should you care?
 
 Up until now, we’ve only been able to work with a fixed amount of memory, an amount 
 decided up- front before the program has even started. Whenever you declare a variable,
  it causes some amount of memory to be allocated behind the scenes to hold the 
  information stored in that variable. When you declare a variable, the amount of 
  memory allocated is chosen at compile time—you can’t change it or add to it while
  the program is running. We’ve been able to create arrays of data to get a lot of 
  variables—a big chunk of memory—but the array can hold no more elements than the 
  number that you specified when writing the program. In the next few chapters, we’ll 
  learn about how to get access to more memory than we started our program with. 
  You’ll learn how to create an unlimited number of enemy spaceships all flying around 
  at once (minus the flying around...).
 
 In order to get access to (nearly) unlimited amounts of memory, we need a kind of 
 variable that can refer directly to the memory that stores variables. This type of 
 variable is called a pointer.
 
 Pointers are aptly named: they are variables that "point" to locations in memory. 
 A pointer is very similar to a hyperlink. A webpage is located in one place—on some 
 person’s web server. If you want to send someone a copy of that web page, do you 
 download the entire page and email it to them? No, you just email a link. Similarly, 
 a pointer allows you to store or send a “link” to a variable, array or structure, 
 rather than making a copy.
 
 A pointer, like a hyperlink, stores the location of some other data. Because a pointer
  can store the location (the address) of other data, you can use it to hold on to 
  memory that you get from the operating system. In other words, your program can ask 
  for more memory and can access that memory using pointers.
 
 You've actually already seen one example of a pointer—when we passed an array into 
 a function it didn't get copied, did it? Instead, the original array was passed to 
 that function. The way that works is by using pointers. See, they aren't so bad!
 
 #  The advantages (and disadvantages) of pointers
 
 Now that you’ve learned a bit about the details of pointers, let’s go back to our 
 previous analogy and look at some of the tradeoffs of using pointers. Hyperlinks 
 and pointers have a lot of the same advantages and disadvantages.
 
 1. You don’t have to make a copy—if the web page is quite large or complicated, this 
 could be hard (imagine trying to send someone a copy of all of Wikipedia!). Similarly, 
 data in memory might be quite complicated, and it might be hard to copy correctly
  (more on this later) or just slow (copying a lot of memory may be time consuming).
 2. You don’t have to worry about whether you’ve got the latest version of the webpage. 
 If the author updates the page, then you get the changes as soon as you revisit the 
 link. If you have a pointer to memory, you are always able to access the latest value 
 at that memory address.
 
 Of course, there are also disadvantages to sending a link rather than a copy:
 
 1. The page might be moved, or deleted. Similarly, memory can be returned to the 
 operating system, even if someone still has pointer to it. To avoid these issues, 
 the code that owns the memory must keep track of whether anyone else might be using it.
 2. You have to be online to access it. This one generally doesn’t affect pointers.
 