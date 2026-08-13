# LinkShort (FastAPI URL Shortener) — Test Report & QA

> Generated: 2026-08-13 · Python 3.9.25 · Linux
> Re-run:
> ```bash
> python3.9 -m venv venv
> venv/bin/pip install -r requirements.txt
> venv/bin/python -m pytest tests/ -v
> ```

## Whole project

**✅ 15/15 API tests pass · 0 failed (31 s)** — `tests/test_api.py`:
- `GET /health` → 200
- `POST /auth/register` → 200 + JWT; login flow; wrong password → 401
- `GET /auth/me` with token → 200; without token → 401/403
- Duplicate email register → 400
- `POST /urls/shorten` requires auth; `GET /urls/{code}/stats`; redirect `302`
- `GET /urls/my` lists only the caller's links (isolation verified)
- Redirect increments click counter (3 hits → `clicks == 3`, `total == 3`)
- Unknown code stats → 404
- `DELETE /urls/{code}` → 204; redirect after delete → 404
- Delete enforces ownership (other user → 404)

## Modules

- `app/main.py`, `app/auth.py`, `app/config.py`, `app/database.py`,
  `app/models.py`, `app/schemas.py`, `app/routers/{auth_router,urls}.py` —
  all 11 modules compile clean (`py_compile`).

## Notes

- **Python version:** the QA environment's default Python (3.14) has no
  prebuilt wheels for the 2024-pinned `pydantic-core` / `bcrypt`, so the
  suite runs in a **Python 3.9** venv where the pinned versions from
  `requirements.txt` install cleanly (the Docker image uses 3.12).
- `passlib 1.7.4` + `bcrypt 4.1.3` (pinned) work together — register/login
  hashing passes.
- Test DB is a throwaway SQLite database dropped/recreated per test
  (`app/database.py` → `data/urlshortener.db`).
