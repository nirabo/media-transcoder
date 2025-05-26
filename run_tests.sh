#!/bin/bash
# Script to run tests with coverage using uv

# Run tests with coverage
uv run pytest --cov=media_transcoder --cov-report=term --cov-report=html

# Open the coverage report in a browser if available
if [ -d "htmlcov" ] && command -v xdg-open &> /dev/null; then
    xdg-open htmlcov/index.html
fi
