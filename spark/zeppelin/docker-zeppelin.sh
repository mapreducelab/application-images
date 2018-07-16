export ZEPPELIN_HOME=/opt/zeppelin
export ZEPPELIN_CONF_DIR="${ZEPPELIN_HOME}/conf"

echo "=== Launching Zeppelin under Docker ==="
/opt/zeppelin/bin/zeppelin.sh "${ZEPPELIN_CONF_DIR}"
