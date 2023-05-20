FROM docker.io/tailscale/tailscale:v1.40

RUN apk --no-cache add py3-pip shadow supervisor jq \
    && pip3 install ansible

RUN useradd -m -s /bin/ash ansible-operator

USER ansible-operator

WORKDIR /home/ansible-operator
ENV HOME=/home/ansible-operator

COPY requirements.yml ${HOME}/requirements.yml
RUN ansible-galaxy collection install -r ${HOME}/requirements.yml \
 && chmod -R ug+rwx ${HOME}/.ansible

COPY watches.yaml ${HOME}/watches.yaml
COPY roles/ ${HOME}/roles/
COPY playbooks/ ${HOME}/playbooks/

USER root

COPY docker/supervisord.conf /etc/supervisord.conf

ENTRYPOINT ["supervisord", "-c", "/etc/supervisord.conf"]
