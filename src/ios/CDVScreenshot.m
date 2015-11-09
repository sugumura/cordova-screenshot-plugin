#import <Cordova/CDV.h>
#import "CDVScreenshot.h"

@implementation CDVScreenshot

- (void) now:(CDVInvokedUrlCommand*)command
{
    options = [command.arguments objectAtIndex:0];
    callbackId = command.callbackId;

    // TODO: implementation
    NSLog("Call now");
}

@end
