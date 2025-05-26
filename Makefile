.PHONY: help install dev clean test lint format build publish-test publish docs

# Default target executed when no arguments are given to make.
help:
	@echo "Media Transcoder Project Management Commands"
	@echo ""
	@echo "Usage:"
	@echo "  make install         Install the package in development mode"
	@echo "  make dev             Install development dependencies"
	@echo "  make clean           Remove build artifacts and cache directories"
	@echo "  make test            Run tests with pytest"
	@echo "  make coverage        Run tests with coverage report"
	@echo "  make lint            Run linting checks"
	@echo "  make format          Format code with black and isort"
	@echo "  make build           Build source and wheel distributions"
	@echo "  make publish-test    Upload the package to TestPyPI"
	@echo "  make publish         Upload the package to PyPI"
	@echo "  make docs            Generate documentation"
	@echo ""

# Install the package in development mode
install:
	uv pip install -e .

# Install development dependencies
dev:
	uv pip install -e ".[dev]"

# Clean build artifacts and cache directories
clean:
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info
	rm -rf .pytest_cache/
	rm -rf .coverage
	rm -rf htmlcov/
	rm -rf .mypy_cache/
	rm -rf .ruff_cache/
	find . -type d -name __pycache__ -exec rm -rf {} +

# Run tests with pytest
test:
	uv pip install pytest pytest-cov
	uv run python -m pytest

# Run tests with coverage
coverage:
	uv pip install pytest pytest-cov
	uv run python -m pytest --cov=media_transcoder --cov-report=html --cov-report=term

# Run linting checks
lint:
	uv pip install flake8 mypy
	uv run python -m flake8 media_transcoder tests
	uv run python -m mypy media_transcoder

# Format code with black and isort
format:
	uv pip install black isort
	uv run python -m black media_transcoder tests
	uv run python -m isort media_transcoder tests

# Build source and wheel distributions
build: clean
	uv build

# Upload the package to TestPyPI
publish-test: build
	uv pip install twine
	uv run python -m twine upload --repository testpypi --verbose dist/*

# Upload the package to PyPI
publish: build
	uv pip install twine
	uv run python -m twine upload --verbose dist/*

# Generate documentation
docs:
	mkdir -p docs
	uv pip install pdoc
	uv run python -m pdoc --html --output-dir docs media_transcoder
