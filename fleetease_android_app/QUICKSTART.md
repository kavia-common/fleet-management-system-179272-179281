# FleetEase - Quick Start Guide

## 🚀 Get Running in 5 Minutes

### Prerequisites
- Flutter SDK 3.7.0+
- Android SDK
- Android Emulator or Physical Device

### Step 1: Navigate to Project
```bash
cd fleet-management-system-179272-179281/fleetease_android_app
```

### Step 2: Install Dependencies
```bash
flutter pub get
```

### Step 3: Run the App
```bash
flutter run
```

That's it! The app will launch with sample data pre-loaded.

---

## 📱 Using the App

### Dashboard Tab
- View fleet statistics (Total, Active, Maintenance)
- See quick stats (Groups, Events, Mileage)
- Preview upcoming maintenance events

### Vehicles Tab
- Browse all vehicles
- **Search**: Type in the search bar to filter by name, type, or license plate
- **Filter**: Tap chips to filter by status (All, Active, Maintenance)
- **Add**: Tap the + button to add a new vehicle
- **Edit/Delete**: Tap the three-dot menu on any vehicle card

### Groups Tab
- View all business groups
- See location and vehicle count
- **Add**: Tap the + button
- **Edit/Delete**: Use the three-dot menu

### Events Tab
- View all maintenance events with color coding
- **Filter**: Use chips to filter by status
- **Add**: Tap the + button
- **Pick Color**: Select from 6 color options when creating/editing
- **Schedule**: Use the date picker to set event dates

### Settings Tab
- **Notifications**: Toggle push notifications and specific alert types
- **Sync**: Enable auto-sync or manually trigger sync
- **Theme**: View the current Ocean Professional theme colors
- **About**: Check app version and details

---

## 🎨 Sample Data

The app comes with pre-loaded sample data:
- **4 Vehicles** across different groups and statuses
- **3 Business Groups** in various locations
- **4 Maintenance Events** with different statuses and colors

Feel free to add, edit, or delete any items to test the functionality!

---

## 🧪 Running Tests

```bash
# Run all tests
flutter test

# Run with verbose output
flutter test --verbose

# Run specific test file
flutter test test/widget_test.dart
```

All tests should pass ✅

---

## 🔨 Building

### Debug Build
```bash
flutter build apk --debug
```
Output: `build/app/outputs/flutter-apk/app-debug.apk`

### Release Build
```bash
flutter build apk --release
```
Output: `build/app/outputs/flutter-apk/app-release.apk`

### App Bundle (for Play Store)
```bash
flutter build appbundle --release
```
Output: `build/app/outputs/bundle/release/app-release.aab`

---

## 🔍 Code Structure

```
lib/
├── core/           # Shared functionality
│   ├── data/       # Data sources
│   ├── models/     # Data models
│   ├── services/   # Services (notifications, sync)
│   └── theme/      # App theme
├── features/       # Feature modules
│   ├── dashboard/  # Dashboard screen
│   ├── vehicles/   # Vehicle management
│   ├── groups/     # Group management
│   ├── events/     # Event management
│   └── settings/   # App settings
└── main.dart       # Entry point
```

---

## 🛠️ Customization

### Change Theme Colors
Edit `lib/core/theme/app_theme.dart`:
```dart
static const Color primaryColor = Color(0xFF2563EB);
static const Color secondaryColor = Color(0xFFF59E0B);
// Modify these to your preferred colors
```

### Add New Vehicle Type
Edit the dropdown in `lib/features/vehicles/vehicle_editor_sheet.dart`

### Add New Event Color
Edit the color options in `lib/features/events/event_editor_sheet.dart`

---

## 🐛 Troubleshooting

### Issue: Dependencies not found
```bash
flutter pub get
flutter pub upgrade
```

### Issue: Build fails
```bash
flutter clean
flutter pub get
flutter run
```

### Issue: Emulator not starting
```bash
# List available emulators
flutter emulators

# Launch specific emulator
flutter emulators --launch <emulator_id>
```

### Issue: Hot reload not working
- Press `r` in terminal for hot reload
- Press `R` for hot restart
- Press `q` to quit

---

## 📚 Learn More

- **Architecture**: See `README.md` for detailed architecture
- **Implementation**: See `IMPLEMENTATION_SUMMARY.md` for feature checklist
- **Status**: See `PROJECT_STATUS.md` for project metrics

---

## 🎯 What's Next?

1. **Explore the App**: Navigate through all tabs and try all features
2. **Add Data**: Create your own vehicles, groups, and events
3. **Test CRUD**: Add, edit, and delete items
4. **Check Settings**: Toggle notification settings
5. **Review Code**: Browse the well-organized code structure

---

## 💡 Pro Tips

- **Search is instant**: Type to filter vehicles in real-time
- **Color-coded events**: Use different colors to categorize event types
- **Status badges**: Quickly identify vehicle or event status with color badges
- **Swipe refresh**: Pull down on lists to refresh (when backend is connected)
- **Animations**: Watch for smooth fade-in animations on the dashboard

---

## ✨ Features at a Glance

| Feature | Status | Description |
|---------|--------|-------------|
| Tab Navigation | ✅ | 5 main tabs with smooth transitions |
| Dashboard | ✅ | Animated KPIs and stats |
| Vehicle CRUD | ✅ | Full create, read, update, delete |
| Group CRUD | ✅ | Complete group management |
| Event CRUD | ✅ | Color-coded event tracking |
| Search | ✅ | Real-time vehicle search |
| Filters | ✅ | Status-based filtering |
| Settings | ✅ | Notifications and sync preferences |
| Theme | ✅ | Ocean Professional design |
| Validation | ✅ | Form validation on all inputs |

---

**Enjoy using FleetEase! 🚗📱**

For issues or questions, refer to the comprehensive README.md
