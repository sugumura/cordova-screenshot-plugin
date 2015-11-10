#import <Cordova/CDV.h>
#import "CDVScreenshot.h"


@implementation CDVScreenshot {
    CDVInvokedUrlCommand *commnd;
}

- (void) now:(CDVInvokedUrlCommand*)command
{
    self->commnd = command;
    UIImage *image = [self getScreenshot];

    UIImageWriteToSavedPhotosAlbum(image, self, @selector(onCompleteCapture:didFinishSavingWithError:contextInfo:), nil);
}


- (void)onCompleteCapture:(UIImage *)screenImage didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error) {
        CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:[self->commnd callbackId]];
    } else {
        CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:[self->commnd callbackId]];
    }
}


- (UIImage *)getScreenshot
{
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    CGRect rect = [keyWindow bounds];
    UIGraphicsBeginImageContextWithOptions(rect.size, YES, 0);
    [keyWindow drawViewHierarchyInRect:keyWindow.bounds afterScreenUpdates:YES];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
