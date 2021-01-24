//
//  ViewController.m
//  Pointers
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
    
    //To call name value, since it is a pointer we must allocate an instance in the memory.
    self.name = [[NSString alloc] init];
    self.name = @"";
    
    NSArray *myArray = [[NSArray alloc] init];
    //[myArray arrayByAddingObject:3];//will not compile.
    [myArray arrayByAddingObject:[NSNumber numberWithInt:3]];//ok
    [myArray arrayByAddingObject:self.bankBalance];//ok
}


@end
