from flask import Flask, jsonify, request
import json
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent

with open(BASE_DIR.parent.parent / "config" / "equipment.json", "r") as file:
    equipment = json.load(file)
app = Flask(__name__)



@app.get("/api/equipments")
def get_equipment():
    return jsonify(equipment), 200


@app.get("/api/equipment/<int:id>")
def get_equipment_byid(id):
    for item in equipment:
        if item["id"] == id:
            return jsonify(item),200
    return jsonify({"error":"Item not found"}), 404
@app.post("/api/equipment")
def add_equipment():
    data = request.get_json()
    equipment.append(data)
    return jsonify(data), 201

if __name__ == "__main__":
    app.run(host="127.0.0.1", port=5000, debug=True)