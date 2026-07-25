#!/bin/sh
# easyunblock — удаление.
#   wget -O - https://raw.githubusercontent.com/xyzmean/easyunblock/main/uninstall.sh | sh
set -eu
[ "$(id -u)" = "0" ] || { echo "запустите от root." >&2; exit 1; }
command -v apk >/dev/null 2>&1 || { echo "apk не найден." >&2; exit 1; }
echo "==> Удаляю easyunblock…"
apk del easyunblock 2>/dev/null || true
echo "Готово. Конфигурация /etc/config/splify сохранена (удалите вручную при желании)."
