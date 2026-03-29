import os
from dotenv import load_dotenv

# Lataa .env tiedosto
load_dotenv()

# Luo muuttujat
API_KEY = os.getenv('API_KEY')
BASE_URL = os.getenv('BASE_URL')
