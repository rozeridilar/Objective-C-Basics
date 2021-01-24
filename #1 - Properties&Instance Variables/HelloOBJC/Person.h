//
//  Person.h
//  HelloOBJC
//
//  Created by Rozeri Dilar on 1/24/21.
//

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

- (void) testInstanceVariables;

@end

NS_ASSUME_NONNULL_END
