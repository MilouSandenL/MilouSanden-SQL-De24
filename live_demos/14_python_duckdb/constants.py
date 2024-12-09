from pathlib import Path

# __file__ - dunder file
# absolute path to constants.py
# /"data" -> concatinate with "data"
# / operator works here because overloading and polymorphis
DATA_PATH = Path(__file__).parent /"data"
DATABASE_PATH = Path(__file__).parent /"goteborg_stad.db"

print(DATA_PATH)
