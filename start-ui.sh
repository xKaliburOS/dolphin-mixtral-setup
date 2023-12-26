ollama serve > /dev/null &
PID=$!
trap ctrl_c INT

function ctrl_c() {
    kill -9 $PID
}
cd ollama-webui/backend
if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
    . "$HOME/miniconda3/etc/profile.d/conda.sh"
else
    export PATH="$HOME/miniconda3/bin:$PATH"
fi

conda activate

uvicorn main:app --host 0.0.0.0 --port 8081

kill -9 $PID
