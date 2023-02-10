//
//  Logger.m
//  LSUniversalTest
//
//  Created by dpetrovic on 06/12/2022.
//

#import "Logger.h"

@implementation Logger
- (void) logLevel:(NSInteger)level logModule:(NSInteger)module fromMethod:(NSString *)from message:(NSString *)message, ... {
    va_list pe;
    va_start(pe, message);
    NSString *sMessage = [[NSString alloc] initWithFormat:message arguments:pe];
    va_end(pe);
    NSLog(@"%@", sMessage);
}
@end
