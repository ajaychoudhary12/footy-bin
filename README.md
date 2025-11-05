# ⚽ FootyBin

A Flutter app for viewing **English Premier League** stats — built with a clean architecture, network layer abstraction, and modern UI inspired by Football Manager and SofaScore.

---

## 🚀 Features

- 📊 **Live League Standings**
  - Displays Premier League table with club info, points, wins, draws, and losses.
- 🏟️ **Team Details**
  - Shows each team’s season statistics (fixtures, goals, form, etc.)
- 🎨 **Custom Dark Theme**
  - Purple-tinted modern dark UI inspired by Football Manager 2024.
- 🧩 **Modular Architecture**
  - Organized by `modules/` with repositories, models, and views separated.
- 🌐 **API Integration**
  - Uses [API-Sports Football API](https://www.api-football.com/) for real-time data.

---

## 🏗️ Tech Stack

- **Framework:** Flutter 3.x
- **State Management:** BLoC (planned)
- **Networking:** `http` package with a reusable `NetworkService`
- **Dependency Injection:** `get_it`
- **JSON Parsing:** Factory constructors with null-safety
- **UI:** Material 3 + Custom `AppColors` design system

## Screenshots

### Home: 
<img width="300" height="650" alt="Simulator Screenshot - iPhone 16 Pro - 2025-11-05 at 18 16 48" src="https://github.com/user-attachments/assets/4b3ca51a-b47b-45cb-9435-91b939b9eeb5" />

### Detail: 
<img width="300" height="650" alt="Simulator Screenshot - iPhone 16 Pro - 2025-11-05 at 18 16 51" src="https://github.com/user-attachments/assets/95e18fe3-496d-47c7-915d-5c20f33cbf3f" />
