# Wazuh Basic Usage:

Start this machine after the boxes you wish to use with an EDR have already been spun up. The dashboard can be accessed by navigating to the IP address of the Wazuh machine in a web browser; currently, this will be at https://192.168.56.100. The dashboard can be logged into with the credentials admin:WazuhPass1? . The added machines should appear in the dashboard with some default logs already pulled for aggregation, which can be further customized as desired.

As a note, there is a wazuh-ansible project, but this was found to be extremely challenging to make function correctly. As a result, this box is provisioned by using ansible to simply execute the necessary shell commands to perform a quick installation of the appropriate Wazuh software and start it up