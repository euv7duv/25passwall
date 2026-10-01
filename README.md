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

## apk --allow-untrusted 一键开关

在 OpenWrt 25.x 上一键开启/关闭 apk 的 `--allow-untrusted` 参数：

```sh
wget -O toggle.sh https://raw.githubusercontent.com/euv7duv/25passwall/main/shell/apk-toggle.sh && sh toggle.sh
```

## argosbx 一键部署(预设端口)

```sh
bash <(wget -qO- https://raw.githubusercontent.com/euv7duv/25passwall/main/shell/argosbx-quick.sh)
```

已预设各协议端口。安装脚本 `shell/argosbx.sh` 为上游快照备份(2026-10-01), 不依赖原仓库, 上游更新需手动同步:

```sh
vmpt="21345" vlpt="17542" xhpt="18456" vxpt="19912" vwpt="20154" xupt="20245" xcpt="20345" hypt="21254" tupt="20458" nvpt="22453" anpt="20578" arpt="20682" alns="y" hyjpt="25000:30000,40000" bash <(wget -qO- https://raw.githubusercontent.com/yonggekkk/argosbx/main/argosbx.sh)
```
