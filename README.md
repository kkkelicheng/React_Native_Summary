# react-native总结

# 写在前面

本项目的目的仅仅是想把react-native做一个<span style="color:red">简单的应用</span>，**嵌入到原生中**。

一者是为了使用热更新，二者是为了某些业务的需求。

对react-native不考虑大的担当，权当玩一玩。

## 总体印象

1. react-native所需要的原生工程文件通过npm来安装。
2. CocoaPods 来引入这些安装的工程。
3. 在工程的根目录新建一个固定名字的index.ios.js文件，作为react-native的入口。


## 嵌入原生的应用
假设你现在有一个原生的app，也假设用的是CocoaPods做为管理工具。

#### 当前环境

* node v7.8.0
* npm v4.2.0 
* CocoaPods v1.2.1
* Xcode v8.2

#### 嵌入的准备工作仅三步
1. 新建一个package.json供npm使用
	
	```
	// package.json  
	{
	  "name": "React_Native_Summary",
	  "version": "1.0.0",
	  "private": true,
	  "scripts": {
	    "start": "node node_modules/react-native/local-cli/cli.js start"
	  },
	  "dependencies": {
	    "react": "15.4.1",
	    "react-native": "0.42"
	  }
	}
	
	```
	示例中的version字段没有太大意义（除非你要把你的项目发布到npm仓库）,当然`"1.0"`这样写非法，格式要求，要写三段式。
	
	scripts中是用于启动packager服务的命令。
	
	dependencies中的react和react-native的版本取决于你的具体需求。一般来说我们推荐使用最新版本。
	
	你可以使用npm info react和npm info react-native来查看当前的最新版本。
	
	另外，react-native对react的版本有严格要求，高于或低于某个范围都不可以。
	

2. 安装package.json中的组件
在`package.json`所在的文件目录，使用终端
	
	```
	$ npm install
	#安装React和React Native模块
	```
3. 使用CocoaPods添加模块依赖关系

	下面是Podfile文件
	
	```
	# Uncomment the next line to define a global platform for your project
	# platform :ios, '9.0'
	
	target 'React_Native_Summary' do
	
	 # 'node_modules'目录一般位于根目录中
	  # 但是如果你的结构不同，那你就要根据实际路径修改下面的`:path`
	  pod 'React', :path => './node_modules/react-native', :subspecs => [
	    'Core',
	    'RCTText',
	    'RCTNetwork',
	    'RCTWebSocket', # 这个模块是用于调试功能的
	    # 在这里继续添加你所需要的模块
	  ]
	  # 如果你的RN版本 >= 0.42.0，请加入下面这行
	  pod "Yoga", :path => "./node_modules/react-native/ReactCommon/yoga"
	
	end
	
	```
	修改了Podfile文件以后，使用`pod install`来管理依赖关系

-----
	至此环境已经安装好了，可以写react-native的代码了。

# Demo文件说明

## 从index.ios.js开始
    在工程的根目录新建一个ios.index.js，入口就是这里了。以后的工作都是从这里开始。

## ReactNativeComponent中都是js页面

## WrappedViewFromRN封装的View和Controller

#Demo文件说明
##从index.ios.js开始
在工程的根目录新建一个ios.index.js，入口就是这里了。以后的工作都是从这里开始。
##ReactNativeComponent中都是js页面
##WrappedViewFromRN封装的View和Controller
- **WrappedRNView**


 	对ReactNative初始化来的View进行了一层包装方便使用。
	
- **WrappedRNViewController**
	
	对WrappedRNView进行了一层包装,直接加到了controller的rootView上，而没有进行替换。方便做其他的改动。


- **ExportedRNController**
	
	这个类其实继承自NSObject的，是自定义的一个JS向Native通信类。配合WrappedRNController使用，JS向Native发消息控制此对象中的WrappedRNController做出相应的动作。
	
	该类在JS的componentDidMount方法中调用此类，此时WrappedRNController中的view已经加载完。

##Examples都是例子文件



# 功能
#### 原生多入口进入RN页面
#### RN页面pop&push进入原生页面
这里的设计是RN页面跟原生的页面通信，将原生的页面暴露出来。
在项目中将Controller这个类以及Controller这个类的某些方法暴露给JS去调用。从而达到控制页面跳转的功能。

顺便说一下，RN自己实现的页面跳转那压根就不是页面跳转，因为没有controller去控制。



<br>

# 一些参考链接
[嵌入到现有原生应用（react-native中文网）](http://reactnative.cn/docs/0.43/integration-with-existing-apps.html#content)


