# Flutter News App

## Project Description

Flutter News App is a mobile news application built using **Flutter** that fetches and displays news articles based on sources and keywords. The app is built with two different state management techniques: **Provider** and **BLoC**, allowing developers to compare and learn both approaches in one project.

Users can browse sources like BBC, CNN, etc., select one to view articles, and search within those articles.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Folder Structure](#folder-structure)

## Features

- Fetch latest news articles from NewsAPI.
- Browse news by sources (BBC, CNN, etc.).
- Search functionality for keyword-based article filtering.
- Responsive UI.
- Implemented in **two architectures**:
- Provider
- BLoC

## Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/your-username/flutter-news-app
   cd flutter-news-app
   ```

2. **Install dependencies:**

```bash
flutter pub get
```

Add your NewsAPI key:

In your API manager file, replace YOUR_API_KEY with your actual key from https://newsapi.org:

    const String apiKey = "YOUR_API_KEY";

## Folder Structure

```text
lib/
├── core/                   # Shared utilities and API clients
|   ├── api/                # HTTP and networking logic
|   ├── utils/              # Utilities (formatters, validators, helpers)
|   └── widgets/            # Shared widgets
│
├── config/
│   ├── routes.dart         # App route setup
│   └── themes.dart         # Light and dark themes
│
├── features/
│   └── news/
│       ├── models/         # Article and Source data models
│       ├── views/          # Screens and UI pages
│       ├── widgets/        # Reusable UI components
│       ├── view_model/     # MVVM logic for Provider
│
├── app.dart                # App entry structure
└── main.dart               # App entry point
```
