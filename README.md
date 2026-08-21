<img src="https://capsule-render.vercel.app/api?type=rounded&color=0:0d1117,50:009688,100:61dafb&height=140&section=header&text=LinkShort&fontSize=38&fontColor=fff&desc=URL%20shortener%20%C2%B7%20JWT%20auth%20%C2%B7%20click%20tracking%20%C2%B7%20React%20dashboard&descSize=15&descAlignY=72" width="100%" />

<div align="center">

[![PyPI](https://img.shields.io/pypi/v/fastapi-url?style=for-the-badge&logo=pypi)](https://pypi.org/project/fastapi-url/)
[![GHCR](https://img.shields.io/badge/GHCR-image-2496ED?style=for-the-badge&logo=docker)](https://github.com/BartoszOsiej/FastAPI-url/pkgs/container/fastapi-url)
[![Release](https://img.shields.io/badge/release-artifacts-8A2BE2?style=for-the-badge&logo=github)](https://github.com/BartoszOsiej/FastAPI-url/releases)
![Python](https://img.shields.io/badge/python-3.12+-3776AB?style=for-the-badge&logo=python)
![FastAPI](https://img.shields.io/badge/FastAPI-0.115-009688?style=for-the-badge&logo=fastapi)
![React](https://img.shields.io/badge/React-19-61DAFB?style=for-the-badge&logo=react)
[![License](https://img.shields.io/badge/license-MIT-green?style=for-the-badge)](LICENSE)

**URL shortener with JWT auth, click tracking, and dark UI. Full REST API + React SPA.**

</div>

| | | |
|---|---|---|
| ![Login](screenshots/login.png) | ![Dashboard](screenshots/dashboard.png) | ![Shortened](screenshots/shortened.png) |

## Features

- **JWT authentication** — register, login, token-based API access
- **One-click shortening** — paste URL, get short code
- **Click tracking** — each redirect increments counter
- **Dashboard** — manage URLs: copy, delete, stats
- **Dark UI** — professional dark theme, responsive
- **REST API** — Swagger docs at `/docs`
- **SQLite** — zero-config persistence

## Tech Stack

| Layer | Tech |
|---|---|
| Backend | Python 3.12, FastAPI, SQLAlchemy, SQLite |
| Auth | JWT (python-jose), SHA-256 |
| Frontend | React 19, Vite, TailwindCSS 4 |
| Testing | pytest, httpx |

## Quick Start

```bash
pip install fastapi-url          # from PyPI
uvicorn app.main:app --reload    # or clone & run:
```

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

</details>

## API

| Method | Endpoint | Auth | Description |
|--------|----------|------|-------------|
| `POST` | `/auth/register` | — | Create account |
| `POST` | `/auth/login` | — | Login, returns JWT |
| `GET` | `/auth/me` | Bearer | Current user |
| `POST` | `/urls/shorten` | Bearer | Create short URL |
| `GET` | `/urls/my` | Bearer | List your URLs |
| `GET` | `/urls/r/{code}` | — | Redirect to target |
| `DELETE` | `/urls/{code}` | Bearer | Delete URL |

<details>
<summary><b>🚢 Deploy & test</b></summary>

```bash
# Cloudflare Tunnel (free, no account)
cloudflared tunnel --url http://localhost:8000

# Tests
pytest tests/ -v
```

</details>

---

<div align="center">

**Part of [BartoszOsiej](https://github.com/BartoszOsiej)'s portfolio ecosystem** · [Live docs](https://bartoszosiej.github.io/Docs/projects/fastapi-url/)

MIT © 2026 Bartosz Osiej

</div>
