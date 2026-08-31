# 📚 Study Flow — Flash Card Quiz App

A sleek and intuitive **Flutter flash card application** for studying and memorizing anything — from vocabulary and definitions to concepts and translations. Built with a clean architecture, local persistence via Hive, and smooth flip-card animations.

---

## ✨ Features

### 🃏 Flash Card Management
- **Create Flash Cards** — Add new cards with a custom question (front) and answer (back) through a dedicated creation screen with form validation.
- **Edit Flash Cards** — Modify existing cards via the card options menu; the edit screen pre-fills the current question and answer.
- **Delete Flash Cards** — Remove cards permanently with a confirmation dialog to prevent accidental deletions.

### 🔄 Card Interaction
- **Flip Animation** — Tap any card to flip it horizontally, revealing the answer on the back side (powered by `flip_card_plus`).
- **Swipeable PageView** — Browse through cards by swiping left/right in a paginated carousel with a `0.9` viewport fraction for a peek-ahead effect.
- **Next / Previous Navigation** — Dedicated navigation buttons to move between cards with smooth `animateToPage` transitions. Buttons auto-disable at the first and last card.
- **Card Counter** — Real-time indicator showing the current card position (e.g., `2 / 5 cards`).

### 💾 Local Data Persistence
- **Hive Database** — All flash cards are stored locally using Hive with a typed `QuizModel` adapter, so your data persists across app restarts.
- **Auto-Load on Startup** — Cards are automatically loaded from the Hive box when the app launches.

### 🎨 UI / UX
- **Empty State** — A friendly illustration and prompt when no cards exist yet, guiding the user to create their first card.
- **Bottom Sheet Menu** — Long-press or tap the menu icon on any card to access Edit and Delete options in a polished bottom sheet.
- **Delete Confirmation Dialog** — A styled alert dialog to confirm destructive actions before they happen.
- **Custom Theme System** — A comprehensive `AppColors` palette with primary, secondary, tertiary, neutral, surface, dark, and error color tokens for consistent styling.
- **Floating Action Button** — A prominent FAB on the home screen to quickly add new cards.
- **Card Hint Row** — Subtle UI hints on each card side (e.g., "Tap to show answer" / "Tap to show question").

### 🏗️ Architecture & State Management
- **Flutter Bloc (Cubit)** — Centralized state management with `NewCardCubit` handling all CRUD operations and emitting `Loading`, `Success`, and `Failure` states.
- **Clean Folder Structure** — Organized into `core/` (model, state management, theming) and `feature/` (UI screens and reusable widgets).
- **Reusable Widgets** — Modular components like `CardContainer`, `CardFrontSide`, `CardBackSide`, `CardMenuButton`, `CardHintRow`, `CardTextField`, `SectionLabel`, `SaveFlashcardButton`, and `EmptyState`.

---

## 🛠️ Tech Stack

| Layer              | Technology                          |
|--------------------|-------------------------------------|
| **Framework**      | Flutter                             |
| **Language**       | Dart                                |
| **State Management** | flutter_bloc (Cubit)              |
| **Local Storage**  | Hive + hive_flutter                 |
| **Animations**     | flip_card_plus                      |
| **Fonts**          | google_fonts                        |
| **Code Generation**| hive_generator + build_runner       |
| **Equality**       | equatable                           |

---

## 📂 Project Structure

```
lib/
├── main.dart                          # App entry point & Hive initialization
├── flash_card.dart                    # MaterialApp with BlocProvider
├── core/
│   ├── model/
│   │   ├── model.dart                 # QuizModel (question + answer)
│   │   └── model.g.dart              # Generated Hive adapter
│   ├── state_mangment/
│   │   └── cubit/
│   │       ├── new_card_cubit.dart    # CRUD logic (add, edit, delete, load)
│   │       └── new_card_state.dart    # States: Initial, Loading, Success, Failure
│   └── themeing/
│       └── theme.dart                 # AppColors palette
└── feature/
    ├── ui/
    │   ├── home_screen/
    │   │   ├── home_screen.dart       # Main screen with PageView & navigation
    │   │   └── widget/
    │   │       ├── flash_card_item.dart          # FlipCardPlus wrapper
    │   │       ├── card_front_side.dart          # Question side
    │   │       ├── card_back_side.dart           # Answer side
    │   │       ├── card_container.dart           # Shared card styling
    │   │       ├── card_menu_button.dart         # Three-dot menu icon
    │   │       ├── card_hint_row.dart            # "Tap to show..." hint
    │   │       ├── card_options_bottom_sheet.dart # Edit/Delete bottom sheet
    │   │       ├── custom_floating_action.dart   # FAB for adding cards
    │   │       └── empty_state.dart              # No-cards placeholder
    │   ├── add_screen/
    │   │   ├── create_new_card_screen.dart       # Add/Edit card form
    │   │   └── widget/
    │   │       ├── card_text_field.dart           # Styled text input
    │   │       ├── save_flashcard_button.dart     # Save/Update button
    │   │       ├── section_label.dart             # Form section titles
    │   │       └── tag_chip.dart                  # Tag chip widget
    │   └── edit_widget/                           # (Reserved for future use)
    └── widget/                                    # (Shared widgets)
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK `^3.12.2`
- Dart SDK (bundled with Flutter)

### Installation

```bash
# Clone the repository
git clone https://github.com/your-username/flash_card_quiz.git
cd flash_card_quiz

# Install dependencies
flutter pub get

# Generate Hive adapters (if needed)
dart run build_runner build

# Run the app
flutter run
```

---

## 📸 Screens

| Home Screen | Add Card | Flip Card | Card Options |
|:-----------:|:--------:|:---------:|:------------:|
| Browse cards with swipe & buttons | Create new question/answer pairs | Tap to reveal the answer | Edit or delete via bottom sheet |

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
