//
//  ViewController.m
//  HelloOBJC
//
//  Created by Rozeri Dilar on 1/24/21.
//

//MARK: - Import Statements
#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@property (nonatomic, strong) NSString *vehicle;

@end

@implementation ViewController

//MARK: - LifeCycles

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //Call the name property in many ways:
    NSLog(@"Name: %@", self.name);
    self.name = @"Rozeri";
    NSLog(@"Name: %@", self.name);
    _name = @"Dilar";
    NSLog(@"Name: %@", self.name);
    [self setName:@"Rozeri Dilar"];
    NSLog(@"Name: %@", _name);
    
    
    
    //Reach properties & instances
    Person *person = [[Person alloc] init];
    [person setFirstName:@"Rozeri"];
    [person setLastName:@"Dilar"];
    [person testInstanceVariables];
    
   
    
    
}

//MARK: - Actions
- (IBAction)clickBaitAction:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Welcome" message:@"Hello to Objective-C" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *dismiss = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:dismiss];
    [self presentViewController:alert animated:true completion:nil];
}


@end
