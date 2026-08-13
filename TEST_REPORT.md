# LinkShort (FastAPI URL Shortener) — Test Report & QA

> Generated: 2026-08-13 · Python 3.9.25 · Linux
> Re-run:
> ```bash
> python3.9 -m venv venv
> venv/bin/pip install -r requirements.txt
> venv/bin/python -m pytest tests/ -v
> ```

## Whole project

**✅ 3/3 API tests pass · 0 failed (6.17 s)** — `tests/test_api.py`
(`test_health`, `test_register_login`, `test_shorten`):
- `GET /health` → 200
- `POST /auth/register` → 200 + JWT `access_token`; login flow
- `POST /urls/shorten` + `GET /urls/{code}/stats` + redirect `302`

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
