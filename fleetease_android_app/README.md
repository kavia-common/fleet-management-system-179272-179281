# FleetEase Android App

A cross-platform fleet management system built with Flutter for Android. FleetEase provides comprehensive vehicle and business group management with customizable maintenance events, push notifications, and animated dashboards.

## 🚀 Features

- **Dashboard**: Animated KPIs showing fleet statistics, quick stats cards, and upcoming events
- **Vehicle Management**: Complete CRUD operations for fleet vehicles with search and filtering
- **Business Groups**: Organize vehicles into business groups with full management capabilities
- **Maintenance Events**: Track and manage maintenance events with color-coded types and status tracking
- **Settings**: Configurable notifications, auto-sync, and theme customization
- **Offline-First**: Local data persistence with sync capabilities (SQLite ready)
- **Push Notifications**: Service hooks for Firebase Cloud Messaging integration

## 🏗️ Architecture

### Project Structure

```
lib/
├── core/
│   ├── data/
│   │   ├── data_source.dart           # Abstract data source interface
│   │   ├── memory_data_source.dart    # In-memory implementation with sample data
│   │   └── local_sqlite_data_source.dart # SQLite implementation (placeholder)
│   ├── models/
│   │   ├── vehicle.dart               # Vehicle model
│   │   ├── group.dart                 # Business group model
│   │   └── event.dart                 # Maintenance event model
│   ├── services/
│   │   ├── notification_service.dart  # Push notification service
│   │   └── sync_service.dart          # Data synchronization service
│   └── theme/
│       └── app_theme.dart             # Ocean Professional theme configuration
├── features/
│   ├── dashboard/
│   │   ├── dashboard_screen.dart      # Dashboard UI
│   │   └── dashboard_provider.dart    # Dashboard state management
│   ├── vehicles/
│   │   ├── vehicles_screen.dart       # Vehicles list UI
│   │   ├── vehicles_provider.dart     # Vehicles state management
│   │   └── vehicle_editor_sheet.dart  # Add/Edit vehicle modal
│   ├── groups/
│   │   ├── groups_screen.dart         # Groups list UI
│   │   ├── groups_provider.dart       # Groups state management
│   │   └── group_editor_sheet.dart    # Add/Edit group modal
│   ├── events/
│   │   ├── events_screen.dart         # Events list UI
│   │   ├── events_provider.dart       # Events state management
│   │   └── event_editor_sheet.dart    # Add/Edit event modal
│   └── settings/
│       ├── settings_screen.dart       # Settings UI
│       └── settings_provider.dart     # Settings state management
└── main.dart                          # App entry point with navigation
```

### Design Pattern

- **State Management**: Provider pattern for reactive state updates
- **Data Layer**: Repository pattern with abstract data source interface
- **Architecture**: Feature-based modular structure
- **UI Pattern**: Reactive UI with Consumer widgets

## 🎨 Theme

**Ocean Professional** theme with modern aesthetics:
- **Primary**: #2563EB (Blue)
- **Secondary/Success**: #F59E0B (Amber)
- **Error**: #EF4444 (Red)
- **Background**: #f9fafb (Light Gray)
- **Surface**: #ffffff (White)
- **Text**: #111827 (Dark Gray)

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.1           # State management
  sqflite: ^2.3.2            # Local SQLite database
  path: ^1.9.0               # Path utilities
  shared_preferences: ^2.2.2  # Key-value storage
  intl: ^0.19.0              # Internationalization
  cupertino_icons: ^1.0.8    # iOS-style icons
```

## 🔧 Getting Started

### Prerequisites

- Flutter SDK (3.7.0 or higher)
- Android SDK
- Android Studio or VS Code with Flutter extensions

### Installation

1. Clone the repository
2. Navigate to the project directory:
   ```bash
   cd fleet-management-system-179272-179281/fleetease_android_app
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## 🔌 Extending the App

### Implementing SQLite Persistence

The app currently uses an in-memory data source. To implement SQLite:

1. **Complete the LocalSqliteDataSource**:
   - Implement all CRUD methods in `lib/core/data/local_sqlite_data_source.dart`
   - Database schema is already defined in the `_createTables` method

2. **Update main.dart**:
   ```dart
   // Replace MemoryDataSource with LocalSqliteDataSource
   final dataSource = LocalSqliteDataSource();
   await dataSource.initialize();
   ```

3. **Add migration support**:
   - Implement database versioning in `openDatabase`
   - Add `onUpgrade` callback for schema changes

### Integrating Push Notifications

1. **Add Firebase Cloud Messaging**:
   ```yaml
   dependencies:
     firebase_core: ^latest_version
     firebase_messaging: ^latest_version
   ```

2. **Configure Firebase**:
   - Add `google-services.json` to `android/app/`
   - Update `AndroidManifest.xml` with notification permissions

3. **Implement NotificationService**:
   - Initialize FCM in `initialize()` method
   - Set up message handlers for foreground/background notifications
   - Implement `showLocalNotification()` using `flutter_local_notifications`

### Adding Backend Synchronization

1. **Implement SyncService**:
   - Add network connectivity checks
   - Implement conflict resolution logic
   - Add retry mechanisms for failed syncs

2. **Create API Client**:
   - Use `http` or `dio` package for API calls
   - Implement authentication headers
   - Handle network errors gracefully

3. **Update Data Flow**:
   - Modify data source to track dirty records
   - Push local changes before pulling remote updates
   - Update last sync timestamp

### Customizing Event Types

1. **Create EventType model**:
   ```dart
   class EventType {
     final String id;
     final String name;
     final String colorCode;
     final IconData icon;
   }
   ```

2. **Add EventType management**:
   - Create CRUD screens in `features/event_types/`
   - Store custom types in SQLite or SharedPreferences
   - Update event editor to use dynamic event types

### Adding Animations

The dashboard already includes fade animations. To add more:

1. **List Animations**:
   ```dart
   import 'package:flutter_staggered_animations.dart';
   
   // Wrap ListView items with AnimationConfiguration
   ```

2. **Custom Transitions**:
   - Use `Hero` widgets for screen transitions
   - Implement custom `PageRouteBuilder` for screen navigation

## 🧪 Testing

### Running Tests

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage
```

### Writing Tests

- Unit tests for providers in `test/providers/`
- Widget tests for screens in `test/widgets/`
- Integration tests for user flows in `integration_test/`

## 🏗️ Build & Release

### Debug Build

```bash
flutter build apk --debug
```

### Release Build

```bash
flutter build apk --release
```

### App Bundle (for Play Store)

```bash
flutter build appbundle --release
```

## 📝 Notes

- The app currently uses sample data from `MemoryDataSource`
- SQLite integration is stubbed and ready for implementation
- Push notification service has hooks but needs FCM configuration
- Sync service provides the interface but needs backend integration
- All public interfaces are documented with `PUBLIC_INTERFACE` comments

## 🤝 Contributing

When adding new features:

1. Follow the existing feature-based structure
2. Use Provider for state management
3. Document all public interfaces
4. Add appropriate error handling
5. Follow Flutter best practices (avoid context across async gaps)
6. Update this README with new capabilities

## 📄 License

Copyright © 2024 FleetEase. All rights reserved.
