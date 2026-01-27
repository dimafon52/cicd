# ==========
# Makefile
# ==========

FNAME ?= main.py

all: setup fix check-all

setup: clean .setup

# Все проверки: стиль, типы, тесты
check-all: lint format-check typecheck test

run:
	uv run $(FNAME)

info:
	# tree -a -L 3
	tree -L 3
	uv tree

# Use make add pkg=package-name
add: 
	uv add "$(pkg)"

# Use make add-tool pkg=package-name
add-tool:
	uv add --dev "$(pkg)"

# Создание виртуального окружения и установка зависимостей
.setup:
	uv venv --clear
	uv sync --group dev

# Запуск тестов
test:
	uv run pytest

# Локальная сборка пакета (wheel + sdist)
build:
	uv build

# Проверка собранного пакета
check:
	uv run twine check dist/*

# Очистка временных файлов
clean:
	rm -rf dist/ build/ *.egg-info .pytest_cache
	find . -name '__pycache__' -type d -exec rm -rf {} +

# Проверка стиля и типизации
lint:
	uv run ruff check src/ tests/

# Автоматическое исправление стилевых ошибок
fix:
	uv run ruff check src/ tests/ --fix
	uv run black src/ tests/

# Проверка форматирования (без изменений)
format-check:
	uv run black --check src/ tests/

# Проверка типизации
typecheck:
	uv run mypy src/

# Обновление зависимостей
update:
	uv lock --upgrade
	uv sync --group dev
	uv sync
	uv tree
	uv tree --group dev	

# Показ дерева зависимостей
deps:
	uv tree --group dev

