#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (retain, nonatomic) NSDictionary *imageTargets;
@property (retain, nonatomic) NSString *overlayText;
@property (retain, nonatomic) NSString *vuforiaLicenseKey;
@property (retain, nonatomic) NSString *refImageName;
@property (retain, nonatomic) NSString *r;
@property (retain, nonatomic) NSString *g;
@property (retain, nonatomic) NSString *b;

-(id)initWithFileName:(NSString *)fileName targetNames:(NSArray *)imageTargetNames customOverlayText:(NSString *)overlayText vuforiaLicenseKey:(NSString *)vuforiaLicenseKey refImageName:(NSString *)refImageName r:(NSString *)r g:(NSString *)g b:(NSString *)b;

@end

