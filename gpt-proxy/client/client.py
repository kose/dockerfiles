#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import requests

def main():
    url = "http://localhost:8080/cgi-bin/parrot.py"  # サーバーのURLを指定
    input_string = input("文字列を入力してください: ")

    payload = {"input_string": input_string}
    
    response = requests.post(url, data=payload)

    if response.status_code == 200:
        print("サーバーからのレスポンス:")
        print(response.text)
    else:
        print("エラー: レスポンスコード", response.status_code)

if __name__ == "__main__":
    main()

# import pdb; pdb.set_trace()

### Local Variables: ###
### truncate-lines:t ###
### End: ###
    
