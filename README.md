# 🛸 Rick & Morty — Flutter App

## Screenshots

1- home : https://drive.google.com/file/d/1sang7cfBiUVx106VvA555V-GNjlTlmbt/view?usp=drive_link
2- search result : https://drive.google.com/file/d/1BO-SQMkpUFUzBRyDKFazbK7mmuldog8x/view?usp=drive_link
3- filter bottom sheet: https://drive.google.com/file/d/1Cdb9LWSKLn0D6gQh8OP51LXF0K728U7Z/view?usp=drive_link
4- category : https://drive.google.com/file/d/17Y5C8iBbkMzEgdpKzQdYz3_NuE8O0GWK/view?usp=drive_link
5- Export dailog : https://drive.google.com/file/d/1JZ-Oz5DwNVjHr37-tRFZyyFvv1Wi3MOu/view?usp=drive_link
6- Excel file : https://drive.google.com/file/d/1PsL0qZcOODNANot0i2P21Oi9dPDc2-8g/view?usp=drive_link

## Video link

link : https://drive.google.com/file/d/17Wy2U_MgguLNFP2VjByYKu3VX_XN9onE/view?usp=drive_link

## Architecture

The project follows **Clean Architecture** with a **feature-first** folder structure and strict layer separation:

```
lib/
├── main.dart              # App entry point
├── core/                  # Shared infrastructure
│   ├── errors/            # Failure types
│   ├── routes/            # GoRouter navigation
│   ├── services/          # ApiService (Dio) + GetIt DI
│   ├── utils/             # AppColors, AppTextStyles, AppIcons, AppImages
│   └── widgets/           # Reusable UI components
└── features/
    ├── Splash/            # Splash screen
    ├── home/              # Character listing + filter + export
    ├── Search Result/     # Filtered/searched character results
    └── export/            # Excel export feature
```

Each feature contains three layers:

| Layer            | Responsibility                                               |
| ---------------- | ------------------------------------------------------------ |
| **Data**         | Remote data sources, JSON models, repository implementations |
| **Domain**       | Entities, abstract repository contracts, use cases           |
| **Presentation** | Cubit (BLoC) state management, screens, widgets              |

---

## Screens & User Flow

```
SplashScreen (5 sec) ──► HomeScreen ──► SearchResultScreen
                               │
                         (Export button)
                               │
                         ExportSuccessDialog
```

| Screen            | Description                                                                                                  |
| ----------------- | ------------------------------------------------------------------------------------------------------------ |
| **Splash**        | 5-second branding screen, then navigates to Home                                                             |
| **Home**          | Lists all characters with skeleton loading, filter bottom sheet, category tabs, and error/no-internet states |
| **Search Result** | Displays characters filtered by name, status, gender, or species                                             |
| **Export Dialog** | Post-export actions: **Open File** or **Share**                                                              |

---

## Features

- 📡 **API Integration** — fetches from `https://rickandmortyapi.com/api/character` with multi-param query filtering
- 🔍 **Filtering** — by Name, Status (Alive / Dead / Unknown), Gender, and Species via a bottom sheet
- 📊 **Excel Export** — generates a styled `.xlsx` file saved to Downloads (Android) or Documents directory (other platforms), timestamped
- 💀 **Full State Handling** — Loading, Success, Empty, Error, No Internet — handled per cubit
- 💉 **Dependency Injection** — `GetIt` service locator with lazy singletons and factories

---

## State Management

Uses the **BLoC / Cubit** pattern via `flutter_bloc`:

| Cubit                  | States                                                        |
| ---------------------- | ------------------------------------------------------------- |
| `GetCharactersCubit`   | Initial, Loading, Success, Empty, Error, NoInternetConnection |
| `FilterCharacterCubit` | Initial, Loading, Success, Empty, Error, NoInternetConnection |
| `ExportExcelCubit`     | Initial, Loading, Success, Error                              |

---

## Tech Stack

| Package                 | Purpose                                       |
| ----------------------- | --------------------------------------------- |
| `flutter_bloc` + `bloc` | State management (Cubit pattern)              |
| `dio`                   | HTTP client for API calls                     |
| `dartz`                 | Functional programming (`Either<Failure, T>`) |
| `get_it`                | Dependency injection / service locator        |
| `go_router`             | Declarative routing                           |
| `excel`                 | Generate `.xlsx` spreadsheet files            |
| `path_provider`         | File system directory paths                   |
| `open_filex`            | Open exported files natively                  |
| `share_plus`            | Share files via the OS share sheet            |
| `flutter_screenutil`    | Responsive sizing                             |
| `flutter_svg`           | SVG asset rendering                           |
| `octo_image`            | Image loading with placeholders               |

---

## Design System

- **Font**: `PlusJakartaSans` (weights 300–800, bundled as TTF assets)
- **Primary color**: `#3525CD` (deep indigo/blue)
- **Background**: `#F9F9FF` (soft off-white)
- **Status colors**: `#4AE176` (alive/green) · `#BA1A1A` (dead/red)
- **Accent**: `#E9EDFF` (lavender blue)
