//
//  SVGG.m
//  SVGReact
//
//  Created by Pavlo Aksonov on 07.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgG.h"

@implementation RCTSvgG

-(id)init {
    self = [super init];
    children = [NSMutableArray array];
    return self;
}

- (void)insertReactSubview:(UIView *)subview atIndex:(NSInteger)atIndex
{
    [super insertSubview:subview atIndex:atIndex];
    
    // just add them to registry
    if ([subview isKindOfClass:[RCTSvgElement class]]){
        NSDictionary *params = [((RCTSvgElement *)subview) objParams];
        [children addObject:params];
    }
}

-(id) obj {
    if (!super.obj){
        NSDictionary *dict = [self asAttributes];
        
        GHShapeGroup *p = [[GHShapeGroup alloc] initWithDictionary:@{kAttributesElementName : dict, kContentsElementName: children}];
        [super setObj:p];
    }
    return super.obj;
}

- (void)drawRect:(CGRect)rect {
//    [super drawRect:rect];
}

@end
