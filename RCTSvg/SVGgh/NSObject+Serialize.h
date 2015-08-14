//
//  NSObject+Serialize.h
//  SVGReact
//
//  Created by Pavlo Aksonov on 06.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(Serialize)

-(NSDictionary *) asDictionary;
-(NSDictionary *) asAttributes;
@end
