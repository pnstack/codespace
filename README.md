# Codespace

This repository contains a collection of development container configurations for various environments, including Ubuntu, React Native, Terraform, and more.

## Getting Started

To use these configurations, you need to have [Docker](https://www.docker.com/) installed on your machine.

## Directory Structure

- `.github/workflows/`: Contains GitHub Actions workflows for building the dev containers.
- `src/`: Contains source code for additional features.
- `templates/`: Contains the dev container configurations. Each subdirectory represents a different environment.

## Dev Containers

Each dev container configuration is located in a subdirectory under `templates/`. The configuration is defined in a `devcontainer.json` file, and optionally a `Dockerfile`.

### Ubuntu

The Ubuntu dev container is a basic Ubuntu environment. See [templates/ubuntu/.devcontainer/devcontainer.json](templates/ubuntu/.devcontainer/devcontainer.json) for more details.

### React Native

The React Native dev container includes the necessary tools for React Native development. See [templates/react-native/.devcontainer/devcontainer.json](templates/react-native/.devcontainer/devcontainer.json) for more details.

### Terraform

The Terraform dev container includes the necessary tools for Terraform development. See [templates/terraform/.devcontainer/devcontainer.json](templates/terraform/.devcontainer/devcontainer.json) for more details.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.