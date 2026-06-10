#!/bin/bash
#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "错误: 请提供图片路径！"
    echo "用法: $0 /path/to/wallpaper.png"
    exit 1
fi

wallpaper_path=$(realpath "$1")

if [ ! -f "$wallpaper_path" ]; then
    echo "错误: 找不到文件 '$wallpaper_path'"
    exit 1
fi

rofi_wallpaper_target="$HOME/.config/rofi/.current_wallpaper"
hypr_wallpaper_target="$HOME/.config/hypr/wallpaper_effects/.wallpaper_current"
mkdir -p "$(dirname "$rofi_wallpaper_target")"

if ln -sf "$wallpaper_path" "$rofi_wallpaper_target" && ln -sf "$wallpaper_path" "$hypr_wallpaper_target"; then
    echo "成功: 已将壁纸同步至 Rofi && Hypr 缓存"
    
    echo "正在运行 wallust 提取色彩调色盘..."
    wallust run "$wallpaper_path" -s &
else
    echo "错误: 创建 Rofi 壁纸软链接失败"
    exit 1
fi

exit 0
