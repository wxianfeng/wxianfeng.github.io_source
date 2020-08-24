---
title: "SpringMVC log4j, log4j2 配置"
date: 2020-04-25T00:11:46+08:00
draft: false
categories: ["Java"]
tags: ["Java", "SpringMVC", "log4j", "log4j2"]
---

> 发现网上关于 log4j, log4j2 的配置比较乱。特别是引用的包，参差不齐，本人最近从 log4j 升级到了 log4j2，特此记录，供参考。

## log4j 配置
### Maven
```xml
<slf4j.version>1.7.7</slf4j.version>
<log4j.version>1.2.16</log4j.version>

<dependency>
    <groupId>org.slf4j</groupId>
    <artifactId>slf4j-log4j12</artifactId>
    <version>${slf4j.version}</version>
</dependency>
<dependency>
    <groupId>org.slf4j</groupId>
    <artifactId>slf4j-api</artifactId>
    <version>${slf4j.version}</version>
</dependency>
<dependency>
    <groupId>log4j</groupId>
    <artifactId>log4j</artifactId>
    <version>${log4j.version}</version>
</dependency>
```

`slf4j-log4j12`: slf4j 到 log4j 的绑定器  
`slf4j-api`: slf4j 库，日志门面工厂方法  
`log4j`: log4j 实现库  

### web.xml
```xml
    <!-- log4j -->
    <context-param>
        <param-name>log4jConfigLocation</param-name>
        <param-value>/WEB-INF/log4j.properties</param-value>
    </context-param>
```

### log4j.properties
```java
log4j.rootLogger = info, fileout, stdout

log4j.appender.fileout=org.apache.log4j.FileAppender
log4j.appender.fileout.File=${user.home}/logs/app.log
log4j.appender.fileout.layout=org.apache.log4j.PatternLayout
log4j.appender.fileout.layout.ConversionPattern=%d{yyyy-MM-dd HH:mm:ss,SSS} app [%X{traceId}] %-5p [%t] %c{2}:%L - %m%n

log4j.appender.stdout=org.apache.log4j.ConsoleAppender
log4j.appender.stdout.layout=org.apache.log4j.PatternLayout
log4j.appender.stdout.layout.ConversionPattern=%d{yyyy-MM-dd HH:mm:ss,SSS} app [%X{traceId}] %-5p [%t] %c{2}:%L - %m%n
```

### 使用
```java
public class A {
    private static final Logger logger = LoggerFactory.getLogger(A.class);
}
```


## log4j2 配置
### Maven
```xml
<dependency>
    <groupId>org.slf4j</groupId>
    <artifactId>slf4j-api</artifactId>
    <version>1.7.7</version>
</dependency>
<dependency>
  <groupId>com.lmax</groupId>
  <artifactId>disruptor</artifactId>
  <version>3.3.0</version>
</dependency>
<dependency>
    <groupId>org.apache.logging.log4j</groupId>
    <artifactId>log4j-core</artifactId>
    <version>2.8</version>
</dependency>
<dependency>
    <groupId>org.apache.logging.log4j</groupId>
    <artifactId>log4j-api</artifactId>
    <version>2.8</version>
</dependency>
<dependency>
    <groupId>org.apache.logging.log4j</groupId>
    <artifactId>log4j-slf4j-impl</artifactId>
    <version>2.8</version>
</dependency>
```

`slf4j-api`: slf4j 库，日志门面工厂方法  
`disruptor`: log4j2 异步日志依赖库  
`log4j-core`: log4j2 核心库  
`log4j-api`: log4j2 核心库  
`log4j-slf4j-impl`: slf4j 到 log4j2 的绑定器，桥接包  

### log4j2.xml
```xml
<?xml version="1.0" encoding="UTF-8"?>
<Configuration status="info">
    <Properties>
        <Property name="fileName">${sys:user.home}/logs/app.log</Property>
    </Properties>
    <Appenders>
        <Console name="Console" target="SYSTEM_OUT">
            <PatternLayout pattern="%d{yyyy-MM-dd HH:mm:ss,SSS} ${hostName} app [%X{traceId}] %-5p [%t] %c{2}:%L - %m%n"/>
        </Console>

        <RollingRandomAccessFile name="RollingRandomAccessFile" fileName="${fileName}" filePattern="${sys:user.home}/logs/app-%d{MM-dd-yyyy}-%i.log.gz">
            <PatternLayout pattern="%d{yyyy-MM-dd HH:mm:ss,SSS} ${hostName} app [%X{traceId}] %-5p [%t] %c{2}:%L - %m%n"/>
            <Policies>
                <SizeBasedTriggeringPolicy size="500 MB" />
                <TimeBasedTriggeringPolicy />
            </Policies>
        </RollingRandomAccessFile>

        <Async name="Async">
            <AppenderRef ref="Console"/>
            <AppenderRef ref="RollingRandomAccessFile"/>
        </Async>
    </Appenders>
    <Loggers>
        <Logger name="RollingRandomAccessFileLogger" level="info">
            <AppenderRef ref="RollingRandomAccessFile"/>
        </Logger>
        <Logger name="AsyncLogger" level="info" additivity="false">
            <AppenderRef ref="Async"/>
        </Logger>
        <Root level="info">
            <AppenderRef ref="Console"/>
            <AppenderRef ref="RollingRandomAccessFile"/>
        </Root>
    </Loggers>
</Configuration>
```

### 使用
使用和之前 log4j 一样  

## 总结
推荐使用 log4j2，支持异步日志，日志中还可以取到 `${hostName}`  
