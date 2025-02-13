# FiveM Phone Box Crime Activity (QBCore)

This is a **low-level crime activity** for **FiveM (QBCore Framework)** where players can tamper with **phone boxes** to gain **shiny coins** using a **maintenance card**. It includes a **minigame**, a **cooldown per phone box**, and a **chance to alert the police**.

Preview: https://youtu.be/QOSkSs7fDAU

---

## 🚀 Features
- 📌 **Interactable phone boxes** (via `qb-target`)
- 🛠 **Requires a Maintenance Card** (`maintenance_card`)
- 🎮 **Minigame for hacking** (via `glow_minigames`)
- ⚡ **Failure causes electrocution & ragdoll**
- 🎁 **Success grants 2-6 shiny coins** (`shiny_coin`)
- 🚨 **50% chance of police alert**
- ⏳ **Per-phone-box cooldown (5 minutes)**

---

## 📂 **Installation**
### 1️⃣ **Download & Add the Resource**
1. Place the resource in your `resources/[qb]` folder.
2. Add the following line to your `server.cfg`:
   ```
   ensure qb-phoneboxcrime
   ```

### 2️⃣ **Dependencies**
This script requires:
- ✅ **QBCore Framework** (`qb-core`)
- ✅ **qb-target** (for interaction)
- ✅ **glow_minigames** (for the minigame)
- ✅ **qb-inventory** (for item handling)
- ✅ **qb-policejob** (for police alerts)

Ensure these are installed before using this script.

---

## 🛠 **Setup Instructions**
### 🔹 **1. Add Items to `qb-core/shared/items.lua`**
Add the following items inside `qb-core/shared/items.lua`:

```lua
maintenance_card = {
    name = "maintenance_card",
    label = "Maintenance Card",
    weight = 100,
    type = "item",
    image = "maintenance_card.png",
    unique = false,
    useable = false,
    shouldClose = false,
    description = "A special card used to access phone boxes."
},

shiny_coin = {
    name = "shiny_coin",
    label = "Shiny Coin",
    weight = 50,
    type = "item",
    image = "shiny_coin.png",
    unique = false,
    useable = false,
    shouldClose = false,
    description = "An old but valuable shiny coin."
},
```

### 🔹 **2. Add Inventory Images**
Copy the images from the `items` folder:
- `maintenance_card.png`
- `shiny_coin.png`

Place them inside:
```
[qb-inventory]/html/images/
```

---

## 🎮 **How to Use In-Game**
1. **Find a phone box**
2. **Use a Maintenance Card** (`maintenance_card`) to start hacking.

---

## ⚠️ **License**
This project is licensed under the **MIT License**.  
You are free to modify and distribute it as needed.

---

## 💬 **Support**
For issues or suggestions, feel free to open a GitHub issue.  
```
