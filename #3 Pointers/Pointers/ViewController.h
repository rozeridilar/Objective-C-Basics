//
//  ViewController.h
//  Pointers
//
//  Created by Rozeri Dilar on 1/24/21.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) NSString *name; // Use pointer when dealing with class objects.
@property (nonatomic) int *pointerAge; // I do not need this, since I can reach native primitive types without dealing with pointers.
@property (nonatomic) int age; // use like this.
@property (nonatomic) NSInteger money; //NSInteger is just like a traditional int in C. It's a typedef. There are others like NSUInteger, CGFloat, etc. that all are synonyms for primitive types.
@property (nonatomic) NSNumber *bankBalance;//NSNumber is useful when you need to stick a number into an NSArray or NSDictionary. The standard practice is to use these collections versus rolling your own; the drawback is that they can only contain Objective-C objects.

@end

