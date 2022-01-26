# Python Project init

Script to create a scaffolded Python Project.

 It adds:
-  basic .vscode configuration
-  `Makefile`
-  [.isort.cfg](https://github.com/PyCQA/isort)
-  [Pipfile](https://pipenv-fork.readthedocs.io/en/latest/)
-  [Dockerfile](https://github.com/docker-library/python/blob/6a2c0f48f011aa279a0c9190725fc84a220460bc/3.9/bullseye/slim/Dockerfile)
-  *Directory structure*:

```text
├── .vscode
│   ├── settings.json
├── .venv
├── bin
│   ├── __init__.py
│   ├── model
│       ├── __init__.py
│   ├── preprocessing
│       ├── __init__.py
│   ├── tests
│       ├── __init__.py
│   └── utils
│       ├── __init__.py
├── data
└── outputs
├── Makefile
├── Pipfile
├── .isort.cfg
├── README.md
├── Dockerfile
```

## Basic Usage

```bash
sh download.sh
```
