# Objective-C-Basics

Belows are some notes from objc.

Cocoa Touch Class = .m + .h files.

- ViewController.m -> implementation file
- ViewController.h -> header file
- ViewController.swift is the mix of both above.

### .h files

A class that has the definition of the methods.

- **+** sign before adding methods declared that method is static.
- **-** is the method that can be accessed via class instances. 

Below is an example of NSString class's header file:

```obj-c
+ (instancetype)localizedStringWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);
- (nullable instancetype)initWithCString:(const char *)nullTerminatedCString encoding:(NSStringEncoding)encoding;
```

### Access Modifiers

- If you want to show your property in public you should add your property in .h files, like example below:

**ViewController.h file:**

```obj-c

// MARK: - My import statements
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//Add my property in public
@property (nonatomic, strong) NSString *name;

@end
```

-If you want your property inside of the class and not available outside of the class you should implement it in .m file like below:

**ViewController.m file**

```obj-c

//MARK: - Import Statements
#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSString *privateName;

@end

@implementation ViewController

//MARK: - LifeCycles

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//MARK: - Actions
- (IBAction)clickSampleButtonAction:(id)sender {
}


@end
```

- Calling properties in many ways:

```obj-c
    //Call the name property in many ways:
    NSLog(@"Name: %@", self.name);
    self.name = @"Rozeri";
    NSLog(@"Name: %@", self.name);
    _name = @"Dilar";
    NSLog(@"Name: %@", self.name);
    [self setName:@"Rozeri Dilar"];
    NSLog(@"Name: %@", _name);
```
**Basically call with _name and set with [self setName: ]**

### .m files

Has the implementation of the methods.

### Importing other files

Unlike swift obj-C requires imports to reach other classes. To import another obj-c class in your file you should add that classes .h file into your .m file. For further explanination see how ViewController.m imported Person file.

## Proporties & Instance Variables

- Properties are public and global. 
    - it is also an instance variable under the hood.
    - it also creates getter&setter methods automatically.
    
- Instance Variables/iVars are private, not accesible by other classes. 

```obj-c
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
{
    //Below variables are instance variables and are not publics/cannot be accessed via other classes.
    BOOL *hasTwoCats;
}

//Below variables are properties and can be accessed via other classes.
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;

@end

NS_ASSUME_NONNULL_END
```

## Getters & Setters 

When creating properties, 

- if you do not want to set your property in every case you should declare them explicitly in .m files by overriding the set methods like below.

Person.h: 

```obj-c
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property(nonatomic) NSUInteger age;

@end

NS_ASSUME_NONNULL_END
```

Person.m: 

```obj-c
@implementation Person

-(void) setAge:(NSUInteger)age{
    //Here --age-- is the parameter that is the newValue in Swift.
    // --_age-- is the instance variable that is our actual variable.
    
    //I will increase age only if the new age param is greater than the actual one. Otherwise, do not do anything.
    if(age > _age){
        _age = age;
    }
}
@end
```

Calling the above example:

```obj-c
    Person *rozeri = [[Person alloc] init];
    rozeri.age = 27;
    
    //Below I want to make the age lesser which is impossible.
    [rozeri setAge:15];
    NSLog(@"Age: %lu", rozeri.age); //Age will return 27.
```


- Lets say you want to return something explicitly when some user calls your property's getter,

For below example, there is this person, NSObject instance, that only returns "Rozeri" as a name. Even the developer calls set method, it cannot be changed.

Person.h: 

```obj-c
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, strong) NSString *name;

@end

NS_ASSUME_NONNULL_END
```

Person.m: 

```obj-c
#import "Person.h"

@implementation Person

//Whenever other class's calls .name it will only return "Rozeri". Except if it is already "Rozeri Dilar".
-(NSString*) name{
    if([_name isEqualToString:@"Rozeri Dilar"]){
        return @"Rozeri Dilar";
    }
    return @"Rozeri";
}

@end
```

Calling the above example:

```obj-c
    Person *rozeri = [[Person alloc] init];

    [rozeri setName:@"Some Other Name"];
    NSLog(@"Name: %@", rozeri.name); //Name will return "Rozeri".
    
    [rozeri setName:@"Rozeri Dilar"];
    NSLog(@"Name: %@", rozeri.name); //Name will return "Rozeri Dilar".
```


## Pointers

Pointer basically points a location in memory on your device.

- You will use pointers when accessing class objects.(You can also reach primitive types's pointers too, but it is better to ease this process by only using pointers in class objects. Because in Objective-C you can use native types without dealing with pointers.)


ViewController.h: 

```obj-c
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) NSString *name; // Use pointer when dealing with class objects.
@property (nonatomic) int *pointerAge; // I do not need this, since I can reach native primitive types without dealing with pointers.
@property (nonatomic) int age; // use like this.
@property (nonatomic) NSInteger money; //NSInteger is just like a traditional int in C. It's a typedef. There are others like NSUInteger, CGFloat, etc. that all are synonyms for primitive types.
@property (nonatomic) NSNumber *bankBalance;//NSNumber is useful when you need to stick a number into an NSArray or NSDictionary. The standard practice is to use these collections versus rolling your own; the drawback is that they can only contain Objective-C objects.

@end
```

ViewController.m: 

```obj-c
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //To call name value, since it is a pointer we must allocate an instance in the memory.
    self.name = [[NSString alloc] init];
    self.name = @"";
    
    NSArray *myArray = [[NSArray alloc] init];
    [myArray arrayByAddingObject:3];//will not compile.
    [myArray arrayByAddingObject:[NSNumber numberWithInt:3]];//ok
    [myArray arrayByAddingObject:self.bankBalance];//ok
}


@end
```

**Importance on ARC:** When using pointers, you are creating instances by allocating from memory, so once you are done with it, you must release it from the memory. 

- NSInteger is just like a traditional int in C. It's a typedef. There are others like NSUInteger, CGFloat, etc. that all are synonyms for primitive types.

- NSNumber is useful when you need to stick a number into an NSArray or NSDictionary. The standard practice is to use these collections versus rolling your own; the drawback is that they can only contain Objective-C objects.

- NSNumber essentially wraps an int (or float, etc) into an Obj-C object (similar to C#/Java's concept of 'boxing' a primitive type) that can be added to an array.

- For performance reasons, if you can, use primitive types (like int, float, int[]). However, sometimes you cannot avoid NSArray/NSNumber, such as when you are reading or writing entries into a .plist file.

https://stackoverflow.com/questions/1285098/whats-the-difference-between-nsnumber-and-nsinteger



## Objective-C Strings

Lets dive into some definitions for Strings:

- A **literal** is a value, which is immutable by definition. 

- A **constant** is a read-only variable or pointer.

Example:

```obj-c
 const int age = 27;
 age = 25;//Cannot assign to variable 'age' with const-qualified type 'const int'
```

- A **string literal** is a expression like @"". The compiler will replace this with an instance of NSString.

Example:

```obj-c
    NSString *name = @"Rozeri";
    name = @"Dilar";
    
    NSLog(@"Name is: %@", name); // prints: Name is: Dilar
```

- A string **constant** is a read-only pointer to NSString.

```obj-c
    NSString *const firstName = @"Rozeri";
    firstName = "Dilar";//Cannot assign to variable 'firstName' with const-qualified type 'NSString *const __strong'
```
- All @"" expressions are indeed immutable. They are replaced at compile time with instances of NSConstantString, which is a specialized subclass of NSString with a fixed memory layout. This also explains why NSString is the only object that can be initialized at compile time.

https://stackoverflow.com/a/12327650/10616887


Below are some NSString usage examples such as formatting string, appending, comparisons:


```obj-c
    NSString *lastName = @"Rozeri";
    lastName = @"Dilar";
    
    NSLog(@"Last Name is: %@", lastName); // prints: Last Name is: Dilar
    
    //Conceting a String
    NSString *firstName = @"Rozeri";
    NSString *fullName = [NSString stringWithFormat:@"%@ Dilar", firstName];
    NSLog(@"FullName: %@%@", fullName, @"."); // prints: FullName: Rozeri Dilar.
    
    //Lets remove the . in the NSLog above and add this to another variable.
    NSString *lastSentence = [fullName stringByAppendingString:@"."];
    NSLog(@"FullName: %@", lastSentence); // prints: FullName: Rozeri Dilar.
    
    //Comparisons:
    NSString *str1 = @"Some Example";
    NSString *str2 = @"Some Other Example";
    NSString *str3 = @"some other example"; //lower case of str2

    if (![str1 isEqualToString:str2]){
        NSLog(@"str1 is equal to str2.");//This will run. --> Attention on --!-- in if statement.
    }else{
        NSLog(@"str1 is NOT equal to str2.");
    }
    
    if ([str3.lowercaseString isEqualToString: str2.lowercaseString]){
        NSLog(@"str3 is equal to str2 in LOWERCASE.");//will print
    }
    
    if ([str2 caseInsensitiveCompare:str3] == NSOrderedSame){
        NSLog(@"str3 is equal to str2 in LOWERCASE.");//will print
    }
```
