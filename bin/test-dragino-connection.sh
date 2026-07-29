#!/usr/bin/env bash
# Diagnostic script to test Semtech UDP 1700 packet forwarder listener for Dragino DLOS8N

PORT=1700
echo "📡 Checking LoRaWAN Gateway Bridge UDP Port ${PORT} for Dragino DLOS8N..."

if command -v nc >/dev/null 2>&1; then
   echo "Testing UDP socket connection on port ${PORT}..."
   nc -z -v -u 127.0.0.1 ${PORT}
else
   echo "nc (netcat) is not installed. Checking active listening ports..."
   ss -lupn | grep ":${PORT}" || netstat -an | grep "${PORT}"
fi

echo "✅ Diagnostic complete. Make sure Dragino DLOS8N is configured to send UDP packets to this IP:${PORT}"
