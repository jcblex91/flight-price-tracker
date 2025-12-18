@echo off
echo Starting Flight Tracker Deployment...

:: 1. Check if .env exists
if not exist .env (
    echo [ERROR] .env file not found! Please create it first.
    pause
    exit
)

:: 2. Activate Virtual Environment
if exist .venv\Scripts\activate.bat (
    echo Activating virtual environment...
    call .venv\Scripts\activate.bat
) else (
    echo [ERROR] .venv folder not found. Run 'python -m venv .venv' first.
    pause
    exit
)

:: 3. Install/Update dependencies
echo Checking dependencies...
pip install -r requirements.txt --quiet

:: 4. Launch Frontend
echo Launching Frontend...
start index.html

:: 5. Start Backend
echo Backend starting at http://127.0.0.1:8000
echo Press CTRL+C to stop the app.
uvicorn main:app --reload