# 25passwall

为 OpenWrt 25.x（aarch64_cortex-a53）构建 PassWall run 自解压包。

参考 [wkccd/CloudRunFilesBuilder](https://github.com/wkccd/CloudRunFilesBuilder)，本质是利用 [makeself](https://github.com/megastep/makeself) 将 apk 和安装脚本打包成自解压程序。包内容来自 `openwrt-passwall-build`（SourceForge）的最新 25.12 编译。

## 构建

- 在仓库 **Actions** 页面手动触发 `Build PassWall run` workflow，或等待每日定时构建（北京时间 06:08）。
- 构建产物 `.run` 文件会自动发布到 **Releases**。

## 在 OpenWrt 上安装

```sh
wget -O passwall.run <run下载地址>
sh passwall.run
```

只解压不安装：

```sh
sh passwall.run --target dir --noexec
```
