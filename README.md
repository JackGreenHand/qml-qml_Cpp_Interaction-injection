环境：
	window环境+QT6+VS2022+cmake编译方式
说明：
	主要是为了实现qml语言如何和底层C++语言进行交互，数据处理
	这里例子是：C++类注入qml，在qml中实现调用C++对象的方式来进行交互
	主要用到的思路是：
		1、定义一个C++类
		2、在main.cpp里面实例化这个C++类，通过QQmlApplicationEngine engine对象的接口来注入C++对象供qml使用
		3、在qml中调用这个对象的接口
		
	实现大体伪代码：
		1)创建一个C++类 MyQmlClass
			定义两个接口：
				Q_INVOKABLE void setValue(int value);
				Q_INVOKABLE int getValue();
			类里面的接口用Q_INVOKABLE修饰，就可以对qml引擎开放
		2)在main.cpp里面注入的C++接口
			//包含这两个头文件
			#include <QQmlContext>
			#include"myqmlclass.h"
			...
			MyQmlClass myQmlImp; //C++类
			engine.rootContext()->setContextProperty("myQmlImp",&myQmlImp);//注入到qml中
			...
		3)在Main.qml中调用注入的对象myQmlImp
			...
			var value = textField.text
			myQmlImp.setValue(value)
			...
			...
			label.text = myQmlImp.getValue()
			...
打开方式：
	把源文件下载，打开qt6，点击右上角的打开项目，把里面的内容都框进去即可