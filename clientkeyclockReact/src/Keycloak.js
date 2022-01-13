import Keycloak from "keycloak-js";
const keycloak = new Keycloak({
 url: "http://localhost:8080/auth",
 realm: "ReactAuth",
 clientId: "ReactAuth",
 public_client: true,
 confidential_port: 0
});

export default keycloak;