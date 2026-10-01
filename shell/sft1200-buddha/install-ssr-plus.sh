#!/bin/sh
# 25passwall 自托管备份 (上游: ericwang2006/sft1200_buddha, 备份日期: 2026-10-01)
# SSR-Plus 一键安装, 软件源从本账号的 fork 拉取
# 一键运行:
#   wget -qO- https://raw.githubusercontent.com/euv7duv/25passwall/main/shell/sft1200-buddha/install-ssr-plus.sh | sh
sed -i '/sft1200_buddha/d' /etc/opkg/customfeeds.conf
echo "src/gz sft1200_buddha https://cdn.jsdelivr.net/gh/euv7duv/sft1200_buddha" >>/etc/opkg/customfeeds.conf
opkg update
opkg install luci luci-i18n-base-zh-cn luci-app-ssr-plus luci-i18n-ssr-plus-zh-cn
wget -O /tmp/libsodium.ipk https://cdn.jsdelivr.net/gh/euv7duv/sft1200_buddha/libsodium_1.0.18-2021-09-17-64129657_mips_siflower.ipk
opkg install /tmp/libsodium.ipk
