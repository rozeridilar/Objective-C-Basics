//
//  ViewController.m
//  Objective-C Strings
//
//  Created by Rozeri Dilar on 1/24/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    
    
}


@end
