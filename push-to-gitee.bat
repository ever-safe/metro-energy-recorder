@echo off
chcp 65001 >nul
echo ============================================
echo  地铁能耗工具 - Gitee 国内镜像一键推送
echo ============================================
echo.
echo 前置条件：请先在 Gitee 网页上创建空仓库
echo.
echo  1. 打开 https://gitee.com/projects/new
echo  2. 仓库名填：metro-energy-recorder
echo  3. 描述填：地铁能耗OCR + 日检智能分配工具（GitHub 国内加速镜像）
echo  4. 选择：公开（免费）
echo  5. 初始化选项：都不要勾（空仓库）
echo  6. 点「创建」
echo.
echo 创建完成后，回来按任意键继续 push...
pause >nul

echo.
echo [1/2] 添加 Gitee remote...
git remote remove origin 2>nul
git remote add origin https://gitee.com/lvzhichenggui/metro-energy-recorder.git

echo [2/2] 推送代码...
git push -u origin main
if %errorlevel% neq 0 (
    echo.
    echo ❌ 推送失败，请检查：
    echo   - Gitee 仓库是否已创建？
    echo   - 是否有网络？
    pause
    exit /b 1
)

echo.
echo ✅ 推送成功！
echo.
echo 接下来 30 秒开通 Gitee Pages：
echo   1. 打开 https://gitee.com/lvzhichenggui/metro-energy-recorder/pages
echo   2. 分支选 main，目录选 /
echo   3. 点「启动」
echo   4. 等约 60 秒，就能得到国内加速链接
echo.
echo 之后手机用 Gitee Pages 链接打开，首次加载约 30-60 秒（比 GitHub Pages 快 5-10 倍）
echo 两个工具同源，一个加载完另一个秒开
echo.
pause
