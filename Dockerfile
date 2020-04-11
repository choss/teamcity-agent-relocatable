FROM jetbrains/teamcity-agent

COPY run-agent-relocate.sh /services/run-agent-relocate.sh

CMD /run-services.sh
