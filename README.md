# Shell常用脚本
----------

  常用shell脚本

----------
## 功能说明

描述：

* await 
  说明：执行阻塞等待, 
  场景：启动某个服务，等待服务完全启动
  使用：await $pid $port $timeout

----------
## 开发说明

  开放环境：
 
    shc环境：cd util && sh shc-install

  开发步骤
  
  1.参考 src/template 模板开发

  2.通过 sh build.sh 自动编译成静态二进制可执行文件

  3.复制 bin 目录下可执行二进制文件至 /usr/local/bin 目录下

----------
## 运维使用

  基于上述说明下载 bin 目录下对应的文件

----------
## License
[Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0.html) Copyright (C) Apache Software Foundation

