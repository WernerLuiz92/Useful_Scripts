import subprocess
import socket
import syslog
import sys
import os
from dotenv import load_dotenv


env_path = '/usr/local/etc/.env'
env = load_dotenv(dotenv_path=env_path)
HOSTNAME = os.getenv('DDNS_HOST')
USERNAME = os.getenv('DDNS_USER')
PASSWORD = os.getenv('DDNS_PASS')

def obter_ip_local():
    try:
        # Cria um socket de teste para obter o IP
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(("8.8.8.8", 80))
        ip_local = s.getsockname()[0]
        s.close()
        return ip_local
    except socket.error:
        return None

def registrar_log(mensagem, nivel=syslog.LOG_INFO):
    function_name = sys._getframe(1).f_code.co_name
    file_name = sys._getframe(1).f_code.co_filename
    line_number = sys._getframe(1).f_lineno

    syslog.syslog(nivel, f"{function_name} ({file_name}:{line_number}): {mensagem}")

def atualizar_noip():
    if not USERNAME or not PASSWORD or not HOSTNAME:
        registrar_log("As variáveis de ambiente 'USERNAME', 'PASSWORD' e 'HOSTNAME' não foram carregadas.", syslog.LOG_ERR)
        return

    # Obter o IP local
    ip_local = obter_ip_local()

    if ip_local:
        # Construir o comando noip-duc com o IP local
        comando_noip = f"noip-duc -g {HOSTNAME} -u {USERNAME} -p \"{PASSWORD}\" --once --ip-method static:{ip_local}"

        # Redirecionar a saída e os erros para o journal
        try:
            resultado = subprocess.check_output(comando_noip, shell=True, stderr=subprocess.STDOUT, text=True)
            registrar_log(f"Comando executado: {comando_noip}.".replace(PASSWORD, "******"))
            registrar_log(f"Atualização concluída. \n\tIP local: {ip_local} \n\tHost: {HOSTNAME} \n\tUsuário: {USERNAME}. \n\tResultado: \n{resultado}")
        except subprocess.CalledProcessError as e:
            registrar_log(f"Erro ao executar o comando. \n\tIP local: {ip_local}. \n\tCódigo de retorno: {e.returncode}. \n\tSaída: \n{e.output}", syslog.LOG_ERR)
    else:
        registrar_log("Não foi possível obter o IP local.", syslog.LOG_WARNING)

# Chamar a função para atualizar o noip
atualizar_noip()