# Metro Fade Zone Notification Script for FiveM/QBCore

A modern, customizable, and visually stunning zone notification system for FiveM/QBCore servers. Built with React (NUI) and Lua, this script provides immersive, animated, and category-aware notifications for any location or zone in your GTA V server.

---

## 🚀 Features

- **Modern Metro Fade UI:** Sleek, pill-style notification bar with glassmorphism, shadows, and smooth animations.
- **Category-Based Customization:** Each zone can have its own color, icon, warning, and sound based on type (gang, police, ems, safe, etc.).
- **Material Icons:** Uses Material Icons for location, weather, time, and warnings.
- **Dynamic Weather & Time:** Shows in-game weather and time with matching icons and readable text.
- **Progress Bar:** Animated progress bar at the bottom of the notification, color-matched to the zone.
- **Configurable Sounds:** Play different sounds for each zone type (gang, police, ems, safe, etc.) with per-zone enable/disable.
- **Custom Icons per Zone:** Set a custom icon for any zone via config.
- **Warning Badge:** Prominent, colored warning badge for high-risk or special zones.
- **Cooldown & Duration:** Configurable cooldown and display duration for notifications.
- **Optimized & Lightweight:** Efficient Lua and React code, minimal performance impact.
- **Easy to Configure:** All zones, colors, icons, warnings, and sounds are set in `config.lua`.

---

## 💡 Why Use This Script?

- **Professional Look:** Instantly modernizes your server's UI with a clean, immersive notification system.
- **Highly Customizable:** Every zone can look, sound, and behave differently—perfect for RP, gang wars, police, events, and more.
- **Player Engagement:** Audio-visual feedback keeps players aware and engaged with their environment.
- **Easy Integration:** Plug-and-play for any QBCore or standalone FiveM server.
- **Actively Maintained:** Built with best practices, easy to extend and update.

---

## 🛠️ Installation

### 1. **Add the Resource**
- Place the entire script folder (e.g. `whereami`) in your server's `resources` directory.

### 2. **Configure Your Zones**
- Open `config.lua` and define your zones:
  - Set `name`, `description`, `coords`, `radius`, `type`, `color`, `icon`, `warning`, `sound`, and `soundType` as needed.
  - Example:
    ```lua
    {
      name = "Ballas Territory",
      description = "Ballas Gang Area - High Risk!",
      coords = vector3(110.0, -1960.0, 20.0),
      radius = 60.0,
      type = "gang",
      color = "#f43f5e",
      warning = "You are entering Ballas territory! Be careful.",
      sound = true,
      soundType = "gang",
      icon = "location_on"
    }
    ```

### 3. **Start the Resource**
- Add `ensure whereami` (or your folder name) to your `server.cfg`.

### 4. **Dependencies**
- Requires a working FiveM server (QBCore or standalone).
- No external dependencies—React NUI is bundled.

### 5. **Customization**
- Edit `html/src/styles.css` for UI tweaks.
- Edit `html/src/App.tsx` for advanced logic or new features.
- Add or change sounds in `client/cl_whereami.lua` as needed.

---

## 📝 Example Zone Types & Sounds
| Type      | Color      | Icon           | Sound (default)         |
|-----------|------------|----------------|------------------------|
| gang      | #f43f5e    | report         | ATM_WINDOW             |
| police    | #3b82f6    | local_police   | Enter_1st              |
| ems       | #3b82f6    | medical_services| SELECT                |
| safe      | #22c55e    | verified       | Enter_1st              |
| military  | #f59e0b    | military_tech  | Enter_1st              |
| shop      | #a1a1aa    | store          | Enter_1st              |
| entertainment | #a1a1aa| casino         | Enter_1st              |

---

## 🧑‍💻 How It Works
- The script checks the player's position every few milliseconds.
- When entering a zone, it sends zone data, time, and weather to the React NUI.
- The NUI displays a beautiful, animated notification with all relevant info.
- Sounds and icons are played/shown based on zone type and config.

---

## ❓ Support & Customization
- For help, suggestions, or custom features, open an issue or contact the author.
- You can easily extend the script for more zone types, icons, or sounds.

---

Enjoy your modern FiveM zone notifications! 🚦
