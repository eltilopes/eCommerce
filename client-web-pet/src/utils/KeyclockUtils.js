import Constaints from "./Constaints";

class KeyclockUtils {
    validToken(keycloak) {
        console.log("KeyclockService keycloak")   
        console.log(keycloak) 
        if(keycloak.authenticated){
           this.setUserInfos(keycloak)
        }
       
        console.log("fornecedor") 
        console.log(localStorage.getItem(Constaints.FORNECEDOR)) 
        keycloak.onTokenExpired = () => {
        keycloak.updateToken(30).success(() => {
            this.setUserToken(keycloak)
         }).error(() => {console.log("error keycloak.updateToken")});
        }
       
    }
  
    setUserInfos(keycloak){
        this.setUserToken(keycloak.token)
        this.setUserUUID(keycloak.idTokenParsed.sub)
        this.setUserFornecedor(keycloak)
    }

    setUserInfosEmpty(){
        this.setUserToken("")
        this.setUserUUID("")
        this.setUserFornecedor()
    }

    setUserToken(token){
        localStorage.setItem(Constaints.TOKEN, token); //set keycloak token to localStorag
    }

    setUserUUID(uuid){
        localStorage.setItem(Constaints.UUID_USER, uuid); //set uuidUser to localStorag
    }

    setUserFornecedor(keycloak){
        if(keycloak && keycloak.realmAccess && keycloak.realmAccess.roles){
            localStorage.setItem(Constaints.FORNECEDOR, keycloak.realmAccess.roles.includes(Constaints.FORNECEDOR)); //set role fornecedor  to localStorag
        }else{
            localStorage.setItem(Constaints.FORNECEDOR, false);
        }
    }

  }
  
  export default new KeyclockUtils();
  