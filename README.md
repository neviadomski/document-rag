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

### Pipenv Installation

To install the project dependencies and create a virtual environment using Pipenv, follow these steps:

1. Make sure you have Pipenv installed. If not, you can install it by running the following command:

   ```bash
   pip install pipenv
   ```

2. Install the project dependencies:

   ```bash
   pipenv install --dev
   ```

3. Add your Groq API key to .env file.

### Running the `pnc2-groq2.ipynb` Notebook

#### To run the `pnc2-groq2.ipynb` notebook Visual Studio Code, follow these steps:

1. Make sure you have Jupyter Extension installed.

2. Open the `pnc2-groq2.ipynb` notebook in VS Code.

3. Select pipenv environment created before as kernel on top-right corner of screen.

4. Follow the instructions within the notebook to execute the code and interact with it.

##### To run the `pnc2-groq2.ipynb` notebook in classic Jupyter Notebook, follow these steps:

1. Activate the Pipenv virtual environment:

   ```bash
   pipenv shell
   ```

2. Start Jupyter Notebook:

   ```bash
   jupyter notebook
   ```

3. In your web browser, navigate to the Jupyter Notebook interface.

4. Open the `pnc2-groq2.ipynb` notebook.

5. Follow the instructions within the notebook to execute the code and interact with it.

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
