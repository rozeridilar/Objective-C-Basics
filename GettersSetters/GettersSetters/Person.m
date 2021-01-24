//
//  Person.m
//  GettersSetters
//
//  Created by Rozeri Dilar on 1/24/21.
//

#import "Person.h"

@implementation Person

-(void) setAge:(NSUInteger)age{
    //Here age is the parameter that is the newValue in Swift.
    // _age is the instance variable that is our actual variable.
    
    //I will increase age only if the new age param is greater than the actual one. Otherwise, do not do anything.
    if(age > _age){
        _age = age;
    }
}

//Whenever other class's calls .name it will only return "Rozeri". Except if it is already "Rozeri Dilar".
-(NSString*) name{
    if([_name isEqualToString:@"Rozeri Dilar"]){
        return @"Rozeri Dilar";
    }
    return @"Rozeri";
}

@end

