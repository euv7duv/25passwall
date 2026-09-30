#!/bin/sh
# 25passwall - apk --allow-untrusted 一键开关
# 适用于使用 apk 包管理器的 OpenWrt 25.x
#
# 一键运行:
#   wget -O toggle.sh https://raw.githubusercontent.com/euv7duv/25passwall/main/shell/apk-toggle.sh && sh toggle.sh

TARGET_SCRIPT="/usr/libexec/package-manager-call"

if [ ! -f "$TARGET_SCRIPT" ]; then
    echo "错误: 找不到 $TARGET_SCRIPT"
    echo "该脚本仅适用于使用 apk 包管理器的 OpenWrt 25.x 系统"
    exit 1
fi

if grep -q 'action="add --allow-untrusted"' "$TARGET_SCRIPT" 2>/dev/null; then
    STATUS="已开启"
else
    STATUS="已关闭"
fi

clear
echo "======================================"
echo "   APK --allow-untrusted 开关"
echo "   当前状态: $STATUS"
echo "======================================"
echo " 1 - 开启 (apk add 自动添加 --allow-untrusted)"
echo " 2 - 关闭 (恢复默认)"
echo "======================================"
printf "请输入选项 [1/2]: "
read num

case $num in
    1)
        sed -i 's/^[[:space:]]*action="add"$/                action="add --allow-untrusted"/' "$TARGET_SCRIPT"
        echo ""
        echo "已开启: apk add --allow-untrusted"
        ;;
    2)
        sed -i 's/^[[:space:]]*action="add --allow-untrusted"$/                action="add"/' "$TARGET_SCRIPT"
        echo ""
        echo "已关闭: 恢复为默认 apk add"
        ;;
    *)
        echo ""
        echo "输入错误, 请输入 1 或 2"
        ;;
esac
