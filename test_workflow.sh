#!/bin/bash
set -e

echo "Simulating GitHub Actions workflow..."
echo "Creating virtual environment..."
uv venv
source .venv/bin/activate

echo "Installing dependencies..."
uv pip install pytest pytest-cov
uv pip install -e ".[dev]"

echo "Running tests..."
python -m pytest --cov=media_transcoder

echo "Workflow simulation completed successfully!"
