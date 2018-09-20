//
//  TodoItem.h
//  lab01-todoapp
//
//  Created by Ibrahim Mehkri on 2018-09-20.
//  Copyright © 2018 Ibrahim Mehkri. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface TodoItem : NSObject

@property NSString *itemName;
@property BOOL important;
@property BOOL completed; 

-(id)initWithName:(NSString *)name important:(BOOL)isImportant; 

@end


