//
//  SwizzingMethod.h
//  UIViewMainThread
//
//  Created by 魏琦 on 17/2/6.
//  Copyright © 2017年 com.drcacom.com. All rights reserved.
//

#import <objc/runtime.h>
static inline void exchangeOriginMethodWithSwizzingMethod(Class class ,SEL originMethod,SEL swizzingMethod){
    Method systemOriginMethod = class_getInstanceMethod(class, originMethod);
    Method newSwizzingMethod = class_getInstanceMethod(class, swizzingMethod);
    
    BOOL success = class_addMethod(class,originMethod,method_getImplementation(newSwizzingMethod), method_getTypeEncoding(newSwizzingMethod));
    if (success) {
        class_replaceMethod(class, swizzingMethod, method_getImplementation(systemOriginMethod), method_getTypeEncoding(systemOriginMethod));
        
    }
    else {
        method_exchangeImplementations(systemOriginMethod, newSwizzingMethod);
    }
}
