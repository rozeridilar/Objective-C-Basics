# Objective-C-Basics

Cocoa Touch Class = .m + .h files.

- ViewController.m -> implementation file
- ViewController.h -> header file
- ViewController.swift is the mix of both above.

### .h files

A class that has the definition of the methods.

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

//Whenever other class's calls .name it will only return "Rozeri".
-(NSString*) name{
    return @"Rozeri";
}

@end
```

Calling the above example:

```obj-c
    Person *rozeri = [[Person alloc] init];

    [rozeri setName:@"Some Other Name"];
    NSLog(@"Name: %@", rozeri.name); //Name will return "Rozeri".
```
