from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hey, we have Flask in a Docker container! :D'


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0') #134.173.191.241')
