FROM jboss/keycloak:10.0.2

COPY docker-entrypoint.sh /opt/jboss/tools

RUN mkdir -p /opt/jboss/keycloak/modules/org/mindrot/jbcrypt/main/
COPY --chown=1000:0 module.xml /opt/jboss/keycloak/modules/org/mindrot/jbcrypt/main/
ADD --chown=1000:0 https://repo1.maven.org/maven2/org/mindrot/jbcrypt/0.4/jbcrypt-0.4.jar /opt/jboss/keycloak/modules/org/mindrot/jbcrypt/main/
ADD --chown=1000:0 https://github.com/leroyguillaume/keycloak-bcrypt/releases/download/1.4.0/keycloak-bcrypt-1.4.0.jar /opt/jboss/keycloak/standalone/deployments/

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]
CMD ["-b", "0.0.0.0"]
