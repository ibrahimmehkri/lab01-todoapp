//
//  TodoItem.m
//  lab01-todoapp
//
//  Created by Ibrahim Mehkri on 2018-09-20.
//  Copyright © 2018 Ibrahim Mehkri. All rights reserved.
//

#import "TodoItem.h"

@implementation TodoItem

-(id)initWithName:(NSString *)name important:(BOOL)isImportant{
    self = [super init];
    if(self){
        self.itemName = name;
        self.important = isImportant;
        self.completed = NO; 
    }
    return self;
}

@end
