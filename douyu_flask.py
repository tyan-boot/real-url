from flask import Flask, request
from flask.templating import render_template
from douyu import DouYu

app = Flask(__name__)


@app.route("/")
def index():
    return render_template("index.html")


@app.route("/get_url")
def get_url():
    id_ = request.args.get("id")
    if not id_:
        return "ID不能为空"

    s = DouYu(id_)
    try:
        url = s.get_real_url()
        return url
    except Exception as e:
        return str(e)


if __name__ == '__main__':
    app.run(debug=True)
