# 🔗 LinkShort — URL Shortener

![Python](https://img.shields.io/badge/python-3.12+-3776AB?style=flat-square&logo=python)
![FastAPI](https://img.shields.io/badge/FastAPI-0.115-009688?style=flat-square&logo=fastapi)
![React](https://img.shields.io/badge/React-19-61DAFB?style=flat-square&logo=react)
![TailwindCSS](https://img.shields.io/badge/Tailwind-4-06B6D4?style=flat-square&logo=tailwindcss)
![PyPI](https://img.shields.io/badge/PyPI-fastapi--url%400.2.0-3776AB?style=flat-square&logo=pypi)
![Docker](https://img.shields.io/badge/Docker-GHCR-2496ED?style=flat-square&logo=docker)
![Tests](https://img.shields.io/badge/Tests-15%20✓-brightgreen?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-yellow?style=flat-square)
[![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/BartoszOsiej/FastAPI-url/badge)](https://securityscorecards.dev/viewer/?uri=github.com/BartoszOsiej/FastAPI-url)

**URL shortener with JWT auth, click tracking, and dark UI. Full REST API + React SPA.**

> 🇵🇱 [Wersja polska](README.pl.md) · [Documentation](https://bartoszosiej.github.io/Docs/projects/fastapi-url/)

---

## Table of Contents

- [Features](#features)
- [Screenshots](#screenshots)
- [Tech Stack](#tech-stack)
- [Quick Start](#quick-start)
- [API Reference](#api-reference)
- [Deploy](#deploy)
- [Testing](#testing)
- [Docker](#docker)
- [License](#license)

---

## Features

| Feature | Description |
|---|---|
| 🔐 **JWT Auth** | Register, login, token-based API access |
| 🔗 **One-click shortening** | Paste URL, get short code |
| 📊 **Click tracking** | Each redirect increments counter |
| 📋 **Dashboard** | Manage URLs: copy, delete, stats |
| 🌙 **Dark UI** | Professional dark theme, responsive |
| 📖 **REST API** | Swagger docs at `/docs` |
| 💾 **SQLite** | Zero-config persistence |

---

## Screenshots

| Login | Dashboard | Shortened |
|:---:|:---:|:---:|
| ![Login](screenshots/login.png) | ![Dashboard](screenshots/dashboard.png) | ![Shortened](screenshots/shortened.png) |

---

## Tech Stack

| Layer | Tech |
|---|---|
| Backend | Python 3.12, FastAPI, SQLAlchemy, SQLite |
| Auth | JWT (python-jose), SHA-256 |
| Frontend | React 19, Vite, TailwindCSS 4 |
| Testing | pytest, httpx |

---

## Quick Start

```bash
git clone https://github.com/BartoszOsiej/FastAPI-url.git
cd FastAPI-url
python3 -m venv venv && source venv/bin/activate
pip install -r requirements.txt
uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
```

Open [http://localhost:8000](http://localhost:8000)

<details>
<summary><b>🎨 Build the frontend</b></summary>

```bash
cd frontend
npm install
npm run build
rm -rf ../backend/static && mkdir -p ../backend/static
cp -r dist/* ../backend/static/
```

---

## API Reference

| Method | Endpoint | Auth | Description |
|--------|----------|------|-------------|
| `POST` | `/auth/register` | — | Create account |
| `POST` | `/auth/login` | — | Login, returns JWT |
| `GET` | `/auth/me` | Bearer | Current user |
| `POST` | `/urls/shorten` | Bearer | Create short URL |
| `GET` | `/urls/my` | Bearer | List your URLs |
| `GET` | `/urls/r/{code}` | — | Redirect to target |
| `DELETE` | `/urls/{code}` | Bearer | Delete URL |

Interactive docs: [http://localhost:8000/docs](http://localhost:8000/docs)

---

## Deploy

```bash
# Cloudflare Tunnel (free, no account)
cloudflared tunnel --url http://localhost:8000

# Docker
docker build -t fastapi-url .
docker run -p 8000:8000 fastapi-url
```

---

## Testing

```bash
pytest tests/ -v    # 15 tests
```

---

## Docker

```bash
# Build
docker build -t ghcr.io/bartoszosiej/fastapi-url:latest .

# Run
docker run -p 8000:8000 ghcr.io/bartoszosiej/fastapi-url:latest
```

---

## License

MIT
