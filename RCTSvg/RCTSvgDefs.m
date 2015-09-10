//
//  SVGDefs.m
//  SVGReact
//
//  Created by Pavlo Aksonov on 06.08.15.
//  Copyright (c) 2015 Pavlo Aksonov. All rights reserved.
//

#import "RCTSvgDefs.h"
#import "RCTSvgElement.h"
#import "RCTSvgDynamicRenderer.h"
#import "RCTSvg.h"

@implementation RCTSvgDefs {
    NSMutableDictionary *varibles;
}

-(id)init {
    self = [super init];
    varibles = [NSMutableDictionary dictionary];
    [[RCTSvgDynamicRenderer sharedInstace] clearObjects];
    return self;
}
- (void)insertReactSubview:(UIView *)subview atIndex:(NSInteger)atIndex
{
    // will not insert because we don't need to draw them
    
//    [super insertSubview:subview atIndex:atIndex];
    
    // just add them to registry
    if ([subview conformsToProtocol:@protocol(SVGRenderable)]){
        id<SVGRenderable> element = (id<SVGRenderable>)subview;
        varibles[element.id] = [element obj];
        
    }
    
}

-(void)setRenderer:(RCTSvgDynamicRenderer *)renderer {
    _renderer = renderer;
    for (NSString *ident in varibles.allKeys){
        [_renderer addObject:varibles[ident] forKey:ident];
        [[RCTSvgDynamicRenderer sharedInstace] addObject:varibles[ident] forKey:ident];
    }
}

@end
