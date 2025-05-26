from setuptools import setup, find_packages

with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

# Core dependencies
install_requires = [
    "rich>=10.0.0",
    "pathlib",
    "typing-extensions",
]

# Development dependencies
development_requires = [
    "pytest>=7.0.0",
    "pytest-cov>=4.0.0",
    "black>=23.0.0",
    "isort>=5.12.0",
    "flake8>=6.0.0",
    "mypy>=1.0.0",
]

# Build and publish dependencies
build_requires = [
    "build>=0.10.0",
    "twine>=4.0.0",
]

setup(
    name="media-transcoder",
    version="0.1.0",
    author="Lyuboslav Petrov",
    author_email="lpetrov@example.com",  # Replace with your actual email
    description="A media transcoder with CUDA hardware acceleration support",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/lpetrov/media-transcoder",  # Replace with your actual repo URL
    packages=find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
        "Topic :: Multimedia :: Video :: Conversion",
    ],
    python_requires=">=3.8",
    install_requires=install_requires,
    extras_require={
        "dev": development_requires,
        "build": build_requires,
        "all": development_requires + build_requires,
    },
    entry_points={
        "console_scripts": [
            "media-transcoder=media_transcoder.transcoder:main",
        ],
    },
)
