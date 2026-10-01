# 25passwall 自托管备份 (上游: ericwang2006/sft1200_buddha, 备份日期: 2026-10-01)
# 软件源已改为从本账号的 fork 拉取, 需先 fork 上游仓库到 euv7duv/sft1200_buddha
#!/bin/sh
sed -i '/sft1200_buddha/d' /etc/opkg/customfeeds.conf
echo "src/gz sft1200_buddha https://cdn.jsdelivr.net/gh/euv7duv/sft1200_buddha" >>/etc/opkg/customfeeds.conf
opkg update
action="$1"
case "${action}" in
ssr-plus)
	opkg install luci luci-i18n-base-zh-cn luci-app-ssr-plus luci-i18n-ssr-plus-zh-cn
	;;
passwall)
	opkg install luci luci-i18n-base-zh-cn luci-app-passwall luci-i18n-passwall-zh-cn
	;;
*)
	opkg install luci luci-i18n-base-zh-cn luci-app-passwall luci-i18n-passwall-zh-cn luci-app-ssr-plus luci-i18n-ssr-plus-zh-cn
	;;
esac
wget -O /tmp/libsodium.ipk https://cdn.jsdelivr.net/gh/euv7duv/sft1200_buddha/libsodium_1.0.18-2021-09-17-64129657_mips_siflower.ipk
opkg install /tmp/libsodium.ipk
