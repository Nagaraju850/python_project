import pytest 
from app import app

@pytest.fixture
def client():
    app.config["TESTING"] = True
    with app.test_client() as client:
        yield client

def test_get_quipment(client):
    response = client.get("/api/equipments")
    assert response.status_code == 200
    data = response.get_json()
    assert isinstance(data, list)
    assert len(data) ==20
    # [{"id":101,"name":"Flight","status":"Operational","type":"FCU"},
    #  {"id":102,"name":"Navigational System","status":"Operational","type":"NS"}]
    assert data[0]["id"] == 101
    assert data[0]["name"] == "Flight Control Unit"
    assert data[0]["status"] == "Operational"
    assert data[0]["type"] == "FCU"


@pytest.mark.parametrize("equipment_id",[101,102,103])
def test_get_specific_id(client, equipment_id):
    response =client.get(f"/api/equipment/{equipment_id}")
    assert response.status_code == 200
    data = response.get_json()
    assert isinstance(data, dict)
    assert data["id"] == 102
#     {
#   "id": 102,
#   "name": "Navigational System",
#   "status": "Operational",
#   "type": "NS"
# }
    assert data["name"] == "Navigational System"
    assert data["status"] == "Operational"
    assert data["type"] == "NS"

