## 固件下载 [![](https://img.shields.io/badge/-编译状态及下载链接-FFFFFF.svg)](#固件下载-)
点击下表中 [![](https://img.shields.io/badge/下载-链接-blueviolet.svg?style=flat&logo=hack-the-box)](https://github.com/haiibo/OpenWrt/releases) 即可跳转到该设备固件下载页面
| 平台+设备名称 | 固件编译状态 | 配置文件 | 固件下载 |
| :-------------: | :-------------: | :-------------: | :-------------: |
| [![](https://img.shields.io/badge/OpenWrt-X86_64位-32C955.svg?logo=openwrt)](https://github.com/NextAbyss/OpenWRT_AutoCompile/blob/main/.github/workflows/OpenWRT_CI.yml) | [![](https://github.com/NextAbyss/OpenWRT_AutoCompile/actions/workflows/OpenWRT_CI.yml/badge.svg)](https://github.com/NextAbyss/OpenWRT_AutoCompile/actions/workflows/OpenWRT_CI.yml) | [![](https://img.shields.io/badge/编译-配置-orange.svg?logo=apache-spark)](https://github.com/haiibo/OpenWrt/blob/main/configs/x86_64.config) | [![](https://img.shields.io/badge/下载-链接-blueviolet.svg?logo=hack-the-box)](https://github.com/haiibo/OpenWrt/releases/tag/X86_64) |
| [![](https://img.shields.io/badge/OpenWrt-ARMv8_Mini-32C955.svg?logo=openwrt)](https://github.com/haiibo/OpenWrt/blob/main/.github/workflows/ARMv8-Mini-OpenWrt.yml) | [![](https://github.com/haiibo/OpenWrt/actions/workflows/ARMv8-Mini-OpenWrt.yml/badge.svg)](https://github.com/haiibo/OpenWrt/actions/workflows/ARMv8-Mini-OpenWrt.yml) | [![](https://img.shields.io/badge/编译-配置-orange.svg?logo=apache-spark)](https://github.com/haiibo/OpenWrt/blob/main/configs/armv8-mini.config) | [![](https://img.shields.io/badge/下载-链接-blueviolet.svg?logo=hack-the-box)](https://github.com/haiibo/OpenWrt/releases/tag/ARMv8_MINI) |
| [![](https://img.shields.io/badge/OpenWrt-ARMv8_Plus-32C955.svg?logo=openwrt)](https://github.com/haiibo/OpenWrt/blob/main/.github/workflows/ARMv8-Plus-OpenWrt.yml) | [![](https://github.com/haiibo/OpenWrt/actions/workflows/ARMv8-Plus-OpenWrt.yml/badge.svg)](https://github.com/haiibo/OpenWrt/actions/workflows/ARMv8-Plus-OpenWrt.yml) | [![](https://img.shields.io/badge/编译-配置-orange.svg?logo=apache-spark)](https://github.com/haiibo/OpenWrt/blob/main/configs/armv8-plus.config) | [![](https://img.shields.io/badge/下载-链接-blueviolet.svg?logo=hack-the-box)](https://github.com/haiibo/OpenWrt/releases/tag/ARMv8_PLUS) |
| [![](https://img.shields.io/badge/OpenWrt-Rockchip_平台-32C955.svg?logo=openwrt)](https://github.com/haiibo/OpenWrt/blob/main/.github/workflows/Rockchip-OpenWrt.yml) | [![](https://github.com/haiibo/OpenWrt/actions/workflows/Rockchip-OpenWrt.yml/badge.svg)](https://github.com/haiibo/OpenWrt/actions/workflows/Rockchip-OpenWrt.yml) | [![](https://img.shields.io/badge/编译-配置-orange.svg?logo=apache-spark)](https://github.com/haiibo/OpenWrt/blob/main/configs/rockchip.config) | [![](https://img.shields.io/badge/下载-链接-blueviolet.svg?logo=hack-the-box)](https://github.com/haiibo/OpenWrt/releases/tag/Rockchip) |
| [![](https://img.shields.io/badge/OpenWrt-树莓派_4B-32C955.svg?logo=openwrt)](https://github.com/haiibo/OpenWrt/blob/main/.github/workflows/RaspberryPi4-OpenWrt.yml) | [![](https://github.com/haiibo/OpenWrt/actions/workflows/RaspberryPi4-OpenWrt.yml/badge.svg)](https://github.com/haiibo/OpenWrt/actions/workflows/RaspberryPi4-OpenWrt.yml) | [![](https://img.shields.io/badge/编译-配置-orange.svg?logo=apache-spark)](https://github.com/haiibo/OpenWrt/blob/main/configs/rpi4.config) | [![](https://img.shields.io/badge/下载-链接-blueviolet.svg?logo=hack-the-box)](https://github.com/haiibo/OpenWrt/releases/tag/RaspberryPi4) |
| [![](https://img.shields.io/badge/OpenWrt-树莓派_3B/3B+-32C955.svg?logo=openwrt)](https://github.com/haiibo/OpenWrt/blob/main/.github/workflows/RaspberryPi3-OpenWrt.yml) | [![](https://github.com/haiibo/OpenWrt/actions/workflows/RaspberryPi3-OpenWrt.yml/badge.svg)](https://github.com/haiibo/OpenWrt/actions/workflows/RaspberryPi3-OpenWrt.yml) | [![](https://img.shields.io/badge/编译-配置-orange.svg?logo=apache-spark)](https://github.com/haiibo/OpenWrt/blob/main/configs/rpi3.config) | [![](https://img.shields.io/badge/下载-链接-blueviolet.svg?logo=hack-the-box)](https://github.com/haiibo/OpenWrt/releases/tag/RaspberryPi3) |

## 定制固件 [![](https://img.shields.io/badge/-项目基本编译教程-FFFFFF.svg)](#定制固件-)
1. 首先要登录 Gihub 账号，然后 Fork 此项目到你自己的 Github 仓库
2. 修改 `configs` 目录对应文件添加或删除插件，或者上传自己的 `xx.config` 配置文件
3. 插件对应名称及功能请参考恩山网友帖子：[Applications 添加插件应用说明](https://www.right.com.cn/forum/thread-3682029-1-1.html)
4. 如需修改默认 IP、添加或删除插件包以及一些其他设置请在 `diy-script.sh` 文件内修改
5. 添加或修改 `xx.yml` 文件，最后点击 `Actions` 运行要编译的 `workflow` 即可开始编译
6. 编译大概需要3-5小时，编译完成后在仓库主页 [Releases](https://github.com/haiibo/OpenWrt/releases) 对应 Tag 标签内下载固件
<details>
<summary><b>&nbsp;如果你觉得修改 config 文件麻烦，那么你可以点击此处尝试本地提取</b></summary>

1. 首先装好 Linux 系统，推荐 Debian 11 或 Ubuntu LTS

2. 安装编译依赖环境

   ```bash
   sudo apt update -y
   sudo apt full-upgrade -y
   sudo apt install -y ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential \
   bzip2 ccache cmake cpio curl device-tree-compiler fastjar flex gawk gettext gcc-multilib g++-multilib \
   git gperf haveged help2man intltool libc6-dev-i386 libelf-dev libglib2.0-dev libgmp3-dev libltdl-dev \
   libmpc-dev libmpfr-dev libncurses5-dev libncursesw5-dev libreadline-dev libssl-dev libtool lrzsz \
   mkisofs msmtp nano ninja-build p7zip p7zip-full patch pkgconf python2.7 python3 python3-pyelftools \
   libpython3-dev qemu-utils rsync scons squashfs-tools subversion swig texinfo uglifyjs upx-ucl unzip \
   vim wget xmlto xxd zlib1g-dev
   ```

3. 下载源代码，更新 feeds 并安装到本地

   ```bash
   git clone https://github.com/coolsnowwolf/lede
   cd lede
   ./scripts/feeds update -a
   ./scripts/feeds install -a
   ```

4. 复制 diy-script.sh 文件内所有内容到命令行，添加自定义插件和自定义设置

5. 命令行输入 `make menuconfig` 选择配置，选好配置后导出差异部分到 seed.config 文件

   ```bash
   make defconfig
   ./scripts/diffconfig.sh > seed.config
   ```

7. 命令行输入 `cat seed.config` 查看这个文件，也可以用文本编辑器打开

8. 复制 seed.config 文件内所有内容到 configs 目录对应文件中覆盖就可以了

- **本固件禁止用于任何商业用途，请务必严格遵守国家互联网使用相关法律规定！**


<a href="#readme">
<img src="https://img.shields.io/badge/-返回顶部-FFFFFF.svg" title="返回顶部" align="right"/>
</a>
