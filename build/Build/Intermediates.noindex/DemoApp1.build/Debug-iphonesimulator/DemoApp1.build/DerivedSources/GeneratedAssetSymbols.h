#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The "image1" asset catalog image resource.
static NSString * const ACImageNameImage1 AC_SWIFT_PRIVATE = @"image1";

/// The "image2" asset catalog image resource.
static NSString * const ACImageNameImage2 AC_SWIFT_PRIVATE = @"image2";

/// The "image3" asset catalog image resource.
static NSString * const ACImageNameImage3 AC_SWIFT_PRIVATE = @"image3";

#undef AC_SWIFT_PRIVATE