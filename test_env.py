import os
from dotenv import load_dotenv
load_dotenv()
pwd = os.environ.get('APP_PASSWORD', 'NOT_FOUND')
print(f'PASS_VAL:[{pwd}]')
print(f'PASS_LEN:{len(pwd)}')
