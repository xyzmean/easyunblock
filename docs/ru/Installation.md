# Установка

← [На главную](Home.md)

## Быстрый старт с автонастройкой туннеля WARP (рекомендуется)

На роутере с OpenWrt **24.10+ / 25.12+** (менеджер пакетов `apk`), от root:

    wget -O - https://raw.githubusercontent.com/xyzmean/easyunblock/main/easyinstall.sh | sh

Установщик сам:
- находит последний релиз easyunblock на GitHub;
- скачивает и устанавливает пакет `easyunblock` и поддержку AmneziaWG;
- автоматически регистрирует устройство в Cloudflare WARP и настраивает туннель с обфускацией DPI;
- включает правила маршрутизации.

## Установка только движка (для своего туннеля VPN)

    wget -O - https://raw.githubusercontent.com/xyzmean/easyunblock/main/install.sh | sh

После установки настройте свой VPN-туннель в разделе **Сеть → Интерфейсы** и добавьте его в `/etc/config/splify` или через `easyunblock-ctl`.

## Требования

- OpenWrt **24.10+** или **25.12+** с менеджером `apk`.
- Доступ в интернет на роутере (для скачивания пакетов и списков).
- Права root.

## Вручную (из файлов релиза)

Если нужно поставить из заранее скачанного файла:

    apk add --allow-untrusted ./easyunblock-*.apk

## Удаление

    wget -O - https://raw.githubusercontent.com/xyzmean/easyunblock/main/uninstall.sh | sh

Конфигурация `/etc/config/splify` при удалении сохраняется — удалите вручную, если она больше не нужна.
