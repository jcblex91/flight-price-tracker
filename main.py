import os
from dotenv import load_dotenv
from fastapi import FastAPI
from amadeus import Client

# 1. Load the variables from the .env file into the system environment
load_dotenv()

app = FastAPI()

# 2. Access them using os.getenv()
# This returns None if the key isn't found, preventing the app from crashing silently
API_KEY = os.getenv("AMADEUS_API_KEY")
API_SECRET = os.getenv("AMADEUS_API_SECRET")

# 3. Initialize the client using the variables
amadeus = Client(
    client_id=API_KEY,
    client_secret=API_SECRET
)

@app.get("/config-check")
def check_config():
    # Never return your actual keys in an API! 
    # Just check if they exist.
    if API_KEY and API_SECRET:
        return {"status": "Secrets loaded successfully"}
    return {"status": "Secrets missing"}