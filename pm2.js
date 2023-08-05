export default {
  "apps": {
      "name": "kk-server",                             // 项目名
      "script": "./dist/main.js",                      // 执行文件
      "error_file": "./pm2-logs/app-err.log",         // 错误日志文件
      "out_file": "./pm2-logs/app-out.log",           // 正常日志文件
      "min_uptime": "60s",                        // 应用运行少于时间被认为是异常启动
      "max_restarts": 30,                         // 最大异常重启次数，即小于min_uptime运行时间重启次数；
      "restart_delay": "10s" ,                     // 异常重启情况下，延时重启时间
      "env_prod": {
         "NODE_ENV": "production",                // 环境参数，当前指定为生产环境 process.env.NODE_ENV
      },
      "env_dev": {
          "NODE_ENV": "development",              // 环境参数，当前指定为开发环境 pm2 start app.js --env_dev
      },
      "env_test": {                               // 环境参数，当前指定为测试环境 pm2 start app.js --env_test
          "NODE_ENV": "test",
      }
  }
}
