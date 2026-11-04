@echo off
chcp 65001 > nul
echo ====================================================
echo        سوق بلس / SouqPlus - رفع التحديثات إلى GitHub Pages
echo ====================================================
echo.
set /p commitMsg="اكتب رسالة التحديث (اضغط Enter للافتراضي: تحديث النظام): "
if "%commitMsg%"=="" set commitMsg=تحديث النظام

echo.
echo [1/3] جاري فحص وتجهيز الملفات...
git add .

echo.
echo [2/3] حفظ التغييرات محلياً...
git commit -m "%commitMsg%"

echo.
echo [3/3] رفع التحديثات إلى GitHub...
git push origin main

echo.
if %ERRORLEVEL% EQU 0 (
    echo ====================================================
    echo   تم رفع التحديث بنجاح إلى GitHub!
    echo   سيتم تحديث موقع GitHub Pages تلقائياً خلال دقيقة.
    echo ====================================================
) else (
    echo.
    echo [تنبيه] حدث خطأ أثناء الرفع. يرجى التأكد من ربط حساب GitHub والمستودع بشكل صحيح.
)
echo.
pause
