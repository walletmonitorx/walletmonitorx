#!/bin/bash
cd "$(dirname "$0")/backend"

# पहले से चल रहे uvicorn को बंद करो (अगर चल रहा है तो)
PID=$(lsof -ti:8000)
if [ ! -z "$PID" ]; then
  echo "⚠️ पुराना server बंद किया जा रहा है (PID: $PID)"
  kill -9 $PID
fi

# Dependencies install करो
pip3 install -r requirements.txt

# नया server चालू करो
echo "🚀 नया server शुरू हो गया: http://127.0.0.1:8000"
python3 -m uvicorn app.main:app --reload --port 8000
