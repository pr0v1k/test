import paramiko

device_ips = ["10.0.19." + str(i) for i in range(1, 30)]
username = "admin"
password = "rbhgbxdjryf"
commands = [
    "/snmp/set enabled=yes",
    "/snmp/set contact=\"itram@fitocosmetic.ru\"",
    "/snmp/set trap-version=2",
    "/snmp/set trap-generators=\"\"",
    "/snmp/community/set name=public addresses=10.0.29.29 numbers=0"
]

def run_commands_on_device(ip, username, password, commands):
    try:
        client = paramiko.SSHClient()
        client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        client.connect(ip, username=username, password=password)
        for command in commands:
            stdin, stdout, stderr = client.exec_command(command)
            print(f"Vipolnenie {command}: {stdout.read().decode('utf-8')}")
        client.close()
        print(f"Vse ok {ip}")
    except Exception as e:
        print(f"Oshibka {ip}: {e}")

for ip in device_ips:
    run_commands_on_device(ip, username, password, commands)
