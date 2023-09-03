#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import cgi
import cgitb
cgitb.enable()  # エラー情報をブラウザに表示する

def main():
    print("Content-Type: text/plain;charset=utf-8")  # レスポンスのヘッダー
    print()  # ヘッダーとボディを分ける空行

    form = cgi.FieldStorage()  # POSTデータを取得

    if "input_string" in form:
        input_string = form["input_string"].value
        response_string = process_input(input_string)

        # response_string = "あなたは「\n" + response_string + "\n」と言いましたね？"
        response_string = "「" + response_string + "」への返信"
        # response_string = "返信します"
        
        print(response_string)
    else:
        print("Error: No input data")

def process_input(input_string):
    # ここで受け取った文字列に対する処理を行う
    # この例では、受け取った文字列をそのまま返すだけ
    return input_string

if __name__ == "__main__":
    main()

# import pdb; pdb.set_trace()

### Local Variables: ###
### truncate-lines:t ###
### End: ###
