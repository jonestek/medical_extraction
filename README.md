# Medical Transcription Structured Information Extractor

This repository provides a containerized Python application that uses the OpenAI Structured Outputs API (`gpt-4o-mini`) to extract structured information (Patient Age, Recommended Treatment/Procedure, and Medical Specialty) from raw, unstructured medical transcriptions.

## Project Structure
- `main.py`: The main Python script to run the extraction pipeline.
- `requirements.txt`: Python packages needed to run the application.
- `Containerfile`: Podman/Docker specification to containerize the app.
- `medical_transcription_dataset.csv`: Input source containing unstructured medical transcripts.

## Prerequisites
- **Podman** (or Docker) installed on your system.
- An **OpenAI API Key**.

## How to Deploy and Run with Podman

### 1. Build the Container Image
```bash
podman build -t medical-extractor -f Containerfile .
```

### 2. Run the Container
Pass your OpenAI API key as an environment variable to process the transcription CSV:
```bash
podman run -it --rm \
  -e OPENAI_API_KEY="your_actual_openai_api_key_here" \
  -v $(pwd)/medical_transcription_dataset.csv:/app/medical_transcription_dataset.csv \
  medical-extractor
```
