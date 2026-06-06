# 🌸 Blossom Movie

A sleek, modern iOS movie browsing app built with **SwiftUI** that leverages the [TMDB API](https://www.themoviedb.org/documentation/api) to discover trending and top-rated movies and TV shows.

---

## ✨ Features

- **Trending Content** — Browse trending movies and TV shows updated daily
- **Top Rated** — Explore the highest-rated movies and TV shows of all time
- **Hero Banner** — Dynamic hero image showcasing the top trending title
- **Tab Navigation** — Quick access to Home, Upcoming, Search, and Downloads
- **Async Image Loading** — Smooth, non-blocking poster loading with placeholders
- **Horizontal Scrolling Lists** — Netflix-style horizontal carousels for each category

## 📱 Screenshots

> _Coming soon_

---

## 🏗️ Architecture

Blossom Movie follows a clean **MVVM (Model-View-ViewModel)** architecture:

```
┌─────────────────────────────────────────────┐
│                    Views                     │
│  HomeView · ContentView · HorizontalListView │
└──────────────────┬──────────────────────────┘
                   │ @State / @Observable
┌──────────────────▼──────────────────────────┐
│                 ViewModel                    │
│         Manages fetch state & data           │
└──────────────────┬──────────────────────────┘
                   │ async/await
┌──────────────────▼──────────────────────────┐
│               DataFetcher                    │
│     Networking layer (URLSession)             │
└──────────────────┬──────────────────────────┘
                   │ HTTPS
┌──────────────────▼──────────────────────────┐
│               TMDB API                       │
│     api.themoviedb.org/3/...                 │
└─────────────────────────────────────────────┘
```

### Key Design Decisions

- **`@Observable` macro** — Uses the modern Swift Observation framework instead of `ObservableObject`/`@Published` for cleaner reactivity
- **Concurrent fetching** — All four API calls (trending movies, trending TV, top-rated movies, top-rated TV) run concurrently via `async let`
- **Secure configuration** — API keys are loaded from a bundled JSON file that is gitignored, with a template provided for onboarding

---

## 📂 Project Structure

```
Blossom Movie/
├── Blossom_MovieApp.swift        # App entry point
├── ContentView.swift             # Root TabView (Home, Upcoming, Search, Download)
├── HomeView.swift                # Main home screen with hero banner & carousels
├── HorizontalListView.swift      # Reusable horizontal poster scroll component
├── ViewModel.swift               # Observable ViewModel managing fetch state & data
├── DataFetcher.swift             # Networking layer for TMDB API calls
├── Title.swift                   # Data models (Title, APIObject)
├── Constants.swift               # String constants, URLs, and UI extensions
├── Errors.swift                  # Custom error types (APIConfigError, NetworkError)
├── Config/
│   ├── APIConfig.swift           # Loads API config from bundled JSON
│   ├── APIConfig.json            # 🔒 Your API key (gitignored)
│   └── APIConfig.template.json   # Template for setting up API credentials
└── Assets.xcassets/              # App assets and colors
```

---

## 🚀 Getting Started

### Prerequisites

- **Xcode 16.0+**
- **iOS 18.0+** deployment target
- A free [TMDB API key](https://www.themoviedb.org/settings/api)

### Setup

1. **Clone the repository**

   ```bash
   git clone https://github.com/KhushneetSingh/Blossom_Movie.git
   cd Blossom_Movie
   ```

2. **Configure your API key**

   Copy the template and add your TMDB API key:

   ```bash
   cp "Blossom Movie/Config/APIConfig.template.json" "Blossom Movie/Config/APIConfig.json"
   ```

   Then edit `APIConfig.json`:

   ```json
   {
       "tmdbBaseURL": "https://api.themoviedb.org",
       "tmdbAPIKey": "YOUR_ACTUAL_API_KEY"
   }
   ```

3. **Open in Xcode**

   ```bash
   open "Blossom Movie.xcodeproj"
   ```

4. **Build & Run** — Select a simulator or device and hit `⌘R`

---

## 🔑 API Configuration

This project uses a **secure, gitignored JSON file** to store API credentials:

| File | Purpose | Tracked? |
|------|---------|----------|
| `APIConfig.json` | Your actual API credentials | ❌ Gitignored |
| `APIConfig.template.json` | Template for new contributors | ✅ Tracked |

The `APIConfig` struct loads credentials at app launch via `Bundle.main.url(forResource:)`. If the config file is missing or malformed, the app gracefully handles errors through custom `APIConfigError` types.

---

## 🛠️ Tech Stack

| Technology | Usage |
|-----------|-------|
| **SwiftUI** | Declarative UI framework |
| **Swift Concurrency** | `async/await`, `async let` for parallel network calls |
| **Observation Framework** | `@Observable` macro for reactive state |
| **URLSession** | Native networking |
| **TMDB API** | Movie and TV show data source |

---

## 📡 API Endpoints Used

| Endpoint | Description |
|----------|-------------|
| `GET /3/trending/movie/day` | Daily trending movies |
| `GET /3/trending/tv/day` | Daily trending TV shows |
| `GET /3/movie/top_rated` | Top rated movies of all time |
| `GET /3/tv/top_rated` | Top rated TV shows of all time |

---

## 🗺️ Roadmap

- [ ] Implement Upcoming tab with upcoming releases
- [ ] Build Search tab with movie/TV search functionality
- [ ] Add Downloads tab for offline content
- [ ] Movie/TV detail view with overview, cast, and trailers
- [ ] Pagination for all list views
- [ ] Dark mode refinements and custom theming

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

<p align="center">
  Built with 🌸 by <a href="https://github.com/KhushneetSingh">Khushneet Singh</a>
</p>
