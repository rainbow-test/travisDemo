#!/bin/sh
xcrun xcodebuild -project PgyerDemo.xcodeproj -scheme PgyerDemo \
  -archivePath PgyerDemo.xcarchive archive

xcrun xcodebuild -exportArchive -archivePath PgyerDemo.xcarchive \
  -exportPath ./build -exportOptionsPlist ExportOptions.plist

