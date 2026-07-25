# 🚀 easyunblock

[![OpenWrt](https://img.shields.io/badge/OpenWrt-23.x%20%7C%2024.10%2B-blue.svg)](https://openwrt.org/)

**easyunblock** — это облегчённый движок выборочной маршрутизации для роутеров OpenWrt (без зависимостей на LuCI, без Sing-box и удалённого управления).
Заблокированные сайты идут через VPN (WireGuard / AmneziaWG), всё остальное — напрямую и на полной скорости.

---

## ⚡ Быстрый старт (Установка)

Самый простой способ получить рабочий обход блокировок «из коробки» (с автонастройкой туннеля WARP AmneziaWG):

```sh
wget -O - https://raw.githubusercontent.com/xyzmean/easyunblock/main/easyinstall.sh | sh
```

### Установка только пакета (для своего туннеля)
Если вы хотите использовать свой собственный VPN (WireGuard, AmneziaWG и др.):
```sh
wget -O - https://raw.githubusercontent.com/xyzmean/easyunblock/main/install.sh | sh
```

---

## 💡 Основные возможности

- 🎯 **Лёгкий CLI-движок**: Никакого раздутого веб-интерфейса и лишних зависимостей. Управление через конфигурацию `/etc/config/splify` и утилиту `easyunblock-ctl`.
- 🔄 **Автоматическое обновление списков**: Адреса заблокированных ресурсов подтягиваются и обновляются сами (`easyunblock-update-ipsum`, `easyunblock-update-ru`).
- 🛡️ **Поддержка WireGuard и AmneziaWG**: Работа через современные VPN-протоколы (включая обфускацию DPI).
- ♻️ **Резервирование**: Настройте запасные туннели — демон `easyunblock-failover` автоматически переключится на них при сбоях.
- 🩺 **Диагностика**: Встроенный инструмент проверки здоровья системы `easyunblock-doctor`.

---

## 🎛️ Управление и CLI

После установки вы можете управлять маршрутизацией из командной строки:

```sh
# Запустить / остановить / перезапустить службу
/etc/init.d/easyunblock start
/etc/init.d/easyunblock stop
/etc/init.d/easyunblock restart

# Применить правила маршрутизации
easyunblock-apply

# Проверка состояния и диагностика
easyunblock-doctor

# Управление через CLI
easyunblock-ctl status
easyunblock-ctl action apply
```

---

## 🗑️ Удаление

Если вы решите полностью удалить пакет с роутера:
```sh
wget -O - https://raw.githubusercontent.com/xyzmean/easyunblock/main/uninstall.sh | sh
```
