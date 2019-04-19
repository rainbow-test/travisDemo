# build脚本报错

## 报错

```
4.39s$ ./scripts/build.sh
User defaults from command line:
    IDEArchivePathOverride = /Users/travis/build/rainbow-test/travisDemo/PgyerDemo.xcarchive
note: Using new build system
note: Planning build
note: Constructing build description
Build system information
error: No profiles for 'rainbow.PgyerDemo' were found: Xcode couldn't find any iOS App Development provisioning profiles matching 'rainbow.PgyerDemo'. Automatic signing is disabled and unable to generate a profile. To enable automatic signing, pass -allowProvisioningUpdates to xcodebuild. (in target 'PgyerDemo')
** ARCHIVE FAILED **
error: archive not found at path '/Users/travis/build/rainbow-test/travisDemo/PgyerDemo.xcarchive'
** EXPORT FAILED **
The command "./scripts/build.sh" exited with 65.
after_script
0.05s$ ./scripts/remove-key.sh
Done. Your build exited with 1.
```

## 命令检查

* xcodebuild -project PgyerDemo.xcodeproj -scheme PgyerDemo -archivePath PgyerDemo.xcarchive archive
* xcodebuild -exportArchive -archivePath PgyerDemo.xcarchive -exportPath ./build -exportOptionsPlist ExportOptions.plist
* 上面两行命令都能正常执行