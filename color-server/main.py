from flask import Flask
from flask import jsonify
import random

app = Flask(__name__)

# generates color in hex format
# example: red green blue opacity
#     hex: ff  ff    00   ff 
def create_color():
    ## default opacity is ff
    color_code = "ff"
    for _ in range(6): 
        dec = random.randint(0, 15) # generate random integer 
        hex_digit = str(hex(dec))[2:] # clean '0x' part 
        color_code += hex_digit   
    return color_code

@app.route("/")
def hello_world():
    # generate color
    color_code = create_color()
    print("generated color:", color_code)  
    data = {"hex_code" : color_code}
    return jsonify(data)   


