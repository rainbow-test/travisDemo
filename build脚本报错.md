# build脚本报错

## 报错问题列表

### 1、Xocde没有设置与`.mobileprovision `文件对应的 Bundle Identity

低级错误😂

### 2、ARCHIVE FAILED 报错

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

### 3、EXPORT FAILED 成功后导出报错

```
** ARCHIVE SUCCEEDED **
2019-04-19 04:28:43.566 xcodebuild[2207:6298] [MT] IDEDistribution: -[IDEDistributionLogging _createLoggingBundleAtPath:]: Created bundle at path '/var/folders/nz/vv4_9tw56nv9k3tkvyszvwg80000gn/T/PgyerDemo_2019-04-19_04-28-43.565.xcdistributionlogs'.

error: exportArchive: "PgyerDemo.app" requires a provisioning profile.
Error Domain=IDEProvisioningErrorDomain Code=9 ""PgyerDemo.app" requires a provisioning profile." UserInfo={NSLocalizedDescription="PgyerDemo.app" requires a provisioning profile., NSLocalizedRecoverySuggestion=Add a profile to the "provisioningProfiles" dictionary in your Export Options property list.}
** EXPORT FAILED **
The command "./scripts/build.sh" exited with 70.
```

#### 解决

可能是因为导出的 ExportOptions.plist 是自动管理证书导出的 ipa 文件里面的，而不是选择选择相应的证书导出的。plist 也就没有指定相应的证书。


## 命令检查

* xcodebuild -project PgyerDemo.xcodeproj -scheme PgyerDemo -archivePath PgyerDemo.xcarchive archive
* xcodebuild -exportArchive -archivePath PgyerDemo.xcarchive -exportPath ./build -exportOptionsPlist ExportOptions.plist
* 上面两行命令都能正常执行