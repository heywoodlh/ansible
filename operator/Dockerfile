FROM quay.io/operator-framework/ansible-operator:v1.29

COPY requirements.yml ${HOME}/requirements.yml
COPY requirements.txt ${HOME}/requirements.txt
RUN ansible-galaxy collection install -r ${HOME}/requirements.yml \
 && chmod -R ug+rwx ${HOME}/.ansible \
 && pip3 install --user -r ${HOME}/requirements.txt

COPY watches.yaml ${HOME}/watches.yaml
COPY roles/ ${HOME}/roles/
COPY playbooks/ ${HOME}/playbooks/
