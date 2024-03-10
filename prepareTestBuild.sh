xcodebuild \
  clean build-for-testing \
  -project DemoApp1.xcodeproj \
  -scheme DemoApp1 \
  -derivedDataPath './customFolder' \
  -sdk iphonesimulator \
  -arch x86_64 \
  -configuration Debug \
  CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO

# Check if AppsToTest folder exists, create one if not, and ensure it's empty
if [ ! -d "AppsToTest" ]; then
    mkdir -p AppsToTest
else
    rm -rf AppsToTest/*
fi

# Zip the app if it exists
if [ -d "customFolder/Build/Products/Debug-iphonesimulator/DemoApp1.app" ]; then
    zip -r AppsToTest/DemoApp1.zip customFolder/Build/Products/Debug-iphonesimulator/DemoApp1.app
else
    echo "Error: DemoApp1.app not found"
fi

# Zip the app if it exists
if [ -d "customFolder/Build/Products/Debug-iphonesimulator/DemoApp1UITests-Runner.app" ]; then
    zip -r AppsToTest/DemoApp1UITests-Runner.zip customFolder/Build/Products/Debug-iphonesimulator/DemoApp1UITests-Runner.app
else
    echo "Error: DemoApp1UITests-Runner.app not found"
fi

# Run sauceLab tests
#saucectl run -c .sauce/config-sim.yml