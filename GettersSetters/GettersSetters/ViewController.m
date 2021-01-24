//
//  ViewController.m
//  GettersSetters
//
//  Created by Rozeri Dilar on 1/24/21.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
    Person *rozeri = [[Person alloc] init];
    rozeri.age = 27;
    
    //Below I want to make the age lesser which is impossible.
    [rozeri setAge:15];
    NSLog(@"Age: %lu", rozeri.age); //Age will return 27.
    
    [rozeri setName:@"Some Other Name"];
    NSLog(@"Name: %@", rozeri.name); //Name will return "Rozeri".
    
    [rozeri setName:@"Rozeri Dilar"];
    NSLog(@"Name: %@", rozeri.name); //Name will return "Rozeri Dilar".
}


@end
