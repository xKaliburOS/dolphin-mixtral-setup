ollama serve > /dev/null &
until ollama create badbad -f ./Modelfile
do
sleep 1
done
PID=$!
kill -9 $PID
