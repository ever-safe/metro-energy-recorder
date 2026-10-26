@echo off
chcp 65001 >nul
echo ============================================
echo  Gitee Pages 国内加速 - 一键部署指南
echo ============================================
echo.
echo 方式 A（最快，1分钟）：Gitee 网页上传
echo -------------------------------------------
echo 1. 打开 Gitee 仓库首页
echo 2. 点「文件」-「上传文件」
echo 3. 把 d:\ciomp\_gitee_mirror\ 下所有文件（含 models/ wasm/ 子目录）拖进去
echo 4. 提交 message 填：延迟加载优化
echo 5. 点「提交」
echo 6. 左栏点「服务」-「Gitee Pages」- 启动
echo    分支 main，目录 /
echo    约 60 秒后得到国内加速链接
echo.
echo 方式 B：请把 Gitee 仓库完整 URL 贴给我
echo -------------------------------------------
echo   类似 https://gitee.com/xxx/metro-energy-recorder
echo   我这边直接 git push
echo.
echo.
echo ============================================
echo  本地文件位置：d:\ciomp\_gitee_mirror\
echo ============================================
pause
