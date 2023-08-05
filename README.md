![](https://docs.arklnk.com/images/ark-admin.png)

## 官方文档
🚀 基于Nestjs + Vue3 + TypeScript + Element-Plus的高效权限管理系统

## 技术栈

- 后端：**`node.js` `nestjs.js` `redis` `mysql` `typescript`**
- 前端：**`vue.js` `element-plus` `jsx` `pinia` `vue-router`**

## 开发

| 账号 | 密码   | 备注     |
| ---- | ------ | -------- |
| demo | 123456 | 演示账号 |

### 1、创建数据库
```sh
并导入初始sql文件(deploy/sql/init.sql)

```

### 2、修改配置文件
```
修改配置，配置文件位于/bootstrap.yaml

application:
  # 服务端口
  port: 7001
  # 接口路由与redis前缀
  name: admin
  # 根管理员ID
  rootUserId: 1
  # 密码盐
  userPwdSalt: K8i8mTfc5sTXO7OG
  # 默认密码
  userDefaultPwd: 123456
  # minimum internal requirements protect id
  protectSysPermmenuMaxId: 44
  protectSysDictionaryMaxId: 4

logger:
  level: verbose
  maxFiles: 31

jwt:
  secret: kRZ3kA7LuB4LqOWi
  expires: 86400

redis:
  host: 127.0.0.1
  port: 6379
  password: 123456
  db: 0

db:
  host: 127.0.0.1
  port: 3306
  username: root
  password: '123456'
  database: kk_admin
  logging: true

swagger:
  enable: true
  path: documentation

```
### 3、运行
```
1、npm install 或者  npm install -g pnpm && pnpm i

2、npm run dev
默认npm run dev运行是以tsc进行编译后运行，编译过慢时可使用pnpm dev:hmr以webpack方式编译运行
```

## 部署
```
1、npm install -g pnpm

2、pnpm i

3、pnpm build

4、npm run pm2
```

## pm2进程管理器

PM2 是一个带有负载均衡功能的 Node 应用进程管理器。

![](https://gitee.com/king121314/king-static/raw/master/20210725141040.png)

**主要特性：**

- 内建负载均衡（使用 Node cluster 集群模块）
- 后台运行
- 0 秒停机重载
- 停止不稳定的进程（避免无限循环）
- 具有 Ubuntu 和 CentOS 的启动脚本

#### 常用命令

- 查看启动列表

```
pm2 list

```


- 启动服务

```
pm2 restart [ID] //重新启动应用 id
pm2 start ecosystem.config.js //根据配置文件启动
```

- 停止服务
```
pm2 stop all               //停止所有应用
pm2 stop [AppName]        //根据应用名停止指定应用
pm2 stop [ID]             //根据应用id停止指定应用
```

- 删除应用
```
pm2 delete all               //关闭并删除应用
pm2 delete [AppName]        //根据应用名关闭并删除应用
pm2 delete [ID]            //根据应用ID关闭并删除应用

```


- 创建开机自启动
```
pm2 startup
```

- 查看每个应用程序占用情况
```
pm2 monit
```

- 日志查看
```
pm2 logs            //查看所有应用日志
pm2 logs [Name]    //根据指定应用名查看应用日志
pm2 logs [ID]      //根据指定应用ID查看应用日志
```


## docker-compose

```sh
git clone https://github.com/xxxxxxx.git
```

```sh
cd ark-admin-nest
```

```
docker-compose up -d
```

登录地址：[http://127.0.0.1](http://127.0.0.1)

| 账号   | 密码   | 备注       |
| ------ | ------ | ---------- |
| arklnk | 123456 | 超级管理员 |
| demo   | 123456 | 演示账号   |


## 浏览器支持

Modern browsers and Internet Explorer 10+.

| [![IE / Edge](https://raw.githubusercontent.com/alrra/browser-logos/master/src/edge/edge_48x48.png)](https://godban.github.io/browsers-support-badges/) IE / Edge | [![Firefox](https://raw.githubusercontent.com/alrra/browser-logos/master/src/firefox/firefox_48x48.png)](https://godban.github.io/browsers-support-badges/) Firefox | [![Chrome](https://raw.githubusercontent.com/alrra/browser-logos/master/src/chrome/chrome_48x48.png)](https://godban.github.io/browsers-support-badges/) Chrome | [![Safari](https://raw.githubusercontent.com/alrra/browser-logos/master/src/safari/safari_48x48.png)](https://godban.github.io/browsers-support-badges/) Safari |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| IE10, IE11, Edge                                             | last 2 versions                                              | last 2 versions                                              | last 2 versions                                              |
