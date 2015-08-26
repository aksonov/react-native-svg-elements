//
//  SVGLinearGradient.m
//  SVGReact
//
//  Created by Pavlo Aksonov on 06.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgLinearGradient.h"
#import "NSObject+Serialize.h"

@implementation RCTSvgLinearGradient

-(id) obj {
    self.userInteractionEnabled = NO;
    if (!super.obj){
        NSMutableArray *children = [NSMutableArray arrayWithCapacity:[self.stop count]];
        for (NSString *value in self.stop){
            NSArray *arr = [value componentsSeparatedByString:@","];
            [children addObject:@{kElementName: @"stop",
                                  kAttributesElementName: @{
                                          @"stop-color":arr[0],
                                          @"offset":arr[1]
                                          },
                                  }];
            
        }
        NSDictionary *attributes = [self asAttributes];
        
        NSDictionary *res = @{kElementName: @"linearGradient",
                              kAttributesElementName: attributes,
                              kContentsElementName: children};
        
        GHLinearGradient *gr = [[GHLinearGradient alloc] initWithDictionary:res];
        [super setObj:gr];
    }
    return super.obj;
}

@end
