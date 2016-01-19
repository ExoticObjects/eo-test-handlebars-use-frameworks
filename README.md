# eo-test-handlebars-use-frameworks

Hopefully I'm missing something...

This is a very simple Xcode project that does nothing. It only exists in an effort to try to figure out a compiler error. It uses this Podfile:

```ruby
platform :ios, '9.0'
use_frameworks!

pod 'handlebars-objc', '1.3.0'

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|

      if target.name == 'handlebars-objc'
        config.build_settings['OTHER_CFLAGS'] = '-fno-objc-arc -w -Xanalyzer -analyzer-disable-all-checks'
      end
    end
  end
end
```

which makes use of a post install hook described [here](https://github.com/Bertrand/handlebars-objc/issues/15#issuecomment-172317394)

And in the main view controller it has one line of code that attempts to use handlebars-objc:

```objective-c
#import <HBHandlebars/HBHandlebars.h>
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	NSString * str = [HBHandlebars renderTemplateString:@"" withContext:@"" error:nil];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];

	// Dispose of any resources that can be recreated.
}

@end
```

That results in the following error:

`ARC forbids Objective-C objects in struct`

which is complaining about the NSString inside a struct in `HBAstNumber.h`

```objective-c
#import "HBAstValue.h"


typedef struct HBParserIntegerValue HBParserIntegerValue;
struct HBParserIntegerValue {
    int value;
    NSString* source; //THIS IS NOT ALLOWED!! (And also not fixed by the post install hook in my podfile - sad feelings...)
};

@interface HBAstNumber : HBAstValue

@property (retain, nonatomic) NSNumber* litteralValue;
@property BOOL isBoolean;
@property (retain, readwrite, nonatomic) NSString* sourceRepresentation;

@end
```

This is a known handlebars-objc problem, but the post install hook in the podfile above is supposed to fix it. I'm wondering why, given this very simple test, it isn't fixed. Hence: hopefully I'm missing something!
