ollama serve > /dev/null &
PID=$!
trap ctrl_c INT

function ctrl_c() {
    kill -9 $PID
}
until ollama create badbad -f ./Modelfile
do
sleep 1
done
kill -9 $PID
