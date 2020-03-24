#!/bin/sh

pidwait()
{
  wait $1
  ls
}

echo "Start of pidwait..."
sleep_amount=10
sleep ${sleep_amount} &
pid=$(pgrep -f "sleep ${sleep_amount}")
pidwait ${pid}
echo "End of pidwait..."
