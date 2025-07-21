from flask import Flask, request
import requests
import os

app = Flask(__name__)

NTFY_TOPIC = os.getenv("NTFY_TOPIC", "teu-topico")
NTFY_TOKEN = os.getenv("NTFY_TOKEN", "")

@app.route("/alert", methods=["POST"])
def alert():
    data = request.get_json()
    alert = data.get("alerts", [{}])[0]
    annotations = alert.get("annotations", {})
    labels = alert.get("labels", {})
    status = alert.get("status", data.get("status", ""))

    severity = labels.get("severity", "")
    summary = annotations.get("summary", "Prometheus Alert")
    description = annotations.get("description", "")

    # Adiciona emoji conforme o estado do alerta
    if status.lower() == "resolved":
        summary = f"✅ [OK] {summary}\n{description}"
    elif severity.lower() == "critical":
        summary = f"🚨 [ALERT] {summary}\n{description}"
    else:
        mensagem = f"{summary}\n{description}"

    headers = {
        "Authorization": f"Bearer {NTFY_TOKEN}"
    }
    resp = requests.post(f"https://ntfy.sh/{NTFY_TOPIC}", data=summary, headers=headers)
    return ("ok", resp.status_code)

@app.route("/health", methods=["GET"])
def health():
    return {"status": "ok"}, 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)