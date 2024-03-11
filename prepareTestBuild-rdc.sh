xcodebuild \
  CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO \
  clean build-for-testing \
  -project DemoApp1.xcodeproj \
  -scheme "DemoApp1" \
  -sdk iphoneos \
  -configuration Debug \
  -derivedDataPath './customFolder-rdc'


cd customFolder-rdc/Build/Products/Debug-iphoneos
mkdir Payload
cp -r customFolder-rdc/Build/Products/Debug-iphoneos/DemoApp1.app Payload
zip --symlinks -r DemoApp1.ipa Payload
rm -rf Payload; mkdir Payload
cp -r DemoApp1UITests-Runner.app Payload/
zip --symlinks -r DemoApp1UITests-Runner.ipa Payload

cd ../../../..

# Check if AppsToTest folder exists, create one if not, and ensure it's empty
if [ ! -d "AppsToTest-rdc" ]; then
    mkdir -p AppsToTest-rdc
else
    rm -rf AppsToTest-rdc/*
fi


# Copy .ipa to AppToTest-rdc folder
cp customFolder-rdc/Build/Products/Debug-iphoneos/DemoApp1.ipa AppsToTest-rdc/
cp customFolder-rdc/Build/Products/Debug-iphoneos/DemoApp1UITests-Runner.ipa AppsToTest-rdc/
