#import libraries
from __future__ import print_function
import urllib
from google.auth import compute_engine
import googleapiclient.discovery
from google.oauth2 import service_account
import httplib2
import os
from apiclient import discovery
import json
import sys
from google.auth import compute_engine

########## variables

#environment variables
creds='py_serviceaccount.json'

######## API variables

username = sys.argv[1].lower()

#list scopes required using credentials
SCOPES = ['https://mail.google.com/']

SERVICE_ACCOUNT_FILE = creds
credentials = service_account.Credentials.from_service_account_file(SERVICE_ACCOUNT_FILE, scopes=SCOPES)
delegated_credentials = credentials.with_subject(username)
service = googleapiclient.discovery.build('gmail', 'v1', credentials=delegated_credentials)


########thread listing

def list_threads():

  try:
    response = service.users().threads().list(userId='me').execute()
    threads = []
    if 'threads' in response:
      threads.extend(response['threads'])
      #while 'nextPageToken' in response:
      for x in range(0, 20):
        page_token = response['nextPageToken']
        response = service.users().threads().list(userId=username, pageToken=page_token,maxResults='1000').execute()
        print(json.dumps(response))
  except Exception as e:
    if hasattr(e, 'message'):
      print(e.message)
    else:
      print(e)

list_threads()
