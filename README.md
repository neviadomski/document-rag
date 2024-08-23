# Simple Document Question-Answering RAG

This project provides a simple implementation of a Document Question-Answering system using Retrieval-Augmented Generation (RAG).

## Installation

Follow these instructions to install and set up the project.

```bash
# Example command
git clone https://github.com/{{ yourusername }}/document-rag.git
cd document-rag
```

## Usage

### Docker Installation

This section provides instructions on how to install Docker.

To install Docker, follow these steps:

1. Visit the Docker website at [https://www.docker.com/get-started](https://www.docker.com/get-started).

2. Download the appropriate version of Docker for your operating system.

3. Run the Docker installer and follow the on-screen instructions to complete the installation.

4. Once the installation is complete, open a terminal or command prompt and verify that Docker is installed by running the following command:

   ```bash
   docker --version
   ```

   You should see the version number of Docker displayed in the output.

5. Congratulations! Docker is now installed on your system.

### Run Docker containers using Docker Compose

### Start Docker containers using Docker Compose

To run the Docker containers using Docker Compose, follow these steps:

1. Make sure you have Docker Compose installed on your system in previous step.

2. Add your Groq API key to .env file.

3. Run the following command to start the Docker containers:

   ```bash
   docker compose up
   ```

   This command will start the services defined in the `compose.yaml` file and display the logs in the terminal.

4. Compose file has 4 profiles defined in it:
    - default - application only
    - full - application + storages + ollama
    - ollama - application + ollama
    - db - application + storages

   Run profile with:

   ```bash
   docker compose --profile full up
   ```

5. Congratulations! The Docker containers are now running.

6. You can stop containers by hitting "Ctrl+C" or

   ```bash
   docker compose --profile <your_profile> down
   ```

### Running the `pnc2-groq2.ipynb` Notebook

#### To run the `pnc2-groq2.ipynb` notebook in Visual Studio Code, follow these steps

1. Make sure you have Docker Extension installed.

2. Open "app" container in Docker Extension.

3. You can work from here as in local environment.

#### To run the `pnc2-groq2.ipynb` notebook in Jupyter Lab, follow these steps

1. After initialization app will start printing logs to shell.

2. One of logs will look like this: "<http://127.0.0.1:8888/lab?token=562bec3058f1f09e5bfb75aac5f113f8faa1f0b4c466afc5>"

3. Use this link to start Jupyter Lab in your browser.

## Contributing

We welcome contributions to enhance the functionality of this project. To contribute, please follow these steps:

1. Fork the repository and clone it to your local machine.

   ```bash
   git clone https://github.com/{{ yourusername }}/document-rag.git
   ```

2. Create a new branch for your feature or bug fix.

   ```bash
   git checkout -b feature/your-feature
   ```

3. Make your changes and commit them with descriptive commit messages.

   ```bash
   git commit -m "Add your descriptive commit message here"
   ```

4. Push your changes to your forked repository.

   ```bash
   git push origin feature/your-feature
   ```

5. Submit a pull request to the main repository.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.

## Contact

If you have any questions or suggestions, feel free to reach out to us at [neviadomski@gmail.com](mailto:neviadomski@gmail.com).
