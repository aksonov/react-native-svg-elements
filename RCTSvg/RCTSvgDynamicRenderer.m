//
//  SVGDynamicRenderer.m
//  
//
//  Created by Pavlo Aksonov on 31.07.15.
//
//

#import "RCTSvgDynamicRenderer.h"
#import "RCTBridgeModule.h"

@implementation RCTSvgDynamicRenderer

+ (RCTSvgDynamicRenderer *)sharedInstace {
    static RCTSvgDynamicRenderer *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] initWithDefault];
        
    });
    return sharedMyManager;
}

-(id __nonnull)initWithDefault {
    NSString* result = @"<?xml version=\"1.0\" encoding=\"UTF-8\"?> <svg xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns=\"http://www.w3.org/2000/svg\" x=\"0px\" height=\"100px\" viewport-fill=\"white\" y=\"0px\" width=\"100px\" version=\"1.1\" viewBox=\"0 , 0, 1242, 2208\"></svg>";
    self = [super initWithString:result];
    objects = [NSMutableDictionary dictionary];
    return self;
}

-(void)addObject:(id __nonnull)object forKey:(NSString * __nonnull)ident {
    if (ident)
    objects[ident] = object;
}

-(nullable id)objectNamed:(NSString * __nonnull)objectName {
    return objects[objectName];
}

-(void)clearObjects {
    [objects removeAllObjects];
}

//- (id)initWithString:(NSString * __nonnull)utf8String {
//    if (self = [super initWithString:utf8String]) {
//        objects = [NSMutableDictionary dictionary];
//    }
//    return self;
//}
@end
