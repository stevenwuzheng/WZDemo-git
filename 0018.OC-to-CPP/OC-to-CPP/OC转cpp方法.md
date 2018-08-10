
将OC.m文件转换为C++文件方法：
cd  /Users/iot_imac/wz/01.Steven/WZDemo-git/OC-to-CPP/OC-to-CPP   #main.m父目录
xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc main.m -o main-arm64.cpp
